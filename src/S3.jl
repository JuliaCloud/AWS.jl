module S3

# Etag should always be quoted - in XML as well as headers...
using AWS
using AWS.Crypto
using HTTPClient.HTTPC
using LibExpat
using Base.get

import AWS.xml

include("s3_types.jl")


macro req_n_process(resp_obj_type)
    quote
        s3_resp = do_request(env, ro)
        if (isa(s3_resp.obj, AbstractString) &&  (length(s3_resp.obj) > 0))
            s3_resp.pd = xp_parse(s3_resp.obj)
            s3_resp.obj = $(esc(resp_obj_type))(s3_resp.pd)
        end
        s3_resp
    end
end



type S3Response
    content_length::Int
    #Connection (open or closed) - we will not use this
    date::AbstractString    #The date and time Amazon S3 responded, for example, Wed, 01 Mar 2009 12:00:00 GMT.
    server::AbstractString  #The name of the server that created the response.
    eTag::AbstractString
    http_code::Int

    # Common amz fields here
    delete_marker::Bool
    id_2::AbstractString
    request_id::AbstractString
    version_id::AbstractString

# all header fields
    headers::Dict

# All header fields
    obj::Any
    pd::Union{ETree, Void}

    S3Response() = new(0, "", "", "", 0, false, "","","",Dict{AbstractString,AbstractString}(), nothing, nothing)
end
export S3Response

type RO # RequestOptions
    verb::Symbol                  # HTTP verb
    bkt::AbstractString                   # bucket
    key::AbstractString                   # object id typically
    sub_res::Vector{Tuple}
    http_hdrs::Vector{Tuple}
    amz_hdrs::Vector{Tuple}
    cont_typ::AbstractString
    body::AbstractString
    istream::Any
    ostream::Any

    RO() = RO(:GET, "", "")
    RO(verb, bkt, key) = new(verb, bkt, key, Tuple[], Tuple[], Tuple[], "", "", nothing, nothing)
end
export RO

function list_all_buckets(env::AWSEnv)
    ro = RO(:GET, "", "")
    @req_n_process(ListAllMyBucketsResult)
end


