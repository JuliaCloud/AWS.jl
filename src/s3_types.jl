
# Seems like Metadata is not returned via XML in case of the REST API.
# type MetadataEntry
#     name::String
#     value::String
# end

const XMLNS_ATTR = "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
xml_hdr(name) = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><$(name) xmlns=\"http://doc.s3.amazonaws.com/2006-03-01\">"
xml_ftr(name) = "</$(name)>"


macro add_amz_hdr(name, value) 
    quote
        if ($(esc(value)) != nothing) push!(hdrs, ("x-amz-" * $(esc(name)), string($(esc(value)))  )) end
    end
end

macro chk_n_add(name, value) 
    quote
        if ($(esc(value)) != nothing) push!(arr, ($(esc(name)), string($(esc(value)))  )) end
    end
end


macro declare_utype(utype)
    quote
        type $(esc(utype))
            id::String         
            displayName::Union(String, Nothing)
        end
        xml(o::$(esc(utype))) = xml($(string(utype)), [("ID", o.id), ("DisplayName", o.displayName)])
        function $(esc(utype))(pd::ParsedData)
            o = $(esc(utype))(find(pd, "ID#string"), find(pd, "DisplayName#string"))  
        end
    end
end

@declare_utype Owner
@declare_utype Initiator



type GranteeEmail
    email::String
end
xml(o::GranteeEmail) = xml("Grantee", [("EmailAddress", o.email)], xmlns=$XMLNS_ATTR, xsi_type="AmazonCustomerByEmail")


type GranteeURI 
    uri::String
end
xml(o::GranteeURI) = xml("Grantee", [("URI", o.uri)], xmlns=$XMLNS_ATTR, xsi_type="Group") 

type GranteeID
    id::String         
    displayName::String
end
xml(o::GranteeID) = xml("Grantee", [("ID", o.id), ("DisplayName", o.displayName)], xmlns=$XMLNS_ATTR, xsi_type="CanonicalUser")

type Grant
    grantee::Union(GranteeEmail, GranteeURI, GranteeID)
    permission::String
end
xml(o::Grant) = xml("Grant", [o.grantee, ("Permission", o.permission)])
# permission must be one of "READ", "WRITE", "READ_ACP", "WRITE_ACP" or "FULL_CONTROL"
function Grant(pd_g::ParsedData)
    grantee_pd = find(pd_g, "Grantee[1]")
    grantee_type = grantee_pd.attr["xsi:type"]
    if grantee_type == "AmazonCustomerByEmail"
        grantee=GranteeEmail(find(grantee_pd, "EmailAddress#string"))
    elseif grantee_type == "CanonicalUser"
        grantee=GranteeID(find(grantee_pd, "ID#string"), find(grantee_pd, "DisplayName#string")) 
    elseif grantee_type == "Group"
        grantee=GranteeURI(find(grantee_pd, "URI#string"))
    else
        error("Unknown grantee type")
    end
    
    permission = find(pd_g, "Permission#string")
    Grant(grantee, permission)
end




type BucketLoggingStatus
    loggingEnabled::Union(Bool, Nothing)
    targetBucket::Union(String, Nothing)
    targetPrefix::Union(String, Nothing)
    targetGrants::Union(Vector{Grant}, Nothing)
end

BucketLoggingStatus() = BucketLoggingStatus(false, nothing, nothing, nothing)
function BucketLoggingStatus(pd_bls::ParsedData)
    bls = BucketLoggingStatus()
    if haskey(pd_bls.elements, "LoggingEnabled")
        bls.targetBucket = find(pd_bls, "LoggingEnabled/TargetBucket#string")
        bls.targetPrefix = find(pd_bls, "LoggingEnabled/TargetPrefix#string")
        
        grants = find(pd_bls, "LoggingEnabled/TargetGrants/Grant")
        bls.targetGrants = @parse_vector(Grant, grants)
    else
        return bls
    end
end

function xml(o::BucketLoggingStatus)
    if (o.loggingEnabled)
        xml_hdr("BucketLoggingStatus") * 
        xml("TargetBucket", o.targetBucket) *  
        xml("TargetPrefix", o.targetPrefix) *  
        xml("TargetGrants", o.targetGrants) *
        xml_ftr("BucketLoggingStatus")
    
    else
        xml_hdr("BucketLoggingStatus") * xml_ftr("BucketLoggingStatus")
    end
