# Etag should always be quoted - in XML as well as headers...
# handle Content-MD5 for IO stream objects too...
using OpenSSLCrypto.Crypto


type S3Error
    code::String
    message::String
    resource::String
    request_id::String
end

type S3Response
    content_length::Int  
    #Connection (open or closed) - we will not use this  
    date::String    #The date and time Amazon S3 responded, for example, Wed, 01 Mar 2009 12:00:00 GMT.
    server::String  #The name of the server that created the response.
    etag::String
    http_code::Int
# Define common amz fields here

# all header fields
    headers::Dict
    
# All header fields    
    obj::Any
    error::Union(S3Error, Nothing)
    
    S3Response() = new(0, "", "", "", Dict{String,String,}(), nothing, nothing)
end

# TODO: Send Content-MD5 header with all requests having a body....
# TODO: Support IO objects as an interface for file PUT and GET

get() = do_request(:GET, "", "", nothing, nothing, ListAllMyBucketsResult())


del_bucket(bucket::String) = do_request(:DELETE, bucket, "")
del_bucket_cors(bucket::String) = do_request(:DELETE, bucket, "cors")
del_bucket_lifecycle(bucket::String) = do_request(:DELETE, bucket, "lifecycle")
del_bucket_policy(bucket::String) = do_request(:DELETE, bucket, "policy")
del_bucket_tagging(bucket::String) = do_request(:DELETE, bucket, "tagging")
del_bucket_website(bucket::String) = do_request(:DELETE, bucket, "website")

type GetBucketOptions
    delimiter::Union(String, Nothing)
    marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
end

get_bucket(bucket::String, options::Union(GetBucketOptions, Nothing)) = do_request(:GET, bucket, "", options, nothing, resp_obj=ListBucketResult())
get_bucket_acl(bucket::String) = do_request(:GET, bucket, "acl", nothing, nothing, resp_obj=AccessControlPolicy())
get_bucket_cors(bucket::String) = do_request(:GET, bucket, "cors", nothing, nothing, resp_obj=CORSConfiguration())
get_bucket_lifecycle(bucket::String) = do_request(:GET, bucket, "lifecycle", nothing, nothing, resp_obj=LifecycleConfiguration())
get_bucket_policy(bucket::String) = do_request(:GET, bucket, "policy", nothing, nothing, resp_obj=:STRING)
get_bucket_location(bucket::String) = do_request(:GET, bucket, "location", nothing, nothing, resp_obj=LocationConstraint())
get_bucket_logging(bucket::String) = do_request(:GET, bucket, "logging", nothing, nothing, resp_obj=BucketLoggingStatus())
get_bucket_notification(bucket::String) = do_request(:GET, bucket, "notification", nothing, nothing, resp_obj=NotificationConfiguration())
get_bucket_tagging(bucket::String) = do_request(:GET, bucket, "tagging", nothing, nothing, resp_obj=Tagging())

type GetBucketObjectVersionsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    version_id_marker::Union(String, Nothing)
end

get_bucket_object_versions(bucket::String, options::Union(GetBucketObjectVersionsOptions, Nothing)) = do_request(:GET, bucket, "versions", options, nothing, resp_obj=ListVersionsResult())

get_bucket_request_payment(bucket::String) = do_request(:GET, bucket, "requestPayment", nothing, nothing, resp_obj=RequestPaymentConfiguration())
get_bucket_versioning(bucket::String) = do_request(:GET, bucket, "versioning", nothing, nothing, resp_obj=VersioningConfiguration())
get_bucket_website(bucket::String) = do_request(:GET, bucket, "website", nothing, nothing, resp_obj=WebsiteConfiguration())


type GetBucketUploadsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_uploads::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    upload_id_marker::Union(String, Nothing)
end
get_bucket_multipart_uploads(bucket::String, options::Union(GetBucketObjectVersionsOptions, Nothing)) = do_request(:GET, bucket, "uploads", options, nothing, resp_obj=ListMultipartUploadsResult())



function test_bucket(bucket::String)
end

type S3_ACL_Grantee
    email_address::Union(String, Nothing)
    id::Union(String, Nothing)
    uri::Union(String, Nothing)
