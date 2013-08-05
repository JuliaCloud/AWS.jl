
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
        function $(esc(utype))(pd::ETree)
            o = $(esc(utype))(find(pd, "ID#string"), find(pd, "DisplayName#string"))  
        end
        $(esc(utype))(nothing::Nothing) = nothing
    end
end

@declare_utype Owner
@declare_utype Initiator
export Owner, Initiator


type GranteeEmail
    email::String
end
xml(o::GranteeEmail) = xml("Grantee", [("EmailAddress", o.email)], xmlns=$XMLNS_ATTR, xsi_type="AmazonCustomerByEmail")
export GranteeEmail

type GranteeURI 
    uri::String
end
xml(o::GranteeURI) = xml("Grantee", [("URI", o.uri)], xmlns=$XMLNS_ATTR, xsi_type="Group") 
export GranteeURI 

type GranteeID
    id::String         
    displayName::String
end
xml(o::GranteeID) = xml("Grantee", [("ID", o.id), ("DisplayName", o.displayName)], xmlns=$XMLNS_ATTR, xsi_type="CanonicalUser")
export GranteeID


type Grant
    grantee::Union(GranteeEmail, GranteeURI, GranteeID)
    permission::String
end
xml(o::Grant) = xml("Grant", [o.grantee, ("Permission", o.permission)])
# permission must be one of "READ", "WRITE", "READ_ACP", "WRITE_ACP" or "FULL_CONTROL"
function Grant(pd_g::ETree)
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
export Grant



type BucketLoggingStatus
    loggingEnabled::Union(Bool, Nothing)
    targetBucket::Union(String, Nothing)
    targetPrefix::Union(String, Nothing)
    targetGrants::Union(Vector{Grant}, Nothing)
end

BucketLoggingStatus() = BucketLoggingStatus(false, nothing, nothing, nothing)
function BucketLoggingStatus(pd_bls::ETree)
    bls = BucketLoggingStatus()
    if length(pd_bls["LoggingEnabled"]) > 0
        bls.targetBucket = find(pd_bls, "LoggingEnabled/TargetBucket#string")
        bls.targetPrefix = find(pd_bls, "LoggingEnabled/TargetPrefix#string")
        
        grants = find(pd_bls, "LoggingEnabled/TargetGrants/Grant")
        bls.targetGrants = AWS.@parse_vector(AWS.S3.Grant, grants)
    end
    bls
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
export BucketLoggingStatus



type AccessControlPolicy
    owner::Owner
    accessControlList::Vector{Grant}
end

function AccessControlPolicy(pd_acl::ETree)
    owner = Owner(find(pd_acl, "Owner[1]"))
    accessControlList = AWS.@parse_vector(AWS.S3.Grant, find(pd_acl, "AccessControlList/Grant"))
    return AccessControlPolicy(owner, accessControlList)
end

function xml(o::AccessControlPolicy)
    xml_hdr("AccessControlPolicy") * 
    xml("Owner", o.owner) *  
    xml("AccessControlList", o.accessControlList) *
    xml_ftr("AccessControlPolicy")
end
export AccessControlPolicy
# Storage class must be one of "STANDARD", "REDUCED_REDUNDANCY", "GLACIER" or "UNKNOWN"


type CreateBucketConfiguration
    locationConstraint::Union(String, Nothing)
end
CreateBucketConfiguration(pd_cbc::ETree) = CreateBucketConfiguration(find(pd_cbc, "LocationConstraint#string"))
xml(o::CreateBucketConfiguration) = xml_hdr("CreateBucketConfiguration") * 
                                    xml("LocationConstraint", o.locationConstraint) * 
                                    xml_ftr("CreateBucketConfiguration")
export CreateBucketConfiguration

                                    
                                    
type Contents
    key::Union(String, Nothing)
    lastModified::CalendarTime
    eTag::Union(String, Nothing)
    size::Union(Int64, Nothing)
    owner::Union(Owner, Nothing)
    storageClass::Union(String, Nothing)
