module S3

# Etag should always be quoted - in XML as well as headers...
using AWS
using AWS.Crypto
using Requests
using LightXML
using Base.get

using URIParser

import AWS: xml, elements_by_tagname

include("s3_types.jl")

def_rto = 0.0
null_cb(curl) = nothing

mutable struct RequestOptions
    blocking::Bool
    query_params::Vector{Tuple}
    request_timeout::Float64
    callback::Union{Function,Bool}
    content_type::String
    headers::Vector{Tuple}
    ostream::Union{IO, String, Void}
    auto_content_type::Bool

    RequestOptions(; blocking=true, query_params=Array{Tuple}(0), request_timeout=def_rto, callback=null_cb, content_type="", headers=Array{Tuple}(0), ostream=nothing, auto_content_type=true) =
    new(blocking, query_params, request_timeout, callback, content_type, headers, ostream, auto_content_type)
end

mutable struct Response
    body
    headers :: Dict{String, Vector{String}}
    http_code
    total_time
    bytes_recd::Integer

    Response() = new(nothing, Dict{String, Vector{String}}(), 0, 0.0, 0)
end



macro req_n_process(env, ro, resp_obj_type)
    quote
        s3_resp = do_request($(esc(env)), $(esc(ro)))
        if (isa(s3_resp.obj, String) &&  (length(s3_resp.obj) > 0))
			s3_resp.pd = LightXML.root(LightXML.parse_string(s3_resp.obj))
            s3_resp.obj = $(esc(resp_obj_type))(s3_resp.pd)
        end
        s3_resp
    end
end



mutable struct S3Response
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

    obj::Any
    ## pd::Union{ETree, Void}
    pd::Union{LightXML.XMLElement, Void}

    S3Response() = new(0, "", "", "", 0, false, "","","",Dict{String,String}(), nothing, nothing)
end
export S3Response

mutable struct RO # RequestOptions
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

    RO() = RO(:GET, "", "")
    RO(verb, bkt, key) = new(verb, bkt, key, Tuple[], Tuple[], Tuple[], "", "", nothing, nothing)
end
export RO

function list_all_buckets(env::AWSEnv)
    ro = RO(:GET, "", "")
    @req_n_process(env, ro, ListAllMyBucketsResult)
end