end

type S3_ACL
    acl::Union(String, Nothing)
    grant_read::Union(Array{S3_ACL_Grantee, 1}, Nothing)
    grant_write::Union(Array{S3_ACL_Grantee, 1}, Nothing)   
    grant_read_acp::Union(Array{S3_ACL_Grantee, 1}, Nothing)    
    grant_write_acp::Union(Array{S3_ACL_Grantee, 1}, Nothing)   
    grant_full_control::Union(Array{S3_ACL_Grantee, 1}, Nothing)
end


function create_bucket(bucket::String, acl::Union(S3_ACL, Nothing), location_constraint::Union(String, Nothing))
    return do_request(:PUT, bucket, "", params, req_body, nothing)
end


set_bucket_acl(bucket::String, acl::Union(S3_ACL, Nothing)) = do_request(:PUT, bucket, "acl", acl)
set_bucket_cors(bucket::String, cors::CORSConfiguration) = do_request(:PUT, bucket, "cors", nothing, cors_xml)
set_bucket_lifecycle(bucket::String, lc::LifecycleConfiguration) = do_request(:PUT, bucket, "lifecycle", nothing, lc_xml)
set_bucket_policy(bucket::String, policy_json::String) = do_request(:PUT, bucket, "policy", nothing, policy_json)

function set_bucket_logging(bucket::String, logging::BucketLoggingStatus)
    do_request(:PUT, bucket, "logging", nothing, logging_xml)
end



function set_bucket_notification(bucket::String, notif::NotificationConfiguration)
    # NOTE: x-amz-sns-test-message-id is returned as a header - needs to be extracted....
    do_request(:PUT, bucket, "notification", nothing, notif_xml)
end

type Tag
    key::String
    value::String
end

# Not a xmlns type
type Tagging
    tagSet::Union(Array{Tag, 1}, Nothing)
end


set_bucket_tagging(bucket::String, tagging::Tagging) = do_request(:PUT, bucket, "tagging", nothing, tagging_xml)
set_bucket_request_payment(bucket::String, pay::RequestPaymentConfiguration) = do_request(:PUT, bucket, "requestPayment", nothing, pay_xml)

function set_bucket_versioning(bucket::String, mfa::Union(String, Nothing), config::VersioningConfiguration)
    #x-amz-mfa is not mandatory if status is suspended
    do_request(:PUT, bucket, "versioning", params, config_xml)

end
set_bucket_website(bucket::String, config::WebsiteConfiguration) = do_request(:PUT, bucket, "website", nothing, config_xml)


######################################
### OPERATIONS ON OBJECTS
######################################

function del_object(bucket::String, key::String, version=nothing, mfa=nothing) 
    #TODO - handle version and mfa
    do_request(:DELETE, bucket, key, hp, qp)
end

type ObjectType
    key::String
    versionId::Union(String, Nothing)
end

type DeleteObjectsType
    object::Array{ObjectType, 1}
    quiet::Union(Bool, Nothing)
end


function del_object_multi(bucket::String, delset::DeleteObjectsType, mfa=nothing)
    # TODO : Make XML out of delset
    #TODO - handle mfa
    do_request(:POST, bucket, "delete", query_params=, req_body=, resp_obj=DeleteResult())
end

type GetObjectOptions
    # These go into the query string
    response_content_type::Union(String, Nothing)   
    response_content_language::Union(String, Nothing)   
    response_expires::Union(String, Nothing)   
    response_cache_control::Union(String, Nothing)   
    response_content_disposition::Union(String, Nothing)   
    response_content_encoding::Union(String, Nothing)   
    
    versionId::Union(String, Nothing)

    # These go into the header
    range::Union(String, Nothing)   
    if_modified_since::Union(String, Nothing)   
    if_unmodified_since::Union(String, Nothing)   
    if_match::Union(String, Nothing)   
    if_none_match::Union(String, Nothing)   
end

function get_object(bucket::String, key::String, options::GetObjectOptions, outstream=nothing)
    # write to out stream if it is an IO Stream, else return an Array of Uint8s
    # TODO : Split options between hdr and query params...
    do_request(:GET, bucket, key, hdr_params=, query_params=, resp_ostream=outstream)
