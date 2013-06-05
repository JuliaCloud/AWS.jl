# Etag should always be quoted - in XML as well as headers...
# handle Content-MD5 for IO stream objects too...
using AWS.Crypto
using libCURL.HTTPC
using LibExpat

macro req_n_process(resp_obj_type)
    quote
        s3_resp = do_request(ro)
        if (s3_resp.obj == nothing) && (typeof(s3_resp.pd) == ParsedData)
            s3_resp.obj = $(esc(resp_obj_type))(s3_resp.pd)
        end
        s3_resp
    end
end


type S3Response
    content_length::Int  
    #Connection (open or closed) - we will not use this  
    date::String    #The date and time Amazon S3 responded, for example, Wed, 01 Mar 2009 12:00:00 GMT.
    server::String  #The name of the server that created the response.
    eTag::String
    http_code::Int

    # Common amz fields here
    delete_marker::Bool
    id_2::String
    request_id::String
    version_id::String

# all header fields
    headers::Dict
    
# All header fields    
    obj::Any
    pd::Union(ParsedData, Nothing)
    
    S3Response() = new(0, "", "", "", false, "","","",Dict{String,String,}(), nothing, nothing, nothing)
end

type RO # RequestOptions
    verb::Symbol                  # HTTP verb
    bkt::String                   # bucket
    key::String                   # object id typically  
    sub_res::Vector{Tuple}
    http_hdrs::Vector{Tuple}
    amz_hdrs::Vector{Tuple}
    cont_typ::String
    body::String
    istream::Any
    ostream::Any
    
    RO() = new(:GET, "", "", [], [], [], "", "", nothing, nothing)
    RO(verb, bkt, key) = new(verb, bkt, key, [], [], [], "", "", nothing, nothing)
end

# TODO: Send Content-MD5 header with all requests having a body....
# TODO: Support IO objects as an interface for file PUT and GET

get() = do_request(:GET, "", "", nothing, nothing, ListAllMyBucketsResult())


del_bkt(bkt::String) = do_request(:DELETE, bkt, "")
del_bkt_cors(bkt::String) = do_request(:DELETE, bkt, "cors")
del_bkt_lifecycle(bkt::String) = do_request(:DELETE, bkt, "lifecycle")
del_bkt_policy(bkt::String) = do_request(:DELETE, bkt, "policy")
del_bkt_tagging(bkt::String) = do_request(:DELETE, bkt, "tagging")
del_bkt_website(bkt::String) = do_request(:DELETE, bkt, "website")

type GetBucketOptions
    delimiter::Union(String, Nothing)
    marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
end

get_bkt(bkt::String, options::Union(GetBucketOptions, Nothing)) = do_request(:GET, bkt, "", options, nothing, resp_obj=ListBucketResult())
get_bkt_acl(bkt::String) = do_request(:GET, bkt, "acl", nothing, nothing, resp_obj=AccessControlPolicy())
get_bkt_cors(bkt::String) = do_request(:GET, bkt, "cors", nothing, nothing, resp_obj=CORSConfiguration())
get_bkt_lifecycle(bkt::String) = do_request(:GET, bkt, "lifecycle", nothing, nothing, resp_obj=LifecycleConfiguration())
get_bkt_policy(bkt::String) = do_request(:GET, bkt, "policy", nothing, nothing, resp_obj=:STRING)
get_bkt_location(bkt::String) = do_request(:GET, bkt, "location", nothing, nothing, resp_obj=LocationConstraint())
get_bkt_logging(bkt::String) = do_request(:GET, bkt, "logging", nothing, nothing, resp_obj=BucketLoggingStatus())
get_bkt_notification(bkt::String) = do_request(:GET, bkt, "notification", nothing, nothing, resp_obj=NotificationConfiguration())
get_bkt_tagging(bkt::String) = do_request(:GET, bkt, "tagging", nothing, nothing, resp_obj=Tagging())

type GetBucketObjectVersionsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    version_id_marker::Union(String, Nothing)
end

get_bkt_object_versions(bkt::String, options::Union(GetBucketObjectVersionsOptions, Nothing)) = do_request(:GET, bkt, "versions", options, nothing, resp_obj=ListVersionsResult())

get_bkt_request_payment(bkt::String) = do_request(:GET, bkt, "requestPayment", nothing, nothing, resp_obj=RequestPaymentConfiguration())
get_bkt_versioning(bkt::String) = do_request(:GET, bkt, "versioning", nothing, nothing, resp_obj=VersioningConfiguration())
get_bkt_website(bkt::String) = do_request(:GET, bkt, "website", nothing, nothing, resp_obj=WebsiteConfiguration())


type GetBucketUploadsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_uploads::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    upload_id_marker::Union(String, Nothing)
end
get_bkt_multipart_uploads(bkt::String, options::Union(GetBucketObjectVersionsOptions, Nothing)) = do_request(:GET, bkt, "uploads", options, nothing, resp_obj=ListMultipartUploadsResult())



function test_bkt(bkt::String)
end

type S3_ACL_Grantee
    email_address::Union(String, Nothing)
    id::Union(String, Nothing)
    uri::Union(String, Nothing)
    S3_ACL_Grantee() = new(nothing, nothing, nothing)
end
function hdr_str(g::S3_ACL_Grantee)
    if g.email_address != nothing
        return "emailAddress=$(g.email_address)"
    elseif g.id != nothing
        return "id=$(g.id)"
    elseif g.uri != nothing
        return "uri=$(g.uri)"
    else
        error("At least one of the grantee types must be defined.")
    end
end

type S3_ACL
    acl::Union(String, Nothing)
    grant_read::Vector{S3_ACL_Grantee}
    grant_write::Vector{S3_ACL_Grantee}   
    grant_read_acp::Vector{S3_ACL_Grantee}
    grant_write_acp::Vector{S3_ACL_Grantee}
    grant_full_control::Vector{S3_ACL_Grantee}
    
    S3_ACL() = new(nothing, S3_ACL_Grantee[], S3_ACL_Grantee[], S3_ACL_Grantee[], S3_ACL_Grantee[], S3_ACL_Grantee[])
end
function amz_headers(hdrs, o::S3_ACL)
    @add_amz_hdr("acl", o.acl)
    add_acl_grantee(hdrs, "grant-read", o.grant_read)
    add_acl_grantee(hdrs, "grant-write", o.grant_write)
    add_acl_grantee(hdrs, "grant-read-acp", o.grant_read_acp)
    add_acl_grantee(hdrs, "grant-write-acp", o.grant_write_acp)
    add_acl_grantee(hdrs, "grant-full-control", o.grant_full_control)
    hdrs
end

function add_acl_grantee(hdrs, xamz_name::String, arr::Vector{S3_ACL_Grantee})
    for a in arr
        @add_amz_hdr(xamz_name, hdr_str(a))
    end
    hdrs
end

function create_bkt(bkt::String, acl::Union(S3_ACL, Nothing), location_constraint::Union(String, Nothing))
    return do_request(:PUT, bkt, "", params, req_body, nothing)
end


set_bkt_acl(bkt::String, acl::Union(S3_ACL, Nothing)) = do_request(:PUT, bkt, "acl", acl)
set_bkt_cors(bkt::String, cors::CORSConfiguration) = do_request(:PUT, bkt, "cors", nothing, cors_xml)
set_bkt_lifecycle(bkt::String, lc::LifecycleConfiguration) = do_request(:PUT, bkt, "lifecycle", nothing, lc_xml)
set_bkt_policy(bkt::String, policy_json::String) = do_request(:PUT, bkt, "policy", nothing, policy_json)

function set_bkt_logging(bkt::String, logging::BucketLoggingStatus)
    do_request(:PUT, bkt, "logging", nothing, logging_xml)
end