function del_bkt(env::AWSEnv, bkt::String)
    ro = RO(:DELETE, bkt, "")

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_cors(env::AWSEnv, bkt::String)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("cors", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_lifecycle(env::AWSEnv, bkt::String)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("lifecycle", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end


function del_bkt_policy(env::AWSEnv, bkt::String)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("policy", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_tagging(env::AWSEnv, bkt::String)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("tagging", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_bkt_website(env::AWSEnv, bkt::String)
    ro = RO(:DELETE, bkt, "")
    ro.sub_res=[("website", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end


function get_bkt(env::AWSEnv, bkt::String; options::GetBucketOptions=GetBucketOptions())
    ro = RO(:GET, bkt, "")
    ro.sub_res=get_subres(Tuple[], options)

    @req_n_process(env, ro, ListBucketResult)
end

function get_bkt_acl(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("acl", "")]

    @req_n_process(env, ro, AccessControlPolicy)
end

function get_bkt_cors(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("cors", "")]

    @req_n_process(env, ro, CORSConfiguration)
end

function get_bkt_lifecycle(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("lifecycle", "")]

    s3_resp = do_request(env, ro)
    s3_resp

end

function get_bkt_policy(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("policy", "")]

    s3_resp = do_request(env, ro)
    s3_resp

end

function get_bkt_location(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("location", "")]

    @req_n_process(env, ro, LocationConstraint)
end

function get_bkt_logging(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("logging", "")]

    @req_n_process(env, ro, BucketLoggingStatus)
end

function get_bkt_notification(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("notification", "")]

    @req_n_process(env, ro, NotificationConfiguration)
end

function get_bkt_tagging(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("tagging", "")]

    @req_n_process(env, ro, Tagging)

end


function get_bkt_object_versions(env::AWSEnv, bkt::String; options::GetBucketObjectVersionsOptions=GetBucketObjectVersionsOptions())
    ro = RO(:GET, bkt, "")
    ro.sub_res=get_subres([("versions", "")], options)

    @req_n_process(env, ro, ListVersionsResult)
end

function get_bkt_request_payment(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("requestPayment", "")]

    @req_n_process(env, ro, RequestPaymentConfiguration)
end

function get_bkt_versioning(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("versioning", "")]

    @req_n_process(env, ro, VersioningConfiguration)
end

function get_bkt_website(env::AWSEnv, bkt::String)
    ro = RO(:GET, bkt, "")
    ro.sub_res=[("website", "")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function test_bkt(env::AWSEnv, bkt::String)
    ro = RO(:HEAD, bkt, "")

    s3_resp = do_request(env, ro)
    s3_resp
end

"""
split a s3 path to bucket name and key
"""
function splits3(path::AbstractString)
    path = replace(path, r"^s3://", s"")
    bkt, key = split(path, "/", limit = 2)
    return String(bkt), String(key)
end

"""
transfer s3 file to local and return local file name
`Inputs:`
awsEnv: AWS awsEnviroment
s3name: String, s3 file path
lcname: String, local temporal folder path or local file name
`Outputs:`
lcname: String, local file name
"""
function Base.download(awsEnv::AWSEnv, s3fname::AbstractString, lcfname::AbstractString)
    # directly return if not s3 file
    if !iss3(s3fname)
        return s3fname
    end

    if isdir(lcfname)
        lcfname = joinpath(lcfname, basename(s3fname))
    end
    # remove existing file
    if isfile(lcfname)
        rm(lcfname)
    elseif !isdir(dirname(lcfname))
        # create local directory
        mkdir(dirname(lcfname))
    end
    # get bucket name and key
    bkt,key = splits3(s3fname)
    # download s3 file using awscli
    f = open(lcfname, "w")
    resp = S3.get_object(awsEnv, bkt, key)
    # check that the file exist
    @assert resp.http_code == 200
    write( f, resp.obj )
    close(f)
    # run(`aws s3 cp $(s3name) $(lcfname)`)
    return lcfname
end

function get_bkt_multipart_uploads(env::AWSEnv, bkt::String; options::GetBucketUploadsOptions=GetBucketUploadsOptions())
    ro = RO(:GET, bkt, "")
    ro.sub_res=get_subres([("uploads", "")], options)

    @req_n_process(env, ro, ListMultipartUploadsResult)
end





function create_bkt(env::AWSEnv, bkt::String; acl::Union{S3_ACL, Void}=nothing, config::Union{CreateBucketConfiguration, Void}=nothing)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    if isa(acl, AccessControlPolicy)
        ro.amz_hdrs = amz_headers(Tuple[], acl)
    end
    if (config != nothing)
        ro.body = xml(config)
    end

    s3_resp = do_request(env, ro)
    s3_resp
end


function set_bkt_acl(env::AWSEnv, bkt::String, acl:: Union{AccessControlPolicy, S3_ACL})
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res=[("acl", "")]
    if isa(acl, AccessControlPolicy)
        ro.body = xml(acl)
    else
        ro.amz_hdrs = amz_headers(Tuple[], acl)
    end

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_cors(env::AWSEnv, bkt::String, cors::CORSConfiguration)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("cors", "")]
    ro.body = xml(cors)

    s3_resp = do_request(env, ro)
    s3_resp
end

#TODO : Create LifecycleCongig type
function set_bkt_lifecycle(env::AWSEnv, bkt::String, lifecycleconfig::String)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("lifecycle", "")]
    ro.body = lifecycleconfig

    s3_resp = do_request(env, ro)
    s3_resp

end

function set_bkt_policy(env::AWSEnv, bkt::String, policy_json::String)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("policy", "")]
    ro.body = policy_json

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_logging(env::AWSEnv, bkt::String, logging::BucketLoggingStatus)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("logging", "")]
    ro.body = xml(logging)

    s3_resp = do_request(env, ro)
    s3_resp
end



function set_bkt_notification(env::AWSEnv, bkt::String, notif::NotificationConfiguration)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("notification", "")]
    ro.body = xml(notif)

    s3_resp = do_request(env, ro)
    s3_resp
end


function set_bkt_tagging(env::AWSEnv, bkt::String, tagging::Tagging)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("tagging", "")]
    ro.body = xml(tagging)

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_request_payment(env::AWSEnv, bkt::String, pay::RequestPaymentConfiguration)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("requestPayment", "")]
    ro.body = xml(pay)

    s3_resp = do_request(env, ro)
    s3_resp
