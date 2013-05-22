type S3_Response_State
    Content-Length::Int  
    #Connection (open or closed) - we will not use this  
    Date::String    #The date and time Amazon S3 responded, for example, Wed, 01 Mar 2009 12:00:00 GMT.
    Server::String  #The name of the server that created the response.
    ETag::String
    
# x-amz- fields     
    delete_marker::Bool         # Specifies whether the object returned was (true) or was not (false) a Delete Marker.
    id_2::String                # A special token that helps AWS troubleshoot problems.
    request_id::String          # A value created by Amazon S3 that uniquely identifies the request. 
    version_id::String          # The version of the object.

end

# NOTE: Send Content-MD5 header with all requests having a body....

function get()
    return (S3_Response_State, ListAllMyBucketsResult)
end

del_bucket(bname) = del_bucket_common(bname, "")
del_bucket_cors(bname) = del_bucket_common(bname, "cors")
del_bucket_lifecycle(bname) = del_bucket_common(bname, "lifecycle")
del_bucket_policy(bname) = del_bucket_common(bname, "policy")
del_bucket_tagging(bname) = del_bucket_common(bname, "tagging")
del_bucket_website(bname) = del_bucket_common(bname, "website")

function del_bucket_common(bucket_name, operation)
    return (S3_Response_State)
end

type GetBucketOptions
    delimiter::Union(String, Nothing)
    marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
end

get_bucket(bname, options::Union(GetBucketOptions, Nothing)) = get_common(bname, "", options, ListBucketResult())
get_bucket_acl(bname) = get_common(bname, "acl", nothing, AccessControlPolicy())
get_bucket_cors(bname) = get_common(bname, "cors", nothing, CORSConfiguration())
get_bucket_lifecycle(bname) = get_common(bname, "lifecycle", nothing, LifecycleConfiguration())
get_bucket_policy(bname) = get_common(bname, "policy", nothing, string())
get_bucket_location(bname) = get_common(bname, "location", nothing, LocationConstraint())
get_bucket_logging(bname) = get_common(bname, "logging", nothing, BucketLoggingStatus())
get_bucket_notification(bname) = get_common(bname, "notification", nothing, NotificationConfiguration())
get_bucket_tagging(bname) = get_common(bname, "tagging", nothing, Tagging())

type GetBucketObjectVersionsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    version_id_marker::Union(String, Nothing)
end

get_bucket_object_versions(bname, options::Union(GetBucketObjectVersionsOptions, Nothing)) = get_common(bname, "versions", options, ListVersionsResult())

get_bucket_request_payment(bname) = get_common(bname, "requestPayment", nothing, RequestPaymentConfiguration())
get_bucket_versioning(bname) = get_common(bname, "versioning", nothing, VersioningConfiguration())
get_bucket_website(bname) = get_common(bname, "website", nothing, WebsiteConfiguration())


type GetBucketUploadsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_uploads::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    upload_id_marker::Union(String, Nothing)
end
get_bucket_multipart_uploads(bname) = get_common(bname, "uploads", nothing, ListMultipartUploadsResult())

function get_common(bname, req_tag, params, resp)
    return(S3_Response_State, resp)
end


function test_bucket(bname)
end

type S3_ACL_Grantee
    email_address::Union(String, Nothing)
    id::Union(String, Nothing)
    uri::Union(String, Nothing)
end

type BucketACL
    x_acl::Union(String, Nothing)
    x_grant_read::Union(Array{S3_ACL_Grantee, 1}, Nothing)
    x_grant_write::Union(Array{S3_ACL_Grantee, 1}, Nothing)   
    x_grant_read_acp::Union(Array{S3_ACL_Grantee, 1}, Nothing)    
    x_grant_write_acp::Union(Array{S3_ACL_Grantee, 1}, Nothing)   
    x_grant_full_control::Union(Array{S3_ACL_Grantee, 1}, Nothing)
end


function create_bucket(bname, acl::Union(BucketACL, Nothing), location_constraint::Union(String, Nothing))
    return put_common(bname, "", params, req_body, nothing)
end


set_bucket_acl(bname, acl::Union(BucketACL, Nothing)) = put_common(bname, "acl", acl, nothing, nothing)
function set_bucket_cors(bname, cors::CORSConfiguration) 
    # params is Content-MD5 of XMLified cors
    put_common(bname, "cors", params, cors_xml, nothing)
end



function set_bucket_lifecycle(bname, lc::LifecycleConfiguration) 
    # params is Content-MD5 of XMLified lf
    put_common(bname, "lifecycle", params, lc_xml, nothing)
end

set_bucket_policy(bname, policy_json::String) = put_common(bname, "policy", nothing, policy_json, nothing)

function set_bucket_logging(bname, logging::BucketLoggingStatus)
    put_common(bname, "logging", nothing, logging_xml, nothing)
end



function set_bucket_notification(bname, notif::NotificationConfiguration)
    # NOTE: x-amz-sns-test-message-id is returned as a header - needs to be extracted....
    put_common(bname, "notification", nothing, nothing, nothing)
end

type Tag
    key::String
    value::String
end

# Not a xmlns type
type Tagging
    tagSet::Union(Array{Tag, 1}, Nothing)
end


function set_bucket_tagging(bname, tagging::Tagging)
    # Content-MD5
    put_common(bname, "tagging", nothing, tagging_xml, nothing)
end


function set_bucket_request_payment(bname, pay::RequestPaymentConfiguration)
    put_common(bname, "requestPayment", nothing, pay_xml, nothing)
end


function set_bucket_versioning(bname, mfa::Union(String, Nothing), config::VersioningConfiguration)
    #x-amz-mfa is not mandatory if status is suspended
    put_common(bname, "versioning", params, config_xml, nothing)

end
function set_bucket_website(bname, config::WebsiteConfiguration)
    put_common(bname, "website", nothing, config_xml, nothing)
end

function put_common(bname, req_tag, params, req_body, resp)
    return(S3_Response_State, resp)
end