end

type AccessControlPolicy
    owner::Owner
    accessControlList::Vector{Grant}
end

function AccessControlPolicy(pd_acl::ParsedData)
    owner = Owner(find(pd_acl, "Owner[1]"))
    accessControlList = @parse_vector(Grant, find(pd_acl, "AccessControlList/Grant"))
    return AccessControlPolicy(owner, accessControlList)
end

function xml(o::AccessControlPolicy)
    xml_hdr("AccessControlPolicy") * 
    xml("Owner", o.owner) *  
    xml("AccessControlList", o.accessControlList) *
    xml_ftr("AccessControlPolicy")
end

# Storage class must be one of "STANDARD", "REDUCED_REDUNDANCY", "GLACIER" or "UNKNOWN"


type CreateBucketConfiguration
    locationConstraint::Union(String, Nothing)
end
CreateBucketConfiguration(pd_cbc::ParsedData) = CreateBucketConfiguration(find(pd_cbc, "LocationConstraint#string"))
xml(o::CreateBucketConfiguration) = xml_hdr("CreateBucketConfiguration") * 
                                    xml("LocationConstraint", o.locationConstraint) * 
                                    xml_ftr("CreateBucketConfiguration")


                                    
                                    
type Contents
    key::Union(String, Nothing)
    lastModified::CalendarTime
    eTag::Union(String, Nothing)
    size::Union(Int64, Nothing)
    owner::Owner
    storageClass::Union(String, Nothing)
end
function Contents(pd_le::ParsedData)
    key = find(pd_le, "Key#string")
    datestr = find(pd_le, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_le, "ETag#string")
    size = safe_parseint64(find(pd_le, "Size#string"))
    owner=Owner(find(pd_le, "Owner[1]"))
    storageClass = find(pd_le, "StorageClass#string")

    Contents(key, t, etag, size, owner, storageClass)
end


type CommonPrefixes
    prefix::Union(String, Nothing)
end
CommonPrefixes(pd_cp::ParsedData) = CommonPrefixes(find(pd_cp, "Prefix#string"))

type ListBucketResult
    name::Union(String, Nothing)
    prefix::Union(String, Nothing)
    marker::Union(String, Nothing)
    nextMarker::Union(String, Nothing)
    maxKeys::Union(Int, Nothing)
    delimiter::Union(String, Nothing)
    isTruncated::Union(Bool, Nothing)
    contents::Vector{Contents}
    commonPrefixes::Vector{CommonPrefixes}
    
    ListBucketResult() = new()
end

function ListBucketResult(pd_lbr::ParsedData)
    lbr = ListBucketResult()
    lbr.name = find(pd_lbr, "Name#string")
    lbr.prefix = find(pd_lbr, "Prefix#string")
    lbr.marker = find(pd_lbr, "Marker#string")
    lbr.nextMarker = find(pd_lbr, "NextMarker#string")
    lbr.maxKeys = safe_parseint(find(pd_lbr, "MaxKeys#string")) 
    lbr.delimiter = find(pd_lbr, "Delimiter#string")
    lbr.isTruncated = safe_parsebool(find(pd_lbr, "IsTruncated#string"))
    lbr.contents = @parse_vector(Contents, pd_lbr.elements["Contents"])
    lbr.commonPrefixes = @parse_vector(CommonPrefixes, pd_lbr.elements["CommonPrefixes"])
    lbr
end


type Version
    key::Union(String, Nothing)
    versionId::Union(String, Nothing)
    isLatest::Union(Bool, Nothing)
    lastModified::CalendarTime
    eTag::Union(String, Nothing)
    size::Union(Int64, Nothing)
    owner::Owner
    storageClass::Union(String, Nothing)
end
function Version(pd_v::ParsedData)
    key = find(pd_v, "Key#string")
    versionId = find(pd_v, "VersionId#string")
    isLatest = (lowercase(find(pd_v, "IsLatest#string")) == "true") ? true : false 
    datestr = find(pd_v, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_v, "ETag#string")
    size = safe_parseint64(find(pd_v, "Size#string"))
    owner=Owner(find(pd_v, "Owner[1]"))
    storageClass = find(pd_v, "StorageClass#string")

    Version(key, versionId, isLatest, t, etag, size, owner, storageClass)