end

function get_object_acl(bucket::String, key::String, version=nothing)
    do_request(:GET, bucket, key, query_params=, resp_obj=AccessControlPolicy())
end

function get_object_torrent(bucket::String, key) 
    # set torrent
    do_request(:GET, bucket, key, query_params=, resp_obj=:BYTE_ARRAY)
end

function describe_object(bucket::String, key::String, options::GetObjectOptions)
    # TODO : Split options between hdr and query params...
    do_request(:HEAD, bucket, key, hdr_params=, query_params=)
end

function test_object(bucket::String, key::String, origin::Union(String, Nothing), method::Union(String, Nothing), headers::Union(String, Nothing))
    do_request(:OPTIONS, bucket, key, hdr_params=)
end

#POST Object

function restore_object(bucket::String, key::String, days::Int)
    # TODO qp = "restore"
    # convert days to RestoreRequest
    do_request(:RESTORE, bucket, key, hdr_params=, query_params=)
end

type PutObjectOptions
# Standard HTTP headers
    cache_control::Union(String, Nothing)
    content_disposition::Union(String, Nothing)
    content_encoding::Union(String, Nothing)
    content_type::Union(String, Nothing)
#Expect  not supported...
    expires::Union(DateTime, Nothing)
    
# x-amz header fields    
    meta::Union(Dict{String, String}, Nothing)
    server_side​_encryption::Union(String, Nothing)   
    storage_class::Union(String, Nothing) 
    website​_redirect_location::Union(String, Nothing)    
    acl::Union(S3_ACL, Nothing)
end

function put_object(bucket::String, key::String, options::PutObjectOptions, data::Union(IOStream, String))
    do_request(:PUT, bucket, key, query_params=, req_istream=instream, req_body=)
end

function put_object_acl(bucket::String, key::String, acl::AccessControlPolicy, version=Union(String, Nothing))
    do_request(:PUT, bucket, key , query_params="?acl", req_body=acl_xml)
end

type CopyMatchOptions
# below prefixed with x-amz-copy-source-
    if_match::Union(String, Nothing)
    if_none_match::Union(String, Nothing) 
    if_unmodified_since::Union(String, Nothing)
    if_modified_since::Union(String, Nothing)
end

type CopyObjectOptions
# All are x-amz options
    copy_source::String  
    metadata_directive::Union(String, Nothing)
    match_options::Union(CopyMatchOptions, Nothing)
    
# x-amz only header fields    
    meta::Union(Dict{String, String}, Nothing)
    server_side​_encryption::Union(String, Nothing)   
    storage_class::Union(String, Nothing) 
    website​_redirect_location::Union(String, Nothing)    
    acl::Union(S3_ACL, Nothing)
end

function copy_object(dest_bucket::String, dest_key::String, options::CopyObjectOptions)
    do_request(:PUT, dest_bucket, dest_key, hdr_params=, resp_obj = CopyObjectResult())
end

function initiate_multipart_upload(bucket::String, key::String, options::PutObjectOptions)
    do_request(:POST, bucket, key, query_params="uploads", hdr_params=, resp_obj = InitiateMultipartUploadResult())
end

function upload_part(bucket::String, key::String, part_number::String, upload_id::String, data::Union(IOStream, String))
    do_request(:PUT, bucket, key, query_params=, hdr_params=, resp_obj=, req_istream=)
end

type CopyUploadPartOptions
    copy_source::String   
    source_range::Union(String, Nothing)
    match_options::Union(CopyMatchOptions, Nothing)
end

function copy_upload_part(bucket::String, key::String, part_number::String, upload_id::String, options::CopyUploadPartOptions)
    do_request(:PUT, bucket, key, query_params=, hdr_params=, resp_obj=CopyPartResult())
end

type S3PartTag
    part_number::String
    etag::String
end

function complete_multipart_upload(bucket::String, key::String, upload_id::String, part_ids::Vector{S3PartTag})
    do_request(:POST, bucket, key, query_params=upload_id..., req_body=req_xml, resp_obj=CompleteMultipartUploadResult())
end


function abort_multipart_upload(bucket::String, key::String, upload_id::String)
    do_request(:DELETE, bucket, key, query_params=upload_id...)
