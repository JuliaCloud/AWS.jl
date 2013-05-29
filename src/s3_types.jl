
# Seems like Metadata is not returned via XML in case of the REST API.
# type MetadataEntry
#     name::String
#     value::String
# end

const XMLNS_ATTR = "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
xml_hdr(name) = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><$(name) xmlns=\"http://doc.s3.amazonaws.com/2006-03-01\">"
xml_ftr(name) = "</$(name)>"



xml(o::Any) = string(o)
xml(tag::String, value::Any) = (value != nothing) ? "<$(tag)>" * xml(value) * "</$(tag)>" : ""

function xml(tag::String, children::Vector{Any}; xmlns="", xsi_type="")
    if (xsi_type != "")
        open_tag = "<$tag $xmlns xsi:type=\"$(xsi_type)\">"
    else
        open_tag = "<$tag $xmlns>"
    end
    
    children_xml = ""
    for child in children
        if isa(Tuple, child)
            (child_tag, child_value) = child
            children_xml = children_xml * xml(child_tag, child_value)
        else
            children_xml = children_xml * xml(child)
        end
    end
    
    return open_tag * children_xml * "</$(tag)>"
end




macro declare_utype(utype)
    quote
        type $(esc(utype))
            id::String         
            displayName::Union(String, Nothing)
        end
        xml(o::$(esc(utype))) = xml($(string(utype)), [("ID", o.id), ("DisplayName", o.displayName)])
        function $(esc(utype))(pd::ParsedData)
            o = $(esc(utype))(find(pd, "ID#text"), find(pd, "DisplayName#text"))  
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
        grantee=GranteeEmail(find(grantee_pd, "EmailAddress#text"))
    elseif grantee_type == "CanonicalUser"
        grantee=GranteeID(find(grantee_pd, "ID#text"), find(grantee_pd, "DisplayName#text")) 
    elseif grantee_type == "Group"
        grantee=GranteeURI(find(grantee_pd, "URI#text"))
    else
        error("Unknown grantee type")
    end
    
    permission = find(pd_g, "Permission#text")
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
        bls.targetBucket = find(pd_bls, "LoggingEnabled/TargetBucket#text")
        bls.targetPrefix = find(pd_bls, "LoggingEnabled/TargetPrefix#text")
        
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
CreateBucketConfiguration(pd_cbc::ParsedData) = CreateBucketConfiguration(find(pd_cbc, "LocationConstraint#text"))
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
    key = find(pd_le, "Key#text")
    datestr = find(pd_le, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_le, "ETag#text")
    size = safe_parseint64(find(pd_le, "Size#text"))
    owner=Owner(find(pd_le, "Owner[1]"))
    storageClass = find(pd_le, "StorageClass#text")

    Contents(key, t, etag, size, owner, storageClass)
end


type CommonPrefixes
    prefix::Union(String, Nothing)