end

function set_bkt_versioning(env::AWSEnv, bkt::String, config::VersioningConfiguration; mfa::String="")
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("versioning", "")]
    ro.body = xml(config)
    if (mfa != "") ro.amz_hdrs = [("mfa", mfa)] end

    s3_resp = do_request(env, ro)
    s3_resp
end

#TODO: Define WebsiteConfiguration as a type and use that....
function set_bkt_website(env::AWSEnv, bkt::String, websiteconfig::String)
    ro = RO(:PUT, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("website", "")]
    ro.body = websiteconfig

    s3_resp = do_request(env, ro)
    s3_resp
end

######################################
### OPERATIONS ON OBJECTS
######################################

function del_object(env::AWSEnv, bkt::String, key::String; version_id::String="", mfa::String="")
    ro = RO(:DELETE, bkt, key)
    if (version_id != "") ro.sub_res = [("versionId", version_id)] end
    if (mfa != "") ro.amz_hdrs = [("mfa", mfa)] end

    s3_resp = do_request(env, ro)
    s3_resp
end

function del_object_multi(env::AWSEnv, bkt::String, delset::DeleteObjectsType; mfa::String="")
    ro = RO(:POST, bkt, "")
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("delete", "")]
    ro.body= xml(delset)
    if (mfa != "") ro.amz_hdrs = [("mfa", mfa)] end

    @req_n_process(env, ro, DeleteResult)
end


function get_object(env::AWSEnv, bkt::String, key::String; options::GetObjectOptions=GetObjectOptions(), out::Union{IO, String, Void}=nothing, version_id::String="")
    ro = RO(:GET, bkt, key)
    ro.sub_res = Tuple[]

    if (version_id != "") push!(ro.sub_res, ("versionId", version_id)) end
    ro.sub_res = query_params(ro.sub_res, options)

    ro.http_hdrs = http_headers(Tuple[], options)
    ro.ostream = out

    s3_resp = do_request(env, ro, conv_to_string=false)
    s3_resp
end

function get_object_acl(env::AWSEnv, bkt::String, key::String; version_id::String="")
    ro = RO(:GET, bkt, key)
    ro.sub_res=[("acl", "")]
    if (version_id != "") push!(ro.sub_res, ("versionId", version_id)) end

    @req_n_process(env, ro, AccessControlPolicy)
end

function get_object_torrent(env::AWSEnv, bkt::String, key::String, out::Union{IO, String}) # out is either an IOStream or a filename
    ro = RO(:GET, bkt, key)
    ro.sub_res=[("torrent","")]
    ro.ostream = out

    s3_resp = do_request(env, ro, conv_to_string=false)
    s3_resp
end

function describe_object(env::AWSEnv, bkt::String, key::String; options::GetObjectOptions=GetObjectOptions(), version_id::String="")
    ro = RO(:HEAD, bkt, key)
    ro.http_hdrs = http_headers(Tuple[], options)
    if (version_id != "") ro.sub_res=[("versionId", version_id)] end

    s3_resp = do_request(env, ro)
    s3_resp
end