end




type DeleteMarker
    key::Union(String, Nothing)
    versionId::Union(String, Nothing)
    isLatest::Union(Bool, Nothing)
    lastModified::CalendarTime
    owner::Owner
end
function DeleteMarker(pd_dm::ParsedData)
    key = find(pd_dm, "Key#string")
    versionId = find(pd_dm, "VersionId#string")
    isLatest = (lowercase(find(pd_dm, "IsLatest#string")) == "true") ? true : false 
    datestr = find(pd_dm, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    owner=Owner(find(pd_dm, "Owner[1]"))
    DeleteMarker(key, versionId, isLatest, t, owner)
end





type ListVersionsResult
    name::Union(String, Nothing)
    prefix::Union(String, Nothing)
    keyMarker::Union(String, Nothing)
    versionIdMarker::Union(String, Nothing)
    nextKeyMarker::Union(String, Nothing)
    nextVersionIdMarker::Union(String, Nothing)
    maxKeys::Union(Int, Nothing)
    delimiter::Union(String, Nothing)
    isTruncated::Union(Bool, Nothing)
    version::Union(Vector{Version}, Nothing)
    deleteMarker::Union(Vector{DeleteMarker}, Nothing)
    commonPrefixes::Union(Vector{CommonPrefixes}, Nothing)
    
    ListVersionsResult() = new()
end  
function ListVersionsResult(pd_lvr::ParsedData)
    lvr = ListVersionsResult()
    lvr.name = find(pd_lvr, "Name#string")
    lvr.prefix = find(pd_lvr, "Prefix#string")
    lvr.keyMarker = find(pd_lvr, "KeyMarker#string")
    lvr.versionIdMarker = find(pd_lvr, "VersionIdMarker#string")
    lvr.nextKeyMarker = find(pd_lvr, "NextKeyMarker#string")
    lvr.nextVersionIdMarker = find(pd_lvr, "NextVersionIdMarker#string")
    lvr.maxKeys = safe_parseint(find(pd_lvr, "MaxKeys#string"))
    lvr.delimiter = find(pd_lvr, "Delimiter#string")
    lvr.isTruncated = safe_parsebool(find(pd_lvr, "IsTruncated#string"))
    lvr.version = @parse_vector(Version, find(pd_lvr, "Version"))
    lvr.deleteMarker = @parse_vector(DeleteMarker, find(pd_lvr, "DeleteMarker"))
    lvr.commonPrefixes = @parse_vector(CommonPrefixes, find(pd_lvr, "CommonPrefixes"))
    lvr
end




type Bucket
    name::Union(String, Nothing)
    creationDate::CalendarTime
end
function Bucket(pd_b::ParsedData)
    datestr = find(pd_b, "CreationDate#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    Bucket(find(pd_b, "Name#string"), t)
end





type ListAllMyBucketsResult
    owner::Owner
    buckets::Vector{Bucket}
end
function ListAllMyBucketsResult(pd_lab::ParsedData)
    owner = Owner(find(pd_lab, "Owner[1]"))
    buckets = @parse_vector(Bucket, find(pd_lab, "Buckets/Bucket"))
    ListAllMyBucketsResult(owner, buckets)
end



type CopyObjectResult
    lastModified::CalendarTime
    eTag::Union(String, Nothing)      
end
function CopyObjectResult(pd_cor::ParsedData)
    datestr = find(pd_cor, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    CopyObjectResult(t, find(pd_cor, "ETag#string"))
end




type RequestPaymentConfiguration
    payer::Union(String, Nothing)
end
xml(o::RequestPaymentConfiguration) = xml_hdr("RequestPaymentConfiguration") * xml("Payer", o.payer) * xml_ftr("RequestPaymentConfiguration")
RequestPaymentConfiguration(pd_rpc::ParsedData) = RequestPaymentConfiguration(find(pd_rpc, "Payer#string"))

  
type VersioningConfiguration
    status::Union(String, Nothing)
    mfaDelete::Union(String, Nothing)
end
function xml(o::VersioningConfiguration)    
    xml_hdr("VersioningConfiguration") * 
    ((o.status != "") ? xml("Status", o.status) : "") * 
    ((o.mfaDelete != "") ? xml("MfaDelete", o.mfaDelete) : "")  * 
    xml_ftr("VersioningConfiguration")
end
function VersioningConfiguration(pd_vc::ParsedData) 
    status = (haskey(pd_vc.elements, "Status") ? find(pd_vc, "Status#string") : "")
    mfaDelete = (haskey(pd_vc.elements, "MfaDelete") ? find(pd_vc, "MfaDelete#string") : "")
    
    VersioningConfiguration(status, mfaDelete)
end


type TopicConfiguration
    topic::Union(String, Nothing)
    event::Vector{String}
end
function TopicConfiguration(pd_tc::ParsedData)
    topic = find(pd_tc, "Topic#string")
    event = String[] 
    for pde in find(pd_tc, "Event")
        push!(event, pde.text)
    end
    TopicConfiguration(topic, event)
end
function xml(o::TopicConfiguration)
    topic = xml("Topic", o.topic)
    events = ""
    for e in o.event
        events = events * xml("Event", e)
    end
    
    xml("TopicConfiguration", topic * events)
end







type NotificationConfiguration
    topicConfiguration::Union(Vector{TopicConfiguration}, Nothing)
end
NotificationConfiguration(pd::ParsedData) = NotificationConfiguration(@parse_vector(TopicConfiguration, find(pd, "TopicConfiguration")))

function xml(o::NotificationConfiguration)
    if o.topicConfiguration == nothing
        xml("NotificationConfiguration", "")
    else
        topics = ""
        for t in o.topicConfiguration
            topics = topics * xml("TopicConfiguration", t)
        end
        xml("NotificationConfiguration", topics)
    end
end



type InitiateMultipartUploadResult
    bucket::Union(String, Nothing)
    key::Union(String, Nothing)
    uploadId::Union(String, Nothing)
end
function InitiateMultipartUploadResult(pd::ParsedData)
    InitiateMultipartUploadResult(find(pd, "Bucket#string"), find(pd, "Key#string"), find(pd, "UploadId#string"))
end

type CopyPartResult
   lastModified::CalendarTime
   eTag::Union(String, Nothing)
end
function CopyPartResult(pd::ParsedData)
    datestr = find(pd, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss", datestr[1:end-1], "GMT")
    CopyPartResult(t, find(pd, "ETag#string"))
end


type Part
    partNumber::Union(String, Nothing)
    lastModified::Union(CalendarTime, Nothing)
    eTag::Union(String, Nothing)
    size::Union(Int64, Nothing)
    
    Part(partNumber, eTag) = new(partNumber, nothing, eTag, nothing)
    Part(partNumber, lastModified, eTag, size) = new(partNumber, lastModified, eTag, size)
end
# We don't need to xmlify lastModified and Size...
xml(o::Part) = xml("Part", [("PartNumber", o.partNumber), ("ETag", o.eTag)])
function Part(pd::ParsedData)
    datestr = find(pd, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")

    Part(find(pd, "PartNumber#string"), t, find(pd, "ETag#string"), int64(find(pd, "Size#string")))
end


type CompleteMultipartUpload
    parts::Vector{Part}
end
xml(o::CompleteMultipartUpload) = xml("CompleteMultipartUpload", o.parts)



type CompleteMultipartUploadResult
    location::Union(String, Nothing)
    bucket::Union(String, Nothing)
    key::Union(String, Nothing)
    eTag::Union(String, Nothing)
end
CompleteMultipartUploadResult(pd::ParsedData) = 
    CompleteMultipartUploadResult(
        find(pd, "Location#string"),
        find(pd, "Bucket#string"),
        find(pd, "Key#string"),
        find(pd, "ETag#string"),
    )


    
type ListPartsResult
    bucket::Union(String, Nothing)
    key::Union(String, Nothing)
    uploadId::Union(String, Nothing)
    initiator::Initiator
    owner::Owner
    storageClass::Union(String, Nothing)
    partNumberMarker::Union(String, Nothing)
    nextPartNumberMarker::Union(String, Nothing)
    maxParts::Union(Int, Nothing)
    isTruncated::Union(Bool, Nothing)
    parts::Vector{Part}
end  
function ListPartsResult(pd::ParsedData)
    ListPartsResult(
        find(pd, "Bucket#string"),
        find(pd, "Key#string"),
        find(pd, "UploadId#string"),
        Initiator(find(pd, "Initiator[1]")),
        Owner(find(pd, "Owner[1]")),
        find(pd, "StorageClass#string"),
        find(pd, "PartNumberMarker#string"),
        find(pd, "NextPartNumberMarker#string"),
        int(find(pd, "MaxParts#string")),
        (lowercase(find(pd, "IsTruncated#string")) == "true") ? true : false,
        @parse_vector(Part, find(pd, "Part"))
    )
end


type CORSRule
    id::Union(String, Nothing)
    allowedMethod::Union(Vector{String}, Nothing)
    allowedOrigin::Union(Vector{String}, Nothing)
    allowedHeader::Union(Vector{String}, Nothing)
    maxAgeSeconds::Union(String, Int)
    exposeHeader::Union(Vector{String}, Nothing)
end

xml(o::CORSRule) = xml("CORSRule", [
        ("ID", o.id),
        ("AllowedMethod", o.allowedMethod),
        ("AllowedOrigin", o.allowedOrigin),
        ("AllowedHeader", o.allowedHeader),
        ("MaxAgeSeconds", o.maxAgeSeconds),
        ("ExposeHeader", o.exposeHeader)
    ])
    
function CORSRule(pd::ParsedData)
    id = find(pd, "ID#string")
    allowedMethod = parse_vector_as(String, "AllowedMethod", find(pd, "AllowedMethod"))
    allowedOrigin = parse_vector_as(String, "AllowedOrigin", find(pd, "AllowedOrigin"))
    allowedHeader = parse_vector_as(String, "AllowedHeader", find(pd, "AllowedHeader"))
    seconds = find(pd, "MaxAgeSeconds#string")
    if (seconds != nothing) maxAgeSeconds = int(seconds) end
    exposeHeader = parse_vector_as(String, "ExposeHeader", find(pd, "ExposeHeader"))
    
    CORSRule(id, allowedMethod, allowedOrigin, allowedHeader, maxAgeSeconds, exposeHeader)
    
end



type CORSConfiguration
    corsrules::Vector{CORSRule}
end
xml(o::CORSConfiguration) = xml("CORSConfiguration", o.corsrules)
CORSConfiguration(pd::ParsedData) = @parse_vector(CORSRule, find(pd, "CORSRule"))


type S3Error
    code::Union(String, Nothing)
    message::Union(String, Nothing)
    resource::Union(String, Nothing)
    hostId::Union(String, Nothing)
    requestId::Union(String, Nothing)
end
function S3Error(pde::ParsedData) 
    code = find(pde, "Code#string")
    message = find(pde, "Message#string")
    resource = find(pde, "Resource#string")
    hostId = find(pde, "HostId#string")
    requestId = find(pde, "RequestId#string")
    
    S3Error(code, message, resource, hostId, requestId)
end



type S3PartTag
    part_number::String
    etag::String
end
xml(o::S3PartTag) = xml("Part", [("PartNumber", o.part_number), ("ETag", o.etag)])

type CopyMatchOptions
    if_match::Union(String, Nothing)
    if_none_match::Union(String, Nothing) 
    if_unmodified_since::Union(String, Nothing)
    if_modified_since::Union(String, Nothing)
end
function amz_headers(hdrs, o::CopyMatchOptions)
    @add_amz_hdr("copy-source-if-match", o.if_match)
    @add_amz_hdr("copy-source-if-none-match", o.if_none_match)
    @add_amz_hdr("copy-source-if-unmodified-since", o.if_unmodified_since)
    @add_amz_hdr("copy-source-if-modified-since", o.if_modified_since)
    hdrs
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
    # Either a canned acl or specific acls (but not both) are supported
    if acl != nothing
        @add_amz_hdr("acl", o.acl)
    else
        add_acl_grantee(hdrs, "grant-read", o.grant_read)
        add_acl_grantee(hdrs, "grant-write", o.grant_write)
        add_acl_grantee(hdrs, "grant-read-acp", o.grant_read_acp)
        add_acl_grantee(hdrs, "grant-write-acp", o.grant_write_acp)
        add_acl_grantee(hdrs, "grant-full-control", o.grant_full_control)
    end
    hdrs
end

function add_acl_grantee(hdrs, xamz_name::String, arr::Vector{S3_ACL_Grantee})
    for a in arr
        @add_amz_hdr(xamz_name, hdr_str(a))
    end
    hdrs
end



type CopyObjectOptions
# All are x-amz options
    copy_source::String  
    metadata_directive::Union(String, Nothing)
    match_options::Union(CopyMatchOptions, Nothing)
    
# x-amz only header fields    
    server_side​_encryption::Union(String, Nothing)   
    storage_class::Union(String, Nothing) 
    website​_redirect_location::Union(String, Nothing)    
    acl::Union(S3_ACL, Nothing)
end
function amz_headers(hdrs, o::CopyObjectOptions)
    @add_amz_hdr("copy-source", o.copy_source)
    @add_amz_hdr("metadata-directive", o.metadata_directive)
    
    if (o.match_options != nothing)
        hdrs = amz_headers(hdrs, o.match_options)
    end

    @add_amz_hdr("server-side-encryption", o.server_side​_encryption)
    @add_amz_hdr("storage-class", o.storage_class)
    @add_amz_hdr("website-redirect-location", o.website​_redirect_location)
    
    if o.acl != nothing
        hdrs = amz_headers(hdrs, o.acl)
    end
    hdrs
end

type CopyUploadPartOptions
    copy_source::String   
    source_range::Union(String, Nothing)
    match_options::Union(CopyMatchOptions, Nothing)
end
function amz_headers(o::CopyUploadPartOptions)
    hdrs = [("x-amz-copy-source", o.copy_source)]
    @add_amz_hdr("source-range", o.source_range)
    hdrs = (o.match_options != nothing) ? amz_headers(hdrs, o.match_options) : hdrs
    hdrs
end

type PutObjectOptions
# Standard HTTP headers
    cache_control::Union(String, Nothing)
    content_disposition::Union(String, Nothing)
    content_encoding::Union(String, Nothing)
    cont_typ::Union(String, Nothing)
#Expect  not supported...
    expires::Union(CalendarTime, Nothing)
    
# x-amz header fields    
    meta::Union(Dict{String, String}, Nothing)
    server_side​_encryption::Union(String, Nothing)   
    storage_class::Union(String, Nothing) 
    website​_redirect_location::Union(String, Nothing)    
    acl::Union(S3_ACL, Nothing)
    
    PutObjectOptions() = new(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing)
end
function amz_headers(hdrs, o::PutObjectOptions)
    if (o.meta != nothing)
        for t in collect(o.meta)
            @add_amz_hdr("meta-" * t[1], t[2])
        end
    end
    
    @add_amz_hdr("server-side-encryption", o.server_side​_encryption)
    @add_amz_hdr("storage-class", o.storage_class)
    @add_amz_hdr("website-redirect-location", o.website​_redirect_location)
    
    if o.acl != nothing
        hdrs = amz_headers(hdrs, o.acl)
    end
    hdrs
end

function http_headers(arr, o::PutObjectOptions)
    @chk_n_add("Cache-Control", o.cache_control)
    @chk_n_add("Content-​Disposition", o.content_disposition)
    @chk_n_add("Content-Encoding", o.content_encoding)
    @chk_n_add("Expires", rfc1123_date(o.expires))
    arr
end

type GetObjectOptions
    # These go into the query string
    response_cont_typ::Union(String, Nothing)   
    response_content_language::Union(String, Nothing)   
    response_expires::Union(String, Nothing)   
    response_cache_control::Union(String, Nothing)   
    response_content_disposition::Union(String, Nothing)   
    response_content_encoding::Union(String, Nothing)   
    
    # These go into the header
    range::Union(String, Nothing)   
    if_modified_since::Union(CalendarTime, Nothing)   
    if_unmodified_since::Union(CalendarTime, Nothing)   
    if_match::Union(String, Nothing)   
    if_none_match::Union(String, Nothing)   
    
    GetObjectOptions() = new(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing)
end
function http_headers(arr, o::GetObjectOptions)
    @chk_n_add("Range", o.range)
    @chk_n_add("If-Modified-Since", rfc1123_date(o.if_modified_since))
    @chk_n_add("If-Unmodified-Since", rfc1123_date(o.if_unmodified_since))
    @chk_n_add("If-Match", o.if_match)
    @chk_n_add("If-None-Match", o.if_none_match)
    hdrs
end

function query_params(arr, o::GetObjectOptions)
    @chk_n_add("response-cont-typ", o.response_cont_typ)
    @chk_n_add("response-content-language", o.response_content_language)
    @chk_n_add("response-expires", o.response_expires)
    @chk_n_add("response-cache-control", o.response_cache_control)
    @chk_n_add("response-content-disposition", o.response_content_disposition)
    @chk_n_add("response-content-encoding", o.response_content_encoding)
    arr
end

type ObjectType
    key::String
    versionId::Union(String, Nothing)
    ObjectType(key) = ObjectType(key, nothing) 
    ObjectType(key, version) = new(key, version) 
end
function xml(o::ObjectType)
    xml("Object", [("Key", o.key), ("VersionId", o.versionId)])
end

type DeleteObjectsType
    quiet::Bool
    objects::Vector{ObjectType}
    DeleteObjectsType() = DeleteObjectsType(false, ObjectType[])
    DeleteObjectsType(objects) = DeleteObjectsType(false, objects)
    DeleteObjectsType(objects, quiet) = new(quiet, objects)
end
function xml(o::DeleteObjectsType)
    xml("Delete", [("Quiet", o.quiet), o.objects])
end

type Tag
    key::String
    value::String
end
xml(o::Tag) = xml("Tag", [("Key", o.key), ("Value", o.value)])

# Not a xmlns type
type Tagging
    tagSet::Vector{Tag}
end
xml(o::Tagging) = xml("Tagging", [("TagSet", o.tagSet)])


type GetBucketUploadsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_uploads::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    upload_id_marker::Union(String, Nothing)
    
    GetBucketUploadsOptions() = GetBucketUploadsOptions(nothing,nothing,nothing,nothing,nothing)
    GetBucketUploadsOptions(v1,v2,v3,v4,v5) = new(v1,v2,v3,v4,v5)
    
end
function get_subres(arr, o::GetBucketUploadsOptions)
    @chk_n_add("delimiter", o.delimiter) 
    @chk_n_add("key-marker", o.key_marker) 
    @chk_n_add("max-uploads", o.max_uploads) 
    @chk_n_add("prefix", o.prefix) 
    @chk_n_add("upload-id-marker", o.upload_id_marker) 
end

type GetBucketObjectVersionsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    version_id_marker::Union(String, Nothing)
    GetBucketObjectVersionsOptions() = GetBucketObjectVersionsOptions(nothing,nothing,nothing,nothing,nothing)
    GetBucketObjectVersionsOptions(v1,v2,v3,v4,v5) = new(v1,v2,v3,v4,v5)
end
function get_subres(arr, o::GetBucketObjectVersionsOptions)
    @chk_n_add("delimiter", o.delimiter) 
    @chk_n_add("key-marker", o.key_marker) 
    @chk_n_add("max-keys", o.max_keys) 
    @chk_n_add("prefix", o.prefix) 
    @chk_n_add("version-id-marker", o.version_id_marker) 
end

type GetBucketOptions
    delimiter::Union(String, Nothing)
    marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    GetBucketOptions() = GetBucketOptions(nothing,nothing,nothing,nothing)
    GetBucketOptions(v1,v2,v3,v4) = new(v1,v2,v3,v4)
end
function get_subres(arr, o::GetBucketOptions)
    @chk_n_add("delimiter", o.delimiter) 
    @chk_n_add("marker", o.marker) 
    @chk_n_add("max-keys", o.max_keys) 
    @chk_n_add("prefix", o.prefix) 
end