function del_bkt(env::AWSEnv, bkt::AbstractString)
    ro = RO(:DELETE, bkt, "")

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_cors(env::AWSEnv, bkt::AbstractString)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("cors", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_lifecycle(env::AWSEnv, bkt::AbstractString)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("lifecycle", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end


function del_bkt_policy(env::AWSEnv, bkt::AbstractString)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("policy", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_tagging(env::AWSEnv, bkt::AbstractString)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("tagging", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_website(env::AWSEnv, bkt::AbstractString)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("website", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end


function get_bkt(env::AWSEnv, bkt::AbstractString; options::GetBucketOptions=GetBucketOptions())
    ro = RO(:GET, bkt, "")
    ro.sub_res=get_subres(Tuple[], options)

    @req_n_process(ListBucketResult)
end

function get_bkt_acl(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("acl", "")]

    @req_n_process(AccessControlPolicy)
end

function get_bkt_cors(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("cors", "")]

    @req_n_process(CORSConfiguration)
end

function get_bkt_lifecycle(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("lifecycle", "")]

    s3_resp = do_request(env, ro)
    s3_resp

end

function get_bkt_policy(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("policy", "")]

    s3_resp = do_request(env, ro)
    s3_resp

end

function get_bkt_location(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("location", "")]

    @req_n_process(LocationConstraint)
end

function get_bkt_logging(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("logging", "")]

    @req_n_process(BucketLoggingStatus)
end

function get_bkt_notification(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("notification", "")]

    @req_n_process(NotificationConfiguration)
end

function get_bkt_tagging(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("tagging", "")]

    @req_n_process(Tagging)

end


function get_bkt_object_versions(env::AWSEnv, bkt::AbstractString; options::GetBucketObjectVersionsOptions=GetBucketObjectVersionsOptions())
    ro = RO(:GET, bkt, "")
    ro.sub_res=get_subres([("versions", "")], options)

    @req_n_process(ListVersionsResult)
end

function get_bkt_request_payment(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("requestPayment", "")]

    @req_n_process(RequestPaymentConfiguration)
end

function get_bkt_versioning(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("versioning", "")]

    @req_n_process(VersioningConfiguration)
end

function get_bkt_website(env::AWSEnv, bkt::AbstractString)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("website", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function test_bkt(env::AWSEnv, bkt::AbstractString)
    ro = RO(:HEAD, bkt, "")

    s3_resp = do_request(env, ro)
    s3_resp
end


function get_bkt_multipart_uploads(env::AWSEnv, bkt::AbstractString; options::GetBucketUploadsOptions=GetBucketUploadsOptions())
    ro = RO(:GET, bkt, "")
    ro.sub_res=get_subres([("uploads", "")], options)

    @req_n_process(ListMultipartUploadsResult)
end





function create_bkt(env::AWSEnv, bkt::AbstractString; acl::Union{S3_ACL, Void}=nothing, config::Union{CreateBucketConfiguration, Void}=nothing)
    ro = RO(:PUT, bkt, "")
    if isa(acl, AccessControlPolicy)
        ro.amz_hdrs = amz_headers(Tuple[], acl)
    end
    if (config != nothing)
        ro.body = xml(config)
    end

    s3_resp = do_request(env, ro)
    s3_resp
end


function set_bkt_acl(env::AWSEnv, bkt::AbstractString, acl:: Union{AccessControlPolicy, S3_ACL})
    ro = RO(:PUT, bkt, "")
    ro.sub_res=[("acl", "")]
    if isa(acl, AccessControlPolicy)
        ro.body = xml(acl)
    else
        ro.amz_hdrs = amz_headers(Tuple[], acl)
    end

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_cors(env::AWSEnv, bkt::AbstractString, cors::CORSConfiguration)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("cors", "")]
    ro.body = xml(cors)

    s3_resp = do_request(env, ro)
    s3_resp
end

#TODO : Create LifecycleCongig type
function set_bkt_lifecycle(env::AWSEnv, bkt::AbstractString, lifecycleconfig::AbstractString)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("lifecycle", "")]
    ro.body = lifecycleconfig

    s3_resp = do_request(env, ro)
    s3_resp

end

function set_bkt_policy(env::AWSEnv, bkt::AbstractString, policy_json::AbstractString)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("policy", "")]
    ro.body = policy_json

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_logging(env::AWSEnv, bkt::AbstractString, logging::BucketLoggingStatus)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("logging", "")]
    ro.body = xml(logging)

    s3_resp = do_request(env, ro)
    s3_resp
end



function set_bkt_notification(env::AWSEnv, bkt::AbstractString, notif::NotificationConfiguration)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("notification", "")]
    ro.body = xml(notif)

    s3_resp = do_request(env, ro)
    s3_resp
end


function set_bkt_tagging(env::AWSEnv, bkt::AbstractString, tagging::Tagging)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("tagging", "")]
    ro.body = xml(tagging)

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_request_payment(env::AWSEnv, bkt::AbstractString, pay::RequestPaymentConfiguration)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("requestPayment", "")]
    ro.body = xml(pay)

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_versioning(env::AWSEnv, bkt::AbstractString, config::VersioningConfiguration; mfa::AbstractString="")
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("versioning", "")]
    ro.body = xml(config)
    if (mfa != "") ro.amz_hdrs = [("mfa", mfa)] end

    s3_resp = do_request(env, ro)
    s3_resp
end

#TODO: Define WebsiteConfiguration as a type and use that....
function set_bkt_website(env::AWSEnv, bkt::AbstractString, websiteconfig::AbstractString)
    ro = RO(:PUT, bkt, "")
    ro.sub_res = [("website", "")]
    ro.body = websiteconfig

    s3_resp = do_request(env, ro)
    s3_resp
end

######################################
### OPERATIONS ON OBJECTS
######################################