function test_object(env::AWSEnv, bkt::String, key::String, origin::String, acc_ctrl_req_method::String; acc_ctrl_req_hdrs::Union{String, Void}=nothing)
    ro = RO(:OPTIONS, bkt, key)
    ro.http_hdrs = [("Origin", origin), ("Access-Control-Request-Method",acc_ctrl_req_method)]
    if headers != nothing
        push!(ro.http_hdrs, ("Access-Control-Request-Headers", acc_ctrl_req_hdrs))
    end

    s3_resp = do_request(env, ro)
    s3_resp
end

#post_object, a different version of put_object is not supported


function restore_object(env::AWSEnv, bkt::String, key::String, days::Int)
    # TODO qp = "restore"
    # convert days to RestoreRequest
    ro = RO(:POST, bkt, key)
	ro.cont_typ = "application/octet-stream"

    ro.sub_res=[("restore", "")]
    ro.body = "<RestoreRequest xmlns=\"http://$(amz_s3_endpoint(env))/doc/2006-3-01\"><Days>$(days)</Days></RestoreRequest>"

    s3_resp = do_request(env, ro)
    s3_resp
end


function put_object(env::AWSEnv, bkt::String, key::String, data:: Union{IO, String, Tuple}; content_type="", options::PutObjectOptions=PutObjectOptions(), version_id::String="")
    ro = RO(:PUT, bkt, key)
	ro.cont_typ = "application/octet-stream"

    ro.amz_hdrs = amz_headers(Tuple[], options)
    ro.http_hdrs = http_headers(Array{Tuple}(0), options)
    if (content_type != "") ro.cont_typ = content_type end

    if isa(data, String)
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

function put_object_acl(env::AWSEnv, bkt::String, key::String, acl:: Union{AccessControlPolicy, S3_ACL})
    ro = RO(:PUT, bkt, key)
	ro.cont_typ = "application/octet-stream"
    ro.sub_res=[("acl", "")]
    if isa(acl, AccessControlPolicy)
        ro.body = xml(acl)
    else
        ro.amz_hdrs = amz_headers(Tuple[], acl)
    end

    s3_resp = do_request(env, ro)
    s3_resp
end


function copy_object(env::AWSEnv, dest_bkt::String, dest_key::String, options::CopyObjectOptions, version_id::String="")
    ro = RO(:PUT, dest_bkt, dest_key)
	ro.cont_typ = "application/octet-stream"
    ro.amz_hdrs = amz_headers(Tuple[], options)
    if (version_id != "")
        ro.sub_res=[("versionId", version_id)]
    end

    @req_n_process(env, ro, CopyObjectResult)
end

function initiate_multipart_upload(env::AWSEnv, bkt::String, key::String; content_type="", options::PutObjectOptions=PutObjectOptions())
    ro = RO(:POST, bkt, key)
	ro.cont_typ = "application/octet-stream"
    ro.amz_hdrs = amz_headers(Tuple[], options)
    ro.http_hdrs = http_headers(Array{Tuple}(0), options)
    if (content_type != "") ro.cont_typ = content_type end
    ro.sub_res=[("uploads", "")]

    @req_n_process(env, ro, InitiateMultipartUploadResult)
end

function upload_part(env::AWSEnv, bkt::String, key::String, part_number::String, upload_id::String, data:: Union{IO, String, Tuple})
    ro = RO(:PUT, bkt, key)
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("partNumber", "$(part_number)"), ("uploadId", "$(upload_id)")]

    if isa(data, String)
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

function copy_upload_part(env::AWSEnv, bkt::String, key::String, part_number::String, upload_id::String, options::CopyUploadPartOptions)
    ro = RO(:PUT, bkt, key)
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("partNumber", "$(part_number)"), ("uploadId", "$(upload_id)")]
    ro.amz_hdrs = amz_headers(options)

    @req_n_process(env, ro, CopyPartResult)
end


function complete_multipart_upload(env::AWSEnv, bkt::String, key::String, upload_id::String, part_ids::Vector{S3PartTag})
    ro = RO(:POST, bkt, key)
	ro.cont_typ = "application/octet-stream"
    ro.sub_res = [("uploadId", "$(upload_id)")]

    ro.body = xml("CompleteMultipartUpload", part_ids)

    @req_n_process(env, ro, CompleteMultipartUploadResult)