end
CommonPrefixes(pd_cp::ParsedData) = CommonPrefixes(find(pd_cp, "Prefix#text"))

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
    lbr.name = find(pd_lbr, "Name#text")
    lbr.prefix = find(pd_lbr, "Prefix#text")
    lbr.marker = find(pd_lbr, "Marker#text")
    lbr.nextMarker = find(pd_lbr, "NextMarker#text")
    lbr.maxKeys = safe_parseint(find(pd_lbr, "MaxKeys#text")) 
    lbr.delimiter = find(pd_lbr, "Delimiter#text")
    lbr.isTruncated = safe_parsebool(find(pd_lbr, "IsTruncated#text"))
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
    key = find(pd_v, "Key#text")
    versionId = find(pd_v, "VersionId#text")
    isLatest = (lowercase(find(pd_v, "IsLatest#text")) == "true") ? true : false 
    datestr = find(pd_v, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_v, "ETag#text")
    size = safe_parseint64(find(pd_v, "Size#text"))
    owner=Owner(find(pd_v, "Owner[1]"))
    storageClass = find(pd_v, "StorageClass#text")

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
    key = find(pd_dm, "Key#text")
    versionId = find(pd_dm, "VersionId#text")
    isLatest = (lowercase(find(pd_dm, "IsLatest#text")) == "true") ? true : false 
    datestr = find(pd_dm, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
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
    lvr.name = find(pd_lvr, "Name#text")
    lvr.prefix = find(pd_lvr, "Prefix#text")
    lvr.keyMarker = find(pd_lvr, "KeyMarker#text")
    lvr.versionIdMarker = find(pd_lvr, "VersionIdMarker#text")
    lvr.nextKeyMarker = find(pd_lvr, "NextKeyMarker#text")
    lvr.nextVersionIdMarker = find(pd_lvr, "NextVersionIdMarker#text")
    lvr.maxKeys = safe_parseint(find(pd_lvr, "MaxKeys#text"))
    lvr.delimiter = find(pd_lvr, "Delimiter#text")
    lvr.isTruncated = safe_parsebool(find(pd_lvr, "IsTruncated#text"))
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
    datestr = find(pd_b, "CreationDate#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    Bucket(find(pd_b, "Name#text"), t)
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
    datestr = find(pd_cor, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    CopyObjectResult(t, find(pd_cor, "ETag#text"))
end




type RequestPaymentConfiguration
    payer::Union(String, Nothing)
end
xml(o::RequestPaymentConfiguration) = xml_hdr("RequestPaymentConfiguration") * xml("Payer", o.payer) * xml_ftr("RequestPaymentConfiguration")
RequestPaymentConfiguration(pd_rpc::ParsedData) = RequestPaymentConfiguration(find(pd_rpc, "Payer#text"))

  
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
    status = (haskey(pd_vc.elements, "Status") ? find(pd_vc, "Status#text") : "")
    mfaDelete = (haskey(pd_vc.elements, "MfaDelete") ? find(pd_vc, "MfaDelete#text") : "")
    
    VersioningConfiguration(status, mfaDelete)
end


type TopicConfiguration
    topic::Union(String, Nothing)
    event::Vector{String}
end
function TopicConfiguration(pd_tc::ParsedData)
    topic = find(pd_tc, "Topic#text")
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
    InitiateMultipartUploadResult(find(pd, "Bucket#text"), find(pd, "Key#text"), find(pd, "UploadId#text"))
end

type CopyPartResult
   lastModified::CalendarTime
   eTag::Union(String, Nothing)
end
function CopyPartResult(pd::ParsedData)
    datestr = find(pd, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss", datestr[1:end-1], "GMT")
    CopyPartResult(t, find(pd, "ETag#text"))
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
    datestr = find(pd, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")

    Part(find(pd, "PartNumber#text"), t, find(pd, "ETag#text"), int64(find(pd, "Size#text")))
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
        find(pd, "Location#text"),
        find(pd, "Bucket#text"),
        find(pd, "Key#text"),
        find(pd, "ETag#text"),
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
        find(pd, "Bucket#text"),
        find(pd, "Key#text"),
        find(pd, "UploadId#text"),
        Initiator(find(pd, "Initiator[1]")),
        Owner(find(pd, "Owner[1]")),
        find(pd, "StorageClass#text"),
        find(pd, "PartNumberMarker#text"),
        find(pd, "NextPartNumberMarker#text"),
        int(find(pd, "MaxParts#text")),
        (lowercase(find(pd, "IsTruncated#text")) == "true") ? true : false,
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
    id = find(pd, "ID#text")
    allowedMethod = parse_vector_as(String, "AllowedMethod", find(pd, "AllowedMethod"))
    allowedOrigin = parse_vector_as(String, "AllowedOrigin", find(pd, "AllowedOrigin"))
    allowedHeader = parse_vector_as(String, "AllowedHeader", find(pd, "AllowedHeader"))
    seconds = find(pd, "MaxAgeSeconds#text")
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
    code = find(pde, "Code#text")
    message = find(pde, "Message#text")
    resource = find(pde, "Resource#text")
    hostId = find(pde, "HostId#text")
    requestId = find(pde, "RequestId#text")
    
    S3Error(code, message, resource, hostId, requestId)
end