end
function Contents(pd_le::ETree)
    key = find(pd_le, "Key#string")
    datestr = find(pd_le, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_le, "ETag#string")
    size = AWS.safe_parseint64(find(pd_le, "Size#string"))
    owner=Owner(find(pd_le, "Owner[1]"))
    storageClass = find(pd_le, "StorageClass#string")

    Contents(key, t, etag, size, owner, storageClass)
end
export Contents



type CommonPrefixes
    prefix::Union(String, Nothing)
end
CommonPrefixes(pd_cp::ETree) = CommonPrefixes(find(pd_cp, "Prefix#string"))
export CommonPrefixes


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
    
    ListBucketResult() = new(nothing,nothing,nothing,nothing,nothing,nothing,nothing,Contents[], CommonPrefixes[])
end

function ListBucketResult(pd_lbr::ETree)
    lbr = ListBucketResult()
    lbr.name = find(pd_lbr, "Name#string")
    lbr.prefix = find(pd_lbr, "Prefix#string")
    lbr.marker = find(pd_lbr, "Marker#string")
    lbr.nextMarker = find(pd_lbr, "NextMarker#string")
    lbr.maxKeys = AWS.safe_parseint(find(pd_lbr, "MaxKeys#string")) 
    lbr.delimiter = find(pd_lbr, "Delimiter#string")
    lbr.isTruncated = AWS.safe_parsebool(find(pd_lbr, "IsTruncated#string"))
    lbr.contents = AWS.@parse_vector(AWS.S3.Contents, pd_lbr["Contents"])
    lbr.commonPrefixes = AWS.@parse_vector(AWS.S3.CommonPrefixes, pd_lbr["CommonPrefixes"])
    lbr
end
export ListBucketResult

type Version
    key::Union(String, Nothing)
    versionId::Union(String, Nothing)
    isLatest::Union(Bool, Nothing)
    lastModified::CalendarTime
    eTag::Union(String, Nothing)
    size::Union(Int64, Nothing)
    owner::Union(Owner, Nothing)
    storageClass::Union(String, Nothing)
end
function Version(pd_v::ETree)
    key = find(pd_v, "Key#string")
    versionId = find(pd_v, "VersionId#string")
    isLatest = (lowercase(find(pd_v, "IsLatest#string")) == "true") ? true : false 
    datestr = find(pd_v, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_v, "ETag#string")
    size = AWS.safe_parseint64(find(pd_v, "Size#string"))
    owner=Owner(find(pd_v, "Owner[1]"))
    storageClass = find(pd_v, "StorageClass#string")

    Version(key, versionId, isLatest, t, etag, size, owner, storageClass)
end
export Version



type DeleteMarker
    key::Union(String, Nothing)
    versionId::Union(String, Nothing)
    isLatest::Union(Bool, Nothing)
    lastModified::CalendarTime
    owner::Union(Owner, Nothing)