function set_bkt_notification(bkt::String, notif::NotificationConfiguration)
    # NOTE: x-amz-sns-test-message-id is returned as a header - needs to be extracted....
    do_request(:PUT, bkt, "notification", nothing, notif_xml)
end

type Tag
    key::String
    value::String
end

# Not a xmlns type
type Tagging
    tagSet::Union(Array{Tag, 1}, Nothing)
end


set_bkt_tagging(bkt::String, tagging::Tagging) = do_request(:PUT, bkt, "tagging", nothing, tagging_xml)
set_bkt_request_payment(bkt::String, pay::RequestPaymentConfiguration) = do_request(:PUT, bkt, "requestPayment", nothing, pay_xml)

function set_bkt_versioning(bkt::String, mfa::Union(String, Nothing), config::VersioningConfiguration)
    #x-amz-mfa is not mandatory if status is suspended
    do_request(:PUT, bkt, "versioning", params, config_xml)

end
set_bkt_website(bkt::String, config::WebsiteConfiguration) = do_request(:PUT, bkt, "website", nothing, config_xml)


######################################
### OPERATIONS ON OBJECTS
######################################

function del_object(bkt::String, key::String, version=nothing, mfa=nothing) 
    #TODO - handle version and mfa
    do_request(:DELETE, bkt, key, hp, qp)
end

type ObjectType
    key::String
    versionId::Union(String, Nothing)
end

type DeleteObjectsType
    object::Array{ObjectType, 1}
    quiet::Union(Bool, Nothing)
end


function del_object_multi(bkt::String, delset::DeleteObjectsType, mfa=nothing)
    # TODO : Make XML out of delset
    #TODO - handle mfa
    do_request(:POST, bkt, "delete", query_params=, req_body=, resp_obj=DeleteResult())
end

type GetObjectOptions
    # These go into the query string
    response_cont_typ::Union(String, Nothing)   
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

function get_object(bkt::String, key::String, options::GetObjectOptions, outstream=nothing)
    # write to out stream if it is an IO Stream, else return an Array of Uint8s
    # TODO : Split options between hdr and query params...
    do_request(:GET, bkt, key, hdr_params=, query_params=, resp_ostream=outstream)
end

function get_object_acl(bkt::String, key::String, version=nothing)
    do_request(:GET, bkt, key, query_params=, resp_obj=AccessControlPolicy())
end

function get_object_torrent(bkt::String, key) 
    # set torrent
    do_request(:GET, bkt, key, query_params=, resp_obj=:BYTE_ARRAY)
end

function describe_object(bkt::String, key::String, options::GetObjectOptions)
    # TODO : Split options between hdr and query params...
    do_request(:HEAD, bkt, key, hdr_params=, query_params=)
end

function test_object(bkt::String, key::String, origin::Union(String, Nothing), method::Union(String, Nothing), headers::Union(String, Nothing))
    do_request(:OPTIONS, bkt, key, hdr_params=)
end

#POST Object

function restore_object(bkt::String, key::String, days::Int)
    # TODO qp = "restore"
    # convert days to RestoreRequest
    do_request(:RESTORE, bkt, key, hdr_params=, query_params=)
end


function put_object(bkt::String, key::String, options::PutObjectOptions, data::Union(IOStream, String))
    do_request(:PUT, bkt, key, query_params=, req_istream=instream, req_body=)
end

function put_object_acl(bkt::String, key::String, acl::AccessControlPolicy, version=Union(String, Nothing))
    do_request(:PUT, bkt, key , query_params="?acl", req_body=acl_xml)
end

function copy_object(dest_bkt::String, dest_key::String, options::CopyObjectOptions, version_id::String="")
    ro = RO(:PUT, dest_bkt, dest_key)
    ro.amz_hdrs = amz_headers(Array(Tuple,0), options)
    if (version_id != "")
        ro.sub_res=[("versionId", version_id)]
    end
    
    @req_n_process(CopyObjectResult)
end