end

function list_upload_parts(bucket::String, key::String, upload_id::String)
    do_request(:GET, bucket, key, query_params=upload_id..., resp_obj=ListPartsResult())
end

function do_request(verb, bucket, req_tag; hdr_params=nothing, query_params=nothing, req_body=nothing, req_istream=nothing, resp_obj=nothing, resp_ostream=nothing)
    return(S3Response, resp)
end



const SUB_RESOURCES = 
    Set("acl", 
        "lifecycle", 
        "location", 
        "logging", 
        "notification", 
        "partNumber", 
        "policy", 
        "requestPayment", 
        "torrent", 
        "uploadId", 
        "uploads", 
        "versionId", 
        "versioning", 
        "versions",
        "website",
        "delete"
        )

function do_http(env::AWSEnv, verb, bucket, key, sub_resources, http_hdrs, amz_hdrs; content_type="", req_body=nothing, req_istream=nothing)
    if req_body != nothing
        digest = zeros(Uint8, 16)
        MD5(req_body, length(req_body), digest)
        md5 = bytestring(Codecs.encode(Base64, Crypto.md5(req_body)))
    elseif req_istream != nothing
        # Read the entire istream to get the MD5 of the same.
        md5 = bytestring(Codecs.encode(Base64, Crypto.md5(req_istream)))
    else
        md5 = ""
    end
    
    (new_amz_hdrs, full_path, s_b64) = canonicalize_and_sign(env::AWSEnv, verb, bucket, key, sub_resources, md5, content_type, amz_hdrs)
    
    url = "https://s3.amazonaws.com" * full_path
    
    if verb == :GET
        
    elseif verb == :PUT
    elseif verb == :POST
    elseif verb == :DELETE
    elseif verb == :HEAD
    else
        error("Unknown HTTP verb $verb")
    end
    
    
end
        
        
function canonicalize_and_sign(env::AWSEnv, verb, bucket, key, sub_resources, md5, content_type, amz_hdrs)
    new_amz_hdrs, amz_hdrs_str = get_canon_amz_headers(amz_hdrs)
    full_path = get_canonicalized_resource(bucket, key, sub_resources)

    str2sign = string(verb) * "\n" *
    md5 * "\n" *
    content_type * "\n" * "\n" * # Using x-amz-date instead of Date.
    amz_hdrs_str * full_path
    
    s_raw = Crypto.hmacsha1_digest(str2sign, env.aws_seckey)
    s_b64 = bytestring(Codecs.encode(Base64, s_raw))
    
    return new_amz_hdrs, full_path, s_b64
end

function get_canonicalized_resource(bucket, key, sub_resources)
    if length(bucket) > 0
        part1 = (beginswith(bucket, "/") ? "" : "/") * bucket * 
        (beginswith(key, "/") ? "" : "/") * key 
    else
        part1 = "/"
    end
    
    if length(sub_resources) > 0
        return part1 * "?" * HTTPC.urlencode_query_params(sort(sub_resources))
    else
        return part1
    end
end

function get_canon_amz_headers(headers::Vector{Tuple})
    if length(headers) == 0 return end
    
    lcase = [k,v -> (lowercase(strip(k)), v) for k,v in headers]
    if contains(lcase, "x-amz-date")
        delete!(lcase, "x-amz-date")
    end
    
    #rfc2616
    lcase["x-amz-date"] = format("EEE, dd MMM yyyy hh:mm:ss V", Calendar.tz(Calendar.now(), "UTC"))
    
    reduced = Dict(String, String)()
    for k,v in lcase
        if beginswith("x-amz-", k)
            new_v = strip(replace(v, "\n", ' '))
            if contains(reduced, k)
                ev = reduced[k]
                reduced[k] = ev * "," * new_v
            else
                reduced[k] = new_v
            end
        end
    end

    # Use the sorted one in the final request too since the order of 'values' 
    sorted = sort(collect(reduced))
    canon_hdr_str = reduce((acc,elem) -> begin (k,v) = elem; acc * k * ":" * v * "\n" end, "", sorted) 
    
    return sorted, canon_hdr_str
end