end
function DeleteMarker(pd_dm::ETree)
    key = find(pd_dm, "Key#string")
    versionId = find(pd_dm, "VersionId#string")
    isLatest = (lowercase(find(pd_dm, "IsLatest#string")) == "true") ? true : false 
    datestr = find(pd_dm, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    owner=Owner(find(pd_dm, "Owner[1]"))
    DeleteMarker(key, versionId, isLatest, t, owner)
end
export DeleteMarker




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
function ListVersionsResult(pd_lvr::ETree)
    lvr = ListVersionsResult()
    lvr.name = find(pd_lvr, "Name#string")
    lvr.prefix = find(pd_lvr, "Prefix#string")
    lvr.keyMarker = find(pd_lvr, "KeyMarker#string")
    lvr.versionIdMarker = find(pd_lvr, "VersionIdMarker#string")
    lvr.nextKeyMarker = find(pd_lvr, "NextKeyMarker#string")
    lvr.nextVersionIdMarker = find(pd_lvr, "NextVersionIdMarker#string")
    lvr.maxKeys = AWS.safe_parseint(find(pd_lvr, "MaxKeys#string"))
    lvr.delimiter = find(pd_lvr, "Delimiter#string")
    lvr.isTruncated = AWS.safe_parsebool(find(pd_lvr, "IsTruncated#string"))
    lvr.version = AWS.@parse_vector(AWS.S3.Version, find(pd_lvr, "Version"))
    lvr.deleteMarker = AWS.@parse_vector(AWS.S3.DeleteMarker, find(pd_lvr, "DeleteMarker"))
    lvr.commonPrefixes = AWS.@parse_vector(AWS.S3.CommonPrefixes, find(pd_lvr, "CommonPrefixes"))
    lvr
end
export ListVersionsResult



type Bucket
    name::Union(String, Nothing)
    creationDate::CalendarTime
end
function Bucket(pd_b::ETree)
    datestr = find(pd_b, "CreationDate#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    Bucket(find(pd_b, "Name#string"), t)
end
export Bucket




type ListAllMyBucketsResult
    owner::Union(Owner, Nothing)
    buckets::Vector{Bucket}
end
function ListAllMyBucketsResult(pd_lab::ETree)
    owner = Owner(find(pd_lab, "Owner[1]"))
    buckets = AWS.@parse_vector(AWS.S3.AWS.S3.Bucket, find(pd_lab, "Buckets/Bucket"))
    ListAllMyBucketsResult(owner, buckets)
end
export ListAllMyBucketsResult


type CopyObjectResult
    lastModified::CalendarTime
    eTag::Union(String, Nothing)      
end
function CopyObjectResult(pd_cor::ETree)
    datestr = find(pd_cor, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    CopyObjectResult(t, find(pd_cor, "ETag#string"))
end
export CopyObjectResult



type RequestPaymentConfiguration
    payer::Union(String, Nothing)
end
xml(o::RequestPaymentConfiguration) = xml_hdr("RequestPaymentConfiguration") * xml("Payer", o.payer) * xml_ftr("RequestPaymentConfiguration")
RequestPaymentConfiguration(pd_rpc::ETree) = RequestPaymentConfiguration(find(pd_rpc, "Payer#string"))
export RequestPaymentConfiguration
  
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
function VersioningConfiguration(pd_vc::ETree) 
    status = length(pd_vc["Status"]) > 0  ? find(pd_vc, "Status#string") : ""
    mfaDelete = length(pd_vc["MfaDelete"]) > 0  ? find(pd_vc, "MfaDelete#string") : ""
    
    VersioningConfiguration(status, mfaDelete)
end
export VersioningConfiguration

type TopicConfiguration
    topic::Union(String, Nothing)
    event::Vector{String}
end
function TopicConfiguration(pd_tc::ETree)
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
export TopicConfiguration



type NotificationConfiguration
    topicConfiguration::Union(Vector{TopicConfiguration}, Nothing)
end
NotificationConfiguration(pd::ETree) = NotificationConfiguration(AWS.@parse_vector(AWS.S3.TopicConfiguration, find(pd, "TopicConfiguration")))

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
export NotificationConfiguration


type InitiateMultipartUploadResult
    bucket::Union(String, Nothing)
    key::Union(String, Nothing)
    uploadId::Union(String, Nothing)
end
function InitiateMultipartUploadResult(pd::ETree)
    InitiateMultipartUploadResult(find(pd, "Bucket#string"), find(pd, "Key#string"), find(pd, "UploadId#string"))
end
export InitiateMultipartUploadResult



type CopyPartResult
   lastModified::CalendarTime
   eTag::Union(String, Nothing)
end
function CopyPartResult(pd::ETree)
    datestr = find(pd, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss", datestr[1:end-1], "GMT")
    CopyPartResult(t, find(pd, "ETag#string"))
end
export CopyPartResult

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
function Part(pd::ETree)
    datestr = find(pd, "LastModified#string")
    t = Calendar.parse("yyyy-MM-dd'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")

    Part(find(pd, "PartNumber#string"), t, find(pd, "ETag#string"), int64(find(pd, "Size#string")))
end
export Part

type CompleteMultipartUpload
    parts::Vector{Part}
end
xml(o::CompleteMultipartUpload) = xml("CompleteMultipartUpload", o.parts)
export CompleteMultipartUpload


type CompleteMultipartUploadResult
    location::Union(String, Nothing)
    bucket::Union(String, Nothing)
    key::Union(String, Nothing)
    eTag::Union(String, Nothing)
end
CompleteMultipartUploadResult(pd::ETree) = 
    CompleteMultipartUploadResult(
        find(pd, "Location#string"),
        find(pd, "Bucket#string"),
        find(pd, "Key#string"),
        find(pd, "ETag#string"),
    )
export CompleteMultipartUploadResult

    
type ListPartsResult
    bucket::Union(String, Nothing)
    key::Union(String, Nothing)
    uploadId::Union(String, Nothing)
    initiator::Initiator
    owner::Union(Owner, Nothing)
    storageClass::Union(String, Nothing)
    partNumberMarker::Union(String, Nothing)
    nextPartNumberMarker::Union(String, Nothing)
    maxParts::Union(Int, Nothing)
    isTruncated::Union(Bool, Nothing)
    parts::Vector{Part}
end  
function ListPartsResult(pd::ETree)
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
        AWS.@parse_vector(AWS.S3.Part, find(pd, "Part"))
    )
end
export ListPartsResult

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
    
function CORSRule(pd::ETree)
    id = find(pd, "ID#string")
    allowedMethod = parse_vector_as(String, "AllowedMethod", find(pd, "AllowedMethod"))
    allowedOrigin = parse_vector_as(String, "AllowedOrigin", find(pd, "AllowedOrigin"))
    allowedHeader = parse_vector_as(String, "AllowedHeader", find(pd, "AllowedHeader"))
    seconds = find(pd, "MaxAgeSeconds#string")
    if (seconds != nothing) maxAgeSeconds = int(seconds) end
    exposeHeader = parse_vector_as(String, "ExposeHeader", find(pd, "ExposeHeader"))
    
    CORSRule(id, allowedMethod, allowedOrigin, allowedHeader, maxAgeSeconds, exposeHeader)
    
end
export CORSRule


type CORSConfiguration
    corsrules::Vector{CORSRule}
end
xml(o::CORSConfiguration) = xml("CORSConfiguration", o.corsrules)
CORSConfiguration(pd::ETree) = AWS.@parse_vector(AWS.S3.CORSRule, find(pd, "CORSRule"))


type S3Error
    code::Union(String, Nothing)
    message::Union(String, Nothing)
    resource::Union(String, Nothing)
    hostId::Union(String, Nothing)
    requestId::Union(String, Nothing)
end
function S3Error(pde::ETree) 
    code = find(pde, "Code#string")
    message = find(pde, "Message#string")
    resource = find(pde, "Resource#string")
    hostId = find(pde, "HostId#string")
    requestId = find(pde, "RequestId#string")
    
    S3Error(code, message, resource, hostId, requestId)
end
export CORSConfiguration


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
    CopyMatchOptions(;if_match=nothing, if_none_match=nothing, if_unmodified_since=nothing, if_modified_since=nothing) = begin
        new(if_match, if_none_match, if_unmodified_since, if_modified_since)
    end
end
function amz_headers(hdrs, o::CopyMatchOptions)
    @add_amz_hdr("copy-source-if-match", o.if_match)
    @add_amz_hdr("copy-source-if-none-match", o.if_none_match)
    @add_amz_hdr("copy-source-if-unmodified-since", o.if_unmodified_since)
    @add_amz_hdr("copy-source-if-modified-since", o.if_modified_since)
    hdrs
end
export S3PartTag


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
export S3_ACL_Grantee


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
    if o.acl != nothing
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
export S3_ACL


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
    
    CopyObjectOptions(copy_source; metadata_directive=nothing, match_options=nothing, 
        server_side​_encryption=nothing, storage_class=nothing, website​_redirect_location=nothing, acl=nothing) = begin
            new(copy_source, metadata_directive,  match_options, server_side​_encryption, storage_class, website​_redirect_location, acl)
    end
    
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
export CopyObjectOptions


type CopyUploadPartOptions
    copy_source::String   
    source_range::Union(String, Nothing)
    match_options::Union(CopyMatchOptions, Nothing)
    
    CopyUploadPartOptions(copy_source; source_range=nothing, match_options=nothing) = new(copy_source, source_range, match_options)
end
function amz_headers(o::CopyUploadPartOptions)
    hdrs = [("x-amz-copy-source", o.copy_source)]
    @add_amz_hdr("source-range", o.source_range)
    hdrs = (o.match_options != nothing) ? amz_headers(hdrs, o.match_options) : hdrs
    hdrs
end
export CopyUploadPartOptions


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
    
    PutObjectOptions(;cache_control=nothing,content_disposition=nothing,content_encoding=nothing,
                        cont_typ=nothing,expires=nothing,meta=nothing,server_side​_encryption=nothing,
                        storage_class=nothing,website​_redirect_location=nothing,acl=nothing) = begin
            new(cache_control,content_disposition,content_encoding,cont_typ,expires,meta,server_side​_encryption,storage_class,website​_redirect_location,acl)
    end
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
export PutObjectOptions



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
    
    GetObjectOptions(;response_cont_typ=nothing, response_content_language=nothing, response_expires=nothing, response_cache_control=nothing, response_content_disposition=nothing,
        response_content_encoding=nothing, range=nothing, if_modified_since=nothing, if_unmodified_since=nothing, if_match=nothing, if_none_match=nothing) = begin
            new (response_cont_typ, response_content_language, response_expires, response_cache_control, response_content_disposition,response_content_encoding, range, if_modified_since, if_unmodified_since, if_match, if_none_match) 
        end
end
function http_headers(arr, o::GetObjectOptions)
    @chk_n_add("Range", o.range)
    @chk_n_add("If-Modified-Since", rfc1123_date(o.if_modified_since))
    @chk_n_add("If-Unmodified-Since", rfc1123_date(o.if_unmodified_since))
    @chk_n_add("If-Match", o.if_match)
    @chk_n_add("If-None-Match", o.if_none_match)
    arr
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
export GetObjectOptions


type ObjectType
    key::String
    versionId::Union(String, Nothing)
    ObjectType(key) = ObjectType(key, nothing) 
    ObjectType(key, version) = new(key, version) 
end
function xml(o::ObjectType)
    xml("Object", [("Key", o.key), ("VersionId", o.versionId)])
end
export ObjectType


type DeleteObjectsType
    quiet::Bool
    objects::Vector{ObjectType}
    DeleteObjectsType() = DeleteObjectsType(false, ObjectType[])
    DeleteObjectsType(objects) = DeleteObjectsType(objects, false)
    DeleteObjectsType(objects, quiet) = new(quiet, objects)
end
function xml(o::DeleteObjectsType)
    xml("Delete", [("Quiet", o.quiet), o.objects])
end
export DeleteObjectsType


type Tag
    key::String
    value::String
end
xml(o::Tag) = xml("Tag", [("Key", o.key), ("Value", o.value)])
export Tag


# Not a xmlns type
type Tagging
    tagSet::Vector{Tag}
end
xml(o::Tagging) = xml("Tagging", [("TagSet", o.tagSet)])
export Tagging

type GetBucketUploadsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_uploads::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    upload_id_marker::Union(String, Nothing)
    
    GetBucketUploadsOptions(; delimiter=nothing, key_marker=nothing, max_uploads=nothing, prefix=nothing, upload_id_marker=nothing) = begin 
        new(delimiter, key_marker, max_uploads, prefix, upload_id_marker)
    end
end
function get_subres(arr, o::GetBucketUploadsOptions)
    @chk_n_add("delimiter", o.delimiter) 
    @chk_n_add("key-marker", o.key_marker) 
    @chk_n_add("max-uploads", o.max_uploads) 
    @chk_n_add("prefix", o.prefix) 
    @chk_n_add("upload-id-marker", o.upload_id_marker) 
    arr
end
export GetBucketUploadsOptions



type GetBucketObjectVersionsOptions
    delimiter::Union(String, Nothing)
    key_marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    version_id_marker::Union(String, Nothing)
    GetBucketObjectVersionsOptions(; delimiter=nothing, key_marker=nothing, max_keys=nothing, prefix=nothing, version_id_marker=nothing) = begin
        new(delimiter, key_marker, max_keys, prefix, version_id_marker)
    end
end
function get_subres(arr, o::GetBucketObjectVersionsOptions)
    @chk_n_add("delimiter", o.delimiter) 
    @chk_n_add("key-marker", o.key_marker) 
    @chk_n_add("max-keys", o.max_keys) 
    @chk_n_add("prefix", o.prefix) 
    @chk_n_add("version-id-marker", o.version_id_marker) 
    arr
end
export GetBucketObjectVersionsOptions


type GetBucketOptions
    delimiter::Union(String, Nothing)
    marker::Union(String, Nothing)
    max_keys::Union(Int, Nothing)
    prefix::Union(String, Nothing)
    GetBucketOptions(;delimiter=nothing, marker=nothing, max_keys=nothing, prefix=nothing) = new(delimiter, marker, max_keys, prefix)
end
function get_subres(arr, o::GetBucketOptions)
    @chk_n_add("delimiter", o.delimiter) 
    @chk_n_add("marker", o.marker) 
    @chk_n_add("max-keys", o.max_keys) 
    @chk_n_add("prefix", o.prefix) 
    arr
end
export GetBucketOptions


type Deleted
    key::Union(String, Nothing)
    version_id::Union(String, Nothing) 
    marker::Union(Bool, Nothing)
    marker_version_id::Union(String, Nothing)
end
Deleted() = Deleted(nothing,nothing,nothing,nothing)
function Deleted(pd::ETree)
    d = Deleted()
    d.key = find(pd, "Key#string")
    d.version_id = find(pd, "VersionId#string") 
    d.marker = AWS.safe_parsebool(find(pd, "DeleteMarker#string"))
    d.marker_version_id = find(pd, "DeleteMarkerVersionId#string")
    d
end
export Deleted



type DeleteError
    key::Union(String, Nothing)
    version_id::Union(String, Nothing) 
    code::Union(String, Nothing)
    message::Union(String, Nothing)
end
DeleteError() = DeleteError(nothing,nothing,nothing,nothing)
function DeleteError(pd::ETree)
    de = DeleteError()
    de.key = find(pd, "Key#string")
    de.version_id = find(pd, "VersionId#string") 
    de.code = find(pd, "Code#string")
    de.message = find(pd, "Message#string")
    de
end
export DeleteError


type DeleteResult
    deleted::Union(Vector{Deleted}, Nothing)
    delete_errors::Union(Vector{DeleteError}, Nothing)
end
DeleteResult() = DeleteResult(nothing, nothing)
function DeleteResult(pd::ETree)
    dr = DeleteResult()
    deleted = pd["Deleted"]
    if length(deleted) > 0
        dr.deleted = AWS.@parse_vector(AWS.S3.Deleted, deleted)
    end
    delete_errors = pd["Error"]
    if length(delete_errors) > 0
        dr.delete_errors = AWS.@parse_vector(AWS.S3.DeleteError, delete_errors)
    end
    dr
end
export DeleteResult