function del_object(env::AWSEnv, bkt::AbstractString, key::AbstractString; version_id::AbstractString="", mfa::AbstractString="")
    ro = RO(:DELETE, bkt, key)
    if (version_id != "") ro.sub_res = [("versionId", version_id)] end
    if (mfa != "") ro.amz_hdrs = [("mfa", mfa)] end

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_object_multi(env::AWSEnv, bkt::AbstractString, delset::DeleteObjectsType; mfa::AbstractString="")
    ro = RO(:POST, bkt, "")
    ro.sub_res = [("delete", "")]
    ro.body= xml(delset)
    if (mfa != "") ro.amz_hdrs = [("mfa", mfa)] end

    @req_n_process(DeleteResult)
end


function get_object(env::AWSEnv, bkt::AbstractString, key::AbstractString; options::GetObjectOptions=GetObjectOptions(), out::Union{IO, AbstractString, Void}=nothing, version_id::AbstractString="")
    ro = RO(:GET, bkt, key)
    ro.sub_res = Tuple[]

    if (version_id != "") push!(ro.sub_res, ("versionId", version_id)) end
    ro.sub_res = query_params(ro.sub_res, options)

    ro.http_hdrs = http_headers(Tuple[], options)
    ro.ostream = out

    s3_resp = do_request(env, ro, conv_to_string=false)
    s3_resp
end

function get_object_acl(env::AWSEnv, bkt::AbstractString, key::AbstractString; version_id::AbstractString="")
    ro = RO(:GET, bkt, key)
    ro.sub_res=[("acl", "")]
    if (version_id != "") push!(ro.sub_res, ("versionId", version_id)) end

    @req_n_process(AccessControlPolicy)
end

function get_object_torrent(env::AWSEnv, bkt::AbstractString, key::AbstractString, out::Union{IO, AbstractString}) # out is either an IOStream or a filename
    ro = RO(:GET, bkt, key)
    ro.sub_res=[("torrent","")]
    ro.ostream = out

    s3_resp = do_request(env, ro, conv_to_string=false)
    s3_resp
end

function describe_object(env::AWSEnv, bkt::AbstractString, key::AbstractString; options::GetObjectOptions=GetObjectOptions(), version_id::AbstractString="")
    ro = RO(:HEAD, bkt, key)
    ro.http_hdrs = http_headers(options)
    if (version_id != "") ro.sub_res=[("versionId", version_id)] end

    s3_resp = do_request(env, ro)
    s3_resp
end

function test_object(env::AWSEnv, bkt::AbstractString, key::AbstractString, origin::AbstractString, acc_ctrl_req_method::AbstractString; acc_ctrl_req_hdrs::Union{AbstractString, Void}=nothing)
    ro = RO(:OPTIONS, bkt, key)
    ro.http_hdrs = [("Origin", origin), ("Access-Control-Request-Method",acc_ctrl_req_method)]
    if headers != nothing
        push!(ro.http_hdrs, ("Access-Control-Request-Headers", acc_ctrl_req_hdrs))
    end

    s3_resp = do_request(env, ro)
    s3_resp
end

#post_object, a different version of put_object is not supported


function restore_object(env::AWSEnv, bkt::AbstractString, key::AbstractString, days::Int)
    # TODO qp = "restore"
    # convert days to RestoreRequest
    ro = RO(:POST, bkt, key)

    ro.sub_res=[("restore", "")]
    ro.body = "<RestoreRequest xmlns=\"http://s3-$(env.region).amazonaws.com/doc/2006-3-01\"><Days>$(days)</Days></RestoreRequest>"

    s3_resp = do_request(env, ro)
    s3_resp
end


function put_object(env::AWSEnv, bkt::AbstractString, key::AbstractString, data:: Union{IO, AbstractString, Tuple}; content_type="", options::PutObjectOptions=PutObjectOptions(), version_id::AbstractString="")
    ro = RO(:PUT, bkt, key)

    ro.amz_hdrs = amz_headers(Tuple[], options)
    ro.http_hdrs = http_headers(Array(Tuple, 0), options)
    if (content_type != "") ro.cont_typ = content_type end

    if isa(data, AbstractString)
        ro.body = data
    elseif isa(data, IO)
        ro.istream = data
    elseif (isa(data, Tuple) && data[1] == :file)
        ro.istream = data[2]
    else
        error("Void to upload")
    end

    if (version_id != "") ro.sub_res=[("versionId", version_id)] end

    s3_resp = do_request(env, ro)
    s3_resp