end


function abort_multipart_upload(env::AWSEnv, bkt::String, key::String, upload_id::String)
    ro = RO(:DELETE, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)")]

    s3_resp = do_request(env, ro)
    s3_resp
end

function list_upload_parts(env::AWSEnv, bkt::String, key::String,
    upload_id::String;
    max_parts:: Union{Int, Void}=nothing,
    part_number_marker:: Union{Int, Void}=nothing)

    ro = RO(:GET, bkt, key)
    ro.sub_res = [("uploadId", "$(upload_id)"), ("max-parts", "$max_parts"), ("part-number-marker", "$part_number_marker")]

    @req_n_process(env, ro, ListPartsResult)
end

function do_request(env::AWSEnv, ro::RO; conv_to_string=true)
    http_resp = do_http(env, ro)

    s3_resp = S3Response()

    s3_resp.http_code = http_resp.status
    cl_s = get(http_resp.headers, "Content-Length", [""])[1]
    if cl_s != ""
        s3_resp.content_length = Base.parse(Int, cl_s)
    end

    s3_resp.date = get(http_resp.headers, "Date", [""])
    s3_resp.server = get(http_resp.headers, "Server", [""])

    ## s3_resp.delete_marker = lowercase(get(http_resp.headers, "x-amz-delete-marker", ["false"])[1]) == "true" ? true : false
    ## s3_resp.id_2 = get(http_resp.headers, "x-amz-id-2", [""])[1]
    ## s3_resp.request_id = get(http_resp.headers, "x-amz-request-id", [""])[1]
    ## s3_resp.version_id = get(http_resp.headers, "x-amz-version-id", [""])[1]


    s3_resp.headers = http_resp.headers

    if (http_resp.status > 299)
        if  (search(Base.get(http_resp.headers, "Content-Type", [""]), "/xml") != 0:-1)
            s3_resp.obj = S3Error(LightXML.root(LightXML.parse_string(String(copy(http_resp.data)))))
        else
            s3_resp.pd = String(copy(http_resp.data))
        end
    else
        s3_resp.obj = conv_to_string ? String(copy(http_resp.data)) : http_resp.data
    end

    s3_resp
end

function do_http(env::AWSEnv, ro::RO)
    if isa(ro.body, String) && (ro.body != "")
#        digest = zeros(UInt8, 16)
#        MD5(body, length(body), digest)
        md5 = base64encode(Crypto.md5(ro.body))
    elseif isa(ro.istream, IO)
        # Read the entire istream to get the MD5 of the same.
        md5 = base64encode(Crypto.md5(ro.istream))
        seekstart(ro.istream)
    elseif isa(ro.istream, String)
        # The file will be read twice (once to get the MD5 and once while sending - no other way?
        md5 = base64encode(Crypto.md5_file(ro.istream))
    else
        md5 = ""
    end

    (new_amz_hdrs, full_path, s_b64) = canonicalize_and_sign(env, ro, md5)
	## @show new_amz_hdrs, full_path, s_b64

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

    url = "https://$(amz_s3_endpoint(env))" * full_path

    http_options = RequestOptions(headers=all_hdrs, ostream=ro.ostream, request_timeout=env.timeout, auto_content_type=false)

    if env.dbg
        info("Verb : " * string(ro.verb))
        info("URL : " * url)
        info("Headers : ")
        for (k,v) in http_options.headers
            info("  $k : $v")
        end
        info("Body : " * string(ro.body))
    end

    if env.dry_run
        return Requests.Response()
    end

	headers = Dict(
        "User-Agent" => "Requests.jl/0.0.0",
        "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
    )
	for (k,v) in all_hdrs
        ## info("  $k : $v")
		setindex!(headers, v, k)
	end

	## @show headers
	## TODO To include ostream, auto_content_type and timeout values for all VERBS !

    if ro.verb == :GET
        http_resp = Requests.get(url; headers = headers)
    elseif (ro.verb == :PUT) || (ro.verb == :POST)
        senddata = isa(ro.istream, IO) ? ro.istream :
                   isa(ro.istream, String) ? (:file, ro.istream) :
                   (isa(ro.body, String) && (ro.body != "")) ? ro.body :
                   ""