function initiate_multipart_upload(bkt::String, key::String; content_type="", options::PutObjectOptions=PutObjectOptions())
    ro = RO(:POST, bkt, key)
    ro.amz_hdrs = amz_headers(Array(Tuple,0), options)
    ro.http_hdrs = http_headers(Array(Tuple, 0), options)
    if (content_type != "") ro.content_type = content_type end
    ro.sub_res=[("uploads", "")]

    @req_n_process(InitiateMultipartUploadResult)
end

function upload_part(bkt::String, key::String, part_number::String, upload_id::String, data::Union(IOStream, String, Tuple))
    ro = RO(:PUT, bkt, key)
    ro.sub_res = [("partNumber", "$(part_number)"), ("uploadId", "$(upload_id)")]
    
    if isa(data, String) 
        ro.body = data
    elseif isa(data, IO) 
        ro.istream = data
    elseif (isa(data, Tuple) && data[1] == :file)
        ro.istream = data[2]
    else
        error("Nothing to upload")
    end
    
    s3_resp = do_request(ro)
    s3_resp
    
end

function copy_upload_part(bkt::String, key::String, part_number::String, upload_id::String, options::CopyUploadPartOptions)
    ro = RO(:PUT, bkt, key)
    ro.sub_res = [("partNumber", "$(part_number)"), ("uploadId", "$(upload_id)")]
    ro.amz_hdrs = amz_headers(options)
    
    @req_n_process(CopyPartResult)
end


function complete_multipart_upload(bkt::String, key::String, upload_id::String, part_ids::Vector{S3PartTag})
    ro = RO(:POST, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)")]
   
    ro.body = xml("CompleteMultipartUpload", part_ids)
    
    @req_n_process(CompleteMultipartUploadResult)
end


function abort_multipart_upload(bkt::String, key::String, upload_id::String)
    ro = RO(:DELETE, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)")]
    
    s3_resp = do_request(ro)
    s3_resp
end

function list_upload_parts(bkt::String, key::String, 
    upload_id::String; 
    max_parts::Union(Int, Nothing)=nothing, 
    part_number​_marker::Union(Int, Nothing)=nothing)
    
    ro = RO(:GET, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)"), ("max-parts", "$max_parts"), ("part-number​-marker", "$part_number​_marker")]
    
    @req_n_process(ListPartsResult)
end


macro add_amz_hdr(name, value) 
    quote
        if ($(esc(value)) != nothing) push!(hdrs, ("x-amz-" * $(esc(name)), $(esc(value)))) end
    end
end

function do_request(ro::RO)
    http_resp = do_http(ro)
    
    s3_resp = S3Response()
    
    s3_resp.http_code = http_resp.http_code
    cl_s = get(http_resp.headers, "Content-Length", "") 
    if cl_s != ""
        s3_resp.content_length = int(cl_s)
    end
    s3_resp.date = get(http_resp.headers, "Date", "") 
    s3_resp.eTag = get(http_resp.headers, "ETag", "") 
    s3_resp.server = get(http_resp.headers, "Server", "") 
    
    s3_resp.delete_marker = lowercase(get(http_resp.headers, "x-amz-delete-marker", "false")) == "true" ? true : false 
    s3_resp.id_2 = get(http_resp.headers, "x-amz-id-2", "") 
    s3_resp.request_id = get(http_resp.headers, "x-amz-request-id", "") 
    s3_resp.version_id = get(http_resp.headers, "x-amz-version-id", "") 

    s3_resp.headers = http_resp.headers

    if  get(http_resp.headers, "Content-Type", "") == "application/xml"
        s3_resp.pd = xp_parse(resp.body)
        if s3_resp.pd.name == "Error"
            s3_resp.obj = S3Error(s3_resp.pd) 
        end
    end
    
    s3_resp
end