end

function put_object_acl(env::AWSEnv, bkt::AbstractString, key::AbstractString, acl:: Union{AccessControlPolicy, S3_ACL})
    ro = RO(:PUT, bkt, key)
    ro.sub_res=[("acl", "")]
    if isa(acl, AccessControlPolicy)
        ro.body = xml(acl)
    else
        ro.amz_hdrs = amz_headers(Tuple[], acl)
    end

    s3_resp = do_request(env, ro)
    s3_resp
end


function copy_object(env::AWSEnv, dest_bkt::AbstractString, dest_key::AbstractString, options::CopyObjectOptions, version_id::AbstractString="")
    ro = RO(:PUT, dest_bkt, dest_key)
    ro.amz_hdrs = amz_headers(Tuple[], options)
    if (version_id != "")
        ro.sub_res=[("versionId", version_id)]
    end

    @req_n_process(CopyObjectResult)
end

function initiate_multipart_upload(env::AWSEnv, bkt::AbstractString, key::AbstractString; content_type="", options::PutObjectOptions=PutObjectOptions())
    ro = RO(:POST, bkt, key)
    ro.amz_hdrs = amz_headers(Tuple[], options)
    ro.http_hdrs = http_headers(Array(Tuple, 0), options)
    if (content_type != "") ro.cont_typ = content_type end
    ro.sub_res=[("uploads", "")]

    @req_n_process(InitiateMultipartUploadResult)
end

function upload_part(env::AWSEnv, bkt::AbstractString, key::AbstractString, part_number::AbstractString, upload_id::AbstractString, data:: Union{IO, AbstractString, Tuple})
    ro = RO(:PUT, bkt, key)
    ro.sub_res = [("partNumber", "$(part_number)"), ("uploadId", "$(upload_id)")]

    if isa(data, AbstractString)
        ro.body = data
    elseif isa(data, IO)
        ro.istream = data
    elseif (isa(data, Tuple) && data[1] == :file)
        ro.istream = data[2]
    else
        error("Void to upload")
    end

    s3_resp = do_request(env, ro)
    s3_resp

end

function copy_upload_part(env::AWSEnv, bkt::AbstractString, key::AbstractString, part_number::AbstractString, upload_id::AbstractString, options::CopyUploadPartOptions)
    ro = RO(:PUT, bkt, key)
    ro.sub_res = [("partNumber", "$(part_number)"), ("uploadId", "$(upload_id)")]
    ro.amz_hdrs = amz_headers(options)

    @req_n_process(CopyPartResult)
end


function complete_multipart_upload(env::AWSEnv, bkt::AbstractString, key::AbstractString, upload_id::AbstractString, part_ids::Vector{S3PartTag})
    ro = RO(:POST, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)")]

    ro.body = xml("CompleteMultipartUpload", part_ids)

    @req_n_process(CompleteMultipartUploadResult)
end