#                   error("Must specify either a body or istream for PUT/POST")

        if (ro.verb == :PUT)
            http_resp = Requests.put(URIParser.parse_url(url), senddata; headers=headers)
        else
            http_resp = Requests.post(URIParser.parse_url(url), senddata; headers=headers)
        end

    elseif ro.verb == :DELETE
        http_resp = Requests.delete(URIParser.parse_url(url); headers=headers)

    elseif ro.verb == :HEAD
        http_resp = Requests.head(URIParser.parse_url(url); headers=headers)

    else
        error("Unknown HTTP verb $verb")
    end

     if env.dbg
         info("Response : ", http_resp)
     end

    return http_resp
end


function canonicalize_and_sign(env::AWSEnv, ro::RO, md5::String)
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
        info("String to sign:\n$(str2sign)")
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

    canon_res = part1 * "?" * Requests.format_query_str(sorted)

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

    reduced = Dict{String, String}()
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

amz_s3_endpoint(region::String) = ((isempty(region) || (region == "us-east-1")) ? "s3" : ("s3-"*region)) * ".amazonaws.com"
amz_s3_endpoint(env::AWSEnv) = isempty(env.ep_host) ? amz_s3_endpoint(env.region) : env.ep_host

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


"""
list objects of s3. no directory/folder in the list
`Inputs`:
awsEnv: AWS awsEnvironment
bkt: bucket name
path: path
`Outputs`:
ret: channel that produces object keys (String)
"""
function list_objects(awsEnv::AWSEnv, path::AbstractString; re::Regex = r"^\s*")
    bkt, prefix = splits3(path)
    return list_objects(awsEnv, bkt, prefix; re=re)
end
function list_objects(path::AbstractString; re::Regex = r"^\s*")
    bkt, prefix = splits3(path)
    return list_objects(bkt, prefix; re=re)
end
function list_objects(bkt::AbstractString, prefix::AbstractString; re::Regex = r"^\s*")
    awsEnv = AWS.AWSEnv()
    return list_objects(awsEnv, bkt, prefix; re=re)
end
function list_objects(awsEnv::AWSEnv, bkt::AbstractString, prefix::AbstractString; re::Regex = r"^\s*")
    (bkt, in_c) = list_objects_details(awsEnv, bkt, prefix)

    function filter(out_c::Channel)
        for content in in_c
            if startswith(content.key, prefix)
                fname = content.key[length(prefix)+1:end]
            else
                fname = content.key
            end

            if ismatch(re, fname)
                put!(out_c, content.key)
            end
        end
    end

    bkt, Channel(filter, ctype=String)
end


"""
list objects of s3. no directory/folder in the list
`Inputs`:
awsEnv: AWS awsEnvironment
bkt: bucket name
path: path
`Outputs`:
ret: channel with object metadata (AWS.S3.Contents)
"""
function list_objects_details(awsEnv::AWSEnv, bkt::AbstractString, prefix::AbstractString; max_keys = 1000)
    prefix = lstrip(prefix, '/')

    function producer(c::Channel)
        marker = nothing
        more = true

        while more
            bucket_options = AWS.S3.GetBucketOptions(delimiter="/", prefix=prefix, marker=marker, max_keys=max_keys)
            resp = AWS.S3.get_bkt(awsEnv, bkt; options=bucket_options)

            more = resp.obj.isTruncated
            marker = resp.obj.nextMarker

            put!.(c, resp.obj.contents)
        end
    end

    # csize=max_keys-1: start the next listing as soon as the caller starts
    # processing the previous listing
    return bkt, Channel(producer, ctype=AWS.S3.Contents, csize=max(0, max_keys-1))
end

end