function do_http(env::AWSEnv, ro::RO)
    if ro.body != nothing
        digest = zeros(Uint8, 16)
        MD5(body, length(body), digest)
        md5 = bytestring(Codecs.encode(Base64, Crypto.md5(ro.body)))
    elseif isa(ro.istream, IO)
        # Read the entire istream to get the MD5 of the same.
        md5 = bytestring(Codecs.encode(Base64, Crypto.md5(ro.istream)))
        seekstart(ro.istream)
    elseif isa(ro.istream, String)
        # The file will be read twice (once to get the MD5 and once while sending - no other way?
        md5 = bytestring(Codecs.encode(Base64, Crypto.md5_file(ro.istream)))
    else
        md5 = ""
    end
    
    (new_amz_hdrs, full_path, s_b64) = canonicalize_and_sign(env, ro, md5)
    
    all_hdrs = new_amz_hdrs
    (md5 != "") ? push!(all_hdrs, [("Content-MD5", md5)]) : nothing
    (cont_typ != "") ? push!(all_hdrs, [("Content-Type", cont_typ)]) : nothing

    # Remove Content-MD5 and Expect headers from the passed http_hdrs
    for (name, value) in ro.http_hdrs
        lname = lowercase(strip(name))
        if (lname != "content-md5")) && (lname != "expect") && (lname != "content-type")
            push!(all_hdrs, (name, value))
        elseif (lname == "content-type") && (ro.cont_typ == "")
            # If content type has been set as part of RO, it will be used.
            push!(all_hdrs, (name, value))
        end
    end

    push!(all_hdrs, [("Authorization",  "AWS " * env.aws_id * ":" * s_b64)])
    
    url = "https://s3.amazonaws.com" * full_path
    
    http_options = RequestOptions(headers=all_hdrs, ostream=ro.ostream, request_timeout=env.timeout)
    if ro.verb == :GET
        http_resp = HTTPC.get(url, http_options)
    elseif (ro.verb == :PUT) || (ro.verb == :POST)
        senddata = (ro.body != nothing) ? ro.body :
                   isa(ro.istream, IO) ? ro.istream :
                   isa(ro.istream, String) ? (file: ro.istream) :
                   error("Must specify either a body or istream for PUT/POST")
    
        if (ro.verb == :PUT)
            http_resp = HTTPC.put(url, senddata, http_options)
        else 
            http_resp = HTTPC.post(url, senddata, http_options)
        end
        
    elseif ro.verb == :DELETE
        http_resp = HTTPC.delete(url, http_options)
        
    elseif ro.verb == :HEAD
        http_resp = HTTPC.head(url, http_options)
    
    else
        error("Unknown HTTP verb $verb")
    end
    
    return http_resp
end
        
        
function canonicalize_and_sign(env::AWSEnv, ro::RO, md5::String)
    new_amz_hdrs, amz_hdrs_str = get_canon_amz_headers(ro.amz_hdrs)
    full_path = get_canonicalized_resource(ro)

    str2sign = string(ro.verb) * "\n" *
    md5 * "\n" *
    ro.cont_typ * "\n" * "\n" * # Using x-amz-date instead of Date.
    amz_hdrs_str * full_path
    
    s_raw = Crypto.hmacsha1_digest(str2sign, env.aws_seckey)
    s_b64 = bytestring(Codecs.encode(Base64, s_raw))
    
    return new_amz_hdrs, full_path, s_b64
end

function get_canonicalized_resource(ro::RO)
    if length(ro.bkt) > 0
        part1 = (beginswith(ro.bkt, "/") ? "" : "/") * ro.bkt * 
        (beginswith(ro.key, "/") ? "" : "/") * ro.key 
    else
        part1 = "/"
    end
    
    if length(ro.sub_res) > 0
        return part1 * "?" * HTTPC.urlencode_query_params(sort(ro.sub_res))
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
    
    lcase["x-amz-date"] = rfc1123_date(Calendar.now())
    
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

function rfc1123_date(d::DateTime)
    format("EEE, dd MMM yyyy hh:mm:ss V", Calendar.tz(d, "UTC"))
end