function abort_multipart_upload(env::AWSEnv, bkt::AbstractString, key::AbstractString, upload_id::AbstractString)
    ro = RO(:DELETE, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function list_upload_parts(env::AWSEnv, bkt::AbstractString, key::AbstractString,
    upload_id::AbstractString;
    max_parts:: Union{Int, Void}=nothing,
    part_number_marker:: Union{Int, Void}=nothing)

    ro = RO(:GET, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)"), ("max-parts", "$max_parts"), ("part-number-marker", "$part_number_marker")]

    @req_n_process(ListPartsResult)
end

function do_request(env::AWSEnv, ro::RO; conv_to_string=true)
    http_resp = do_http(env, ro)

    s3_resp = S3Response()

    s3_resp.http_code = http_resp.http_code
    cl_s = get(http_resp.headers, "Content-Length", [""])[1]
    if cl_s != ""
        s3_resp.content_length = Base.parse(Int, cl_s)
    end
    s3_resp.date = get(http_resp.headers, "Date", [""])[1]
    s3_resp.eTag = get(http_resp.headers, "ETag", [""])[1]
    s3_resp.server = get(http_resp.headers, "Server", [""])[1]

    s3_resp.delete_marker = lowercase(get(http_resp.headers, "x-amz-delete-marker", ["false"])[1]) == "true" ? true : false
    s3_resp.id_2 = get(http_resp.headers, "x-amz-id-2", [""])[1]
    s3_resp.request_id = get(http_resp.headers, "x-amz-request-id", [""])[1]
    s3_resp.version_id = get(http_resp.headers, "x-amz-version-id", [""])[1]

    s3_resp.headers = http_resp.headers

    if (http_resp.http_code > 299)
        if  (search(Base.get(http_resp.headers, "Content-Type", [""])[1], "/xml") != 0:-1) && isa(http_resp.body, IO) && (position(http_resp.body) > 0)
            s3_resp.pd = xp_parse(bytestring(http_resp.body))
            if s3_resp.pd.name == "Error"
                s3_resp.obj = S3Error(s3_resp.pd)
            end
        end
    else
        s3_resp.obj = conv_to_string ? bytestring(http_resp.body) : http_resp.body
    end

    s3_resp
end

function do_http(env::AWSEnv, ro::RO)
    if isa(ro.body, AbstractString) && (ro.body != "")
#        digest = zeros(UInt8, 16)
#        MD5(body, length(body), digest)
        md5 = base64encode(Crypto.md5(ro.body))
    elseif isa(ro.istream, IO)
        # Read the entire istream to get the MD5 of the same.
        md5 = base64encode(Crypto.md5(ro.istream))
        seekstart(ro.istream)
    elseif isa(ro.istream, AbstractString)
        # The file will be read twice (once to get the MD5 and once while sending - no other way?
        md5 = base64encode(Crypto.md5_file(ro.istream))
    else
        md5 = ""
    end

    (new_amz_hdrs, full_path, s_b64) = canonicalize_and_sign(env, ro, md5)

    all_hdrs = new_amz_hdrs
    (md5 != "") ? push!(all_hdrs, ("Content-MD5", md5)) : nothing
    (ro.cont_typ != "") ? push!(all_hdrs, ("Content-Type", ro.cont_typ)) : nothing

    # Remove Content-MD5 and Expect headers from the passed http_hdrs
    for (name, value) in ro.http_hdrs
        lname = lowercase(strip(name))
        if (lname != "content-md5") && (lname != "expect") && (lname != "content-type")
            push!(all_hdrs, (name, value))
        elseif (lname == "content-type") && (ro.cont_typ == "")
            # If content type has been set as part of RO, it will be used.
            push!(all_hdrs, (name, value))
        end
    end

    push!(all_hdrs, ("Authorization",  "AWS " * env.aws_id * ":" * s_b64))

    url = "https://s3-$(env.region).amazonaws.com" * full_path

    http_options = RequestOptions(headers=all_hdrs, ostream=ro.ostream, request_timeout=env.timeout, auto_content_type=false)

    if env.dbg
        println("Verb : " * string(ro.verb))
        println("URL : " * url)
        println("Headers : ")
        for (k,v) in http_options.headers
            println("  $k : $v")
        end
        println("Body : " * string(ro.body))
    end

    if env.dry_run
        return HTTPC.Response()
    end

    if ro.verb == :GET
        http_resp = HTTPC.get(url, http_options)
    elseif (ro.verb == :PUT) || (ro.verb == :POST)
        senddata = isa(ro.istream, IO) ? ro.istream :
                   isa(ro.istream, AbstractString) ? (:file, ro.istream) :
                   (isa(ro.body, AbstractString) && (ro.body != "")) ? ro.body :
                   ""
#                   error("Must specify either a body or istream for PUT/POST")

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

     if env.dbg
         println("Response : ", http_resp)
     end

    return http_resp
end


function canonicalize_and_sign(env::AWSEnv, ro::RO, md5::AbstractString)
    if env.aws_token != ""
        push!(ro.amz_hdrs, ("x-amz-security-token", env.aws_token))
    end
    (new_amz_hdrs, amz_hdrs_str) = get_canon_amz_headers(ro.amz_hdrs)
    (full_path, sign_path) = get_canonicalized_resource(ro)

    str2sign = string(ro.verb) * "\n" *
    md5 * "\n" *
    ro.cont_typ * "\n" * "\n" * # Using x-amz-date instead of Date.
    amz_hdrs_str * sign_path

    if (env.dbg)
        println("String to sign:\n$(str2sign)")
    end

    s_b64 = base64encode(Crypto.hmacsha1_digest(str2sign, env.aws_seckey))

    return new_amz_hdrs, full_path, s_b64
end

const qstr_sign_list = Set([
    "acl",
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
    "response-content-type",
    "response-content-language",
    "response-expires",
    "response-cache-control",
    "response-content-disposition",
    "response-content-encoding",
    "delete"]
)

function get_canonicalized_resource(ro::RO)
    if length(ro.bkt) > 0
        part1 = (startswith(ro.bkt, "/") ? "" : "/") * ro.bkt
        if length(ro.key) > 0
            part1 = part1 * (startswith(ro.key, "/") ? "" : "/") * ro.key
        else
            part1 = part1 * "/"
        end
    else
        part1 = "/"
    end

    sorted = sort(ro.sub_res)
    signlist = filter(x -> begin (k,v) = x; in(k, qstr_sign_list) end, sorted)

    signparams = ""
    for x in signlist
        k,v = x;
        if (v != "")
            ep = string(k) * "=" * string(v)
        else
            ep = string(k)
        end
        if signparams == ""
            signparams = ep
        else
            signparams = signparams  * "&" * ep
        end
    end

    canon_res = part1 * "?" * HTTPC.urlencode_query_params(sorted)

    canon_sign_res = part1
    if length(signlist) > 0
        canon_sign_res = canon_sign_res * "?" * signparams
    end

    return (canon_res, canon_sign_res)
end

function get_canon_amz_headers(headers::Vector{Tuple})
    lcase = [(lowercase(strip(k)), v) for (k,v) in headers]

    # remove any existing amz-date header
    lcase = filter(x -> begin k,v = x; k != "x-amz-date" end, lcase)

    push!(lcase, ("x-amz-date", rfc1123_date()))

    reduced = Dict{AbstractString, AbstractString}()
    for (k,v) in lcase
        if startswith(k,"x-amz-")
            new_v = strip(replace(v, "\n", ' '))
            if haskey(reduced, k)
                ev = reduced[k]
                reduced[k] = ev * "," * new_v
            else
                reduced[k] = new_v
            end
        end
    end

    # Use the sorted one in the final request too since the order of 'values'
    sorted = sort([(x[1], x[2]) for x in collect(reduced)])
    canon_hdr_str = ""
    for x in sorted
        (k,v) = x
        canon_hdr_str = canon_hdr_str * k * ":" * v * "\n"
    end

    return sorted, canon_hdr_str
end

rfc1123_date() = rfc1123_date(now(Dates.UTC))
function rfc1123_date(dt)
    y,m,d = Dates.yearmonthday(dt)
    h,mi,s = Dates.hour(dt),Dates.minute(dt),Dates.second(dt)

    dayofweek = Dates.dayabbr(dt)
    dd = lpad(d,2,"0")
    monthname = Dates.monthabbr(dt)
    yy = y < 0 ? @sprintf("%05i",y) : lpad(y,4,"0")
    hh = lpad(h,2,"0")
    mii = lpad(mi,2,"0")
    ss = lpad(s,2,"0")

    #format("EEE, dd MMM yyyy HH:mm:ss V")
    # "Tue, 24 Feb 2015 05:21:51 GMT"
    return "$dayofweek, $dd $monthname $yy $hh:$mii:$ss GMT"
end
rfc1123_date(d::Void) = nothing


end






