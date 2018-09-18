
# Seems like Metadata is not returned via XML in case of the REST API.
# type MetadataEntry
#     name::String
#     value::String
# end

const XMLNS_ATTR = "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
xml_hdr(name) = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><$(name) xmlns=\"http://doc.s3.amazonaws.com/2006-03-01\">"
xml_ftr(name) = "</$(name)>"


macro add_amz_hdr(hdrs, name, value)
    quote
        if ($(esc(value)) != nothing) push!($(esc(hdrs)), ("x-amz-" * $(esc(name)), string($(esc(value)))  )) end
    end
end

macro chk_n_add(arr, name, value)
    quote
        if ($(esc(value)) != nothing) push!($(esc(arr)), ($(esc(name)), string($(esc(value)))  )) end
    end
end


macro declare_utype(utype)
    quote
        mutable struct $(esc(utype))
            id::String
            displayName::Union{String, Void}
        end

        xml(o::$(esc(utype))) = xml($(string(utype)), [("ID", o.id), ("DisplayName", o.displayName)])
        function $(esc(utype))(pd)
            o = $(esc(utype))(LightXML.content(LightXML.find_element(pd, "ID")), LightXML.content(LightXML.find_element(pd, "DisplayName")))
        end
        $(esc(utype))(nothing::Void) = nothing
    end
end

@declare_utype Owner
@declare_utype Initiator
export Owner, Initiator


mutable struct GranteeEmail
    email::String
end
xml(o::GranteeEmail) = xml("Grantee", [("EmailAddress", o.email)], xmlns=$XMLNS_ATTR, xsi_type="AmazonCustomerByEmail")
export GranteeEmail

mutable struct GranteeURI
    uri::String
end
xml(o::GranteeURI) = xml("Grantee", [("URI", o.uri)], xmlns=$XMLNS_ATTR, xsi_type="Group")
export GranteeURI

mutable struct GranteeID
    id::String
    displayName::String
end
xml(o::GranteeID) = xml("Grantee", [("ID", o.id), ("DisplayName", o.displayName)], xmlns=$XMLNS_ATTR, xsi_type="CanonicalUser")
export GranteeID


mutable struct Grant
    grantee::Union{GranteeEmail, GranteeURI, GranteeID}
    permission::String
end
xml(o::Grant) = xml("Grant", [o.grantee, ("Permission", o.permission)])
# permission must be one of "READ", "WRITE", "READ_ACP", "WRITE_ACP" or "FULL_CONTROL"
function Grant(pd_g)
	## TODO
    grantee_pd = LightXML.find_element(pd_g, "Grantee[1]")
    grantee_type = grantee_pd.attr["xsi:type"]
    if grantee_type == "AmazonCustomerByEmail"
        grantee=GranteeEmail(LightXML.content(LightXML.find_element(grantee_pd, "EmailAddress")))
    elseif grantee_type == "CanonicalUser"
        grantee=GranteeID(LightXML.content(LightXML.find_element(grantee_pd, "ID")), LightXML.content(LightXML.find_element(grantee_pd, "DisplayName")))
    elseif grantee_type == "Group"
        grantee=GranteeURI(LightXML.content(LightXML.find_element(grantee_pd, "URI")))
    else
        error("Unknown grantee type")
    end

    permission = LightXML.content(LightXML.find_element(pd_g, "Permission"))
    Grant(grantee, permission)
end
export Grant



mutable struct BucketLoggingStatus
    loggingEnabled::Union{Bool, Void}
    targetBucket::Union{String, Void}
    targetPrefix::Union{String, Void}
    targetGrants::Union{Vector{Grant}, Void}
end

BucketLoggingStatus() = BucketLoggingStatus(false, nothing, nothing, nothing)
function BucketLoggingStatus(pd_bls)
    bls = BucketLoggingStatus()
    if length(pd_bls["LoggingEnabled"]) > 0
        bls.targetBucket = LightXML.content(LightXML.find_element(LightXML.find_element(pd_bls, "LoggingEnabled"), "TargetBucket"))
        bls.targetPrefix = LightXML.content(LightXML.find_element(LightXML.find_element(pd_bls, "LoggingEnabled"), "TargetPrefix"))

        ## grants = LightXML.find_element(pd_bls, "LoggingEnabled/TargetGrants/Grant")
        bls.targetGrants = AWS.@parse_vector(AWS.S3.Grant, elements_by_tagname(LightXML.find_element(LightXML.find_element(pd_bls, "LoggingEnabled"), "TargetGrants"), "Grant"))
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



mutable struct AccessControlPolicy
    owner::Owner
    accessControlList::Vector{Grant}
end

function AccessControlPolicy(pd_acl)
    owner = Owner(LightXML.find_element(pd_acl, "Owner"))
    accessControlList = AWS.@parse_vector(AWS.S3.Grant, elements_by_tagname(LightXML.find_element(pd_acl, "AccessControlList"), "Grant"))
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


mutable struct CreateBucketConfiguration{T<:Union{String, Void}}
    locationConstraint::T
end
CreateBucketConfiguration(pd_cbc) = CreateBucketConfiguration(LightXML.content(LightXML.find_element(pd_cbc, "LocationConstraint")))
xml(o::CreateBucketConfiguration) = xml_hdr("CreateBucketConfiguration") *
                                    xml("LocationConstraint", o.locationConstraint) *
                                    xml_ftr("CreateBucketConfiguration")
export CreateBucketConfiguration



mutable struct Contents
    key::Union{String, Void}
    lastModified::DateTime
    eTag::Union{String, Void}
    size::Union{Int64, Void}
    owner::Union{Owner, Void}
    storageClass::Union{String, Void}
end
function Contents(pd_le)
    key = LightXML.content(LightXML.find_element(pd_le, "Key"))
    datestr = LightXML.content(LightXML.find_element(pd_le, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")
    etag = LightXML.content(LightXML.find_element(pd_le, "ETag"))
    size = AWS.safe_parseint64(LightXML.content(LightXML.find_element(pd_le, "Size")))
    owner=Owner(LightXML.find_element(pd_le, "Owner"))
    storageClass = LightXML.content(LightXML.find_element(pd_le, "StorageClass"))

    Contents(key, t, etag, size, owner, storageClass)
end
export Contents



mutable struct CommonPrefixes{T<:Union{String, Void}}
    prefix::T
end
CommonPrefixes(pd_cp) = CommonPrefixes(LightXML.content(LightXML.find_element(pd_cp, "Prefix")))
export CommonPrefixes


mutable struct ListBucketResult
    name::Union{String, Void}
    prefix::Union{String, Void}
    marker::Union{String, Void}
    nextMarker::Union{String, Void}
    maxKeys::Union{Int, Void}
    delimiter::Union{String, Void}
    isTruncated::Union{Bool, Void}
    contents::Vector{Contents}
    commonPrefixes::Vector{CommonPrefixes}

    ListBucketResult() = new(nothing,nothing,nothing,nothing,nothing,nothing,nothing,Contents[], CommonPrefixes[])
end

function ListBucketResult(pd_lbr)
    lbr = ListBucketResult()
    lbr.name = LightXML.content(LightXML.find_element(pd_lbr, "Name"))
    lbr.prefix = LightXML.content(LightXML.find_element(pd_lbr, "Prefix"))
    lbr.marker = LightXML.content(LightXML.find_element(pd_lbr, "Marker"))
    lbr.nextMarker = LightXML.find_element(pd_lbr, "NextMarker") != nothing ? LightXML.content(LightXML.find_element(pd_lbr, "NextMarker")) : ""
    lbr.maxKeys = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd_lbr, "MaxKeys")))
    lbr.delimiter = LightXML.find_element(pd_lbr, "Delimiter") != nothing ? LightXML.content(LightXML.find_element(pd_lbr, "Delimiter")) : ""
    lbr.isTruncated = AWS.safe_parsebool(LightXML.content(LightXML.find_element(pd_lbr, "IsTruncated")))
    lbr.contents = AWS.@parse_vector(AWS.S3.Contents, elements_by_tagname(pd_lbr, "Contents"))
    lbr.commonPrefixes = AWS.@parse_vector(AWS.S3.CommonPrefixes, elements_by_tagname(pd_lbr, "CommonPrefixes"))
    lbr
end
export ListBucketResult

mutable struct Version
    key::Union{String, Void}
    versionId::Union{String, Void}
    isLatest::Union{Bool, Void}
    lastModified::DateTime
    eTag::Union{String, Void}
    size::Union{Int64, Void}
    owner::Union{Owner, Void}
    storageClass::Union{String, Void}
end
function Version(pd_v)
    key = LightXML.content(LightXML.find_element(pd_v, "Key"))
    versionId = LightXML.content(LightXML.find_element(pd_v, "VersionId"))
    isLatest = (lowercase(LightXML.content(LightXML.find_element(pd_v, "IsLatest"))) == "true") ? true : false
    datestr = LightXML.content(LightXML.find_element(pd_v, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")
    etag = LightXML.content(LightXML.find_element(pd_v, "ETag"))
    size = AWS.safe_parseint64(LightXML.content(LightXML.find_element(pd_v, "Size")))
    owner=Owner(LightXML.find_element(pd_v, "Owner"))
    storageClass = LightXML.content(LightXML.find_element(pd_v, "StorageClass"))

    Version(key, versionId, isLatest, t, etag, size, owner, storageClass)
end
export Version



mutable struct DeleteMarker
    key::Union{String, Void}
    versionId::Union{String, Void}
    isLatest::Union{Bool, Void}
    lastModified::DateTime
    owner::Union{Owner, Void}
end
function DeleteMarker(pd_dm)
    key = LightXML.content(LightXML.find_element(pd_dm, "Key"))
    versionId = LightXML.content(LightXML.find_element(pd_dm, "VersionId"))
    isLatest = (lowercase(LightXML.content(LightXML.find_element(pd_dm, "IsLatest"))) == "true") ? true : false
    datestr = LightXML.content(LightXML.find_element(pd_dm, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")
    owner=Owner(LightXML.find_element(pd_dm, "Owner"))
    DeleteMarker(key, versionId, isLatest, t, owner)
end
export DeleteMarker




mutable struct ListVersionsResult
    name::Union{String, Void}
    prefix::Union{String, Void}
    keyMarker::Union{String, Void}
    versionIdMarker::Union{String, Void}
    nextKeyMarker::Union{String, Void}
    nextVersionIdMarker::Union{String, Void}
    maxKeys::Union{Int, Void}
    delimiter::Union{String, Void}
    isTruncated::Union{Bool, Void}
    version::Union{Vector{Version}, Void}
    deleteMarker::Union{Vector{DeleteMarker}, Void}
    commonPrefixes::Union{Vector{CommonPrefixes}, Void}

    ListVersionsResult() = new()
end
function ListVersionsResult(pd_lvr)
    lvr = ListVersionsResult()
    lvr.name = LightXML.content(LightXML.find_element(pd_lvr, "Name"))
    lvr.prefix = LightXML.content(LightXML.find_element(pd_lvr, "Prefix"))
    lvr.keyMarker = LightXML.content(LightXML.find_element(pd_lvr, "KeyMarker"))
    lvr.versionIdMarker = LightXML.content(LightXML.find_element(pd_lvr, "VersionIdMarker"))
    lvr.nextKeyMarker = LightXML.content(LightXML.find_element(pd_lvr, "NextKeyMarker"))
    lvr.nextVersionIdMarker = LightXML.content(LightXML.find_element(pd_lvr, "NextVersionIdMarker"))
    lvr.maxKeys = AWS.safe_parseint(LightXML.content(LightXML.find_element(pd_lvr, "MaxKeys")))
    lvr.delimiter = LightXML.content(LightXML.find_element(pd_lvr, "Delimiter"))
    lvr.isTruncated = AWS.safe_parsebool(LightXML.content(LightXML.find_element(pd_lvr, "IsTruncated")))
    lvr.version = AWS.@parse_vector(AWS.S3.Version, elements_by_tagname(pd_lvr, "Version"))
    lvr.deleteMarker = AWS.@parse_vector(AWS.S3.DeleteMarker, elements_by_tagname(pd_lvr, "DeleteMarker"))
    lvr.commonPrefixes = AWS.@parse_vector(AWS.S3.CommonPrefixes, elements_by_tagname(pd_lvr, "CommonPrefixes"))
    lvr
end
export ListVersionsResult



mutable struct Bucket
    name::Union{String, Void}
    creationDate::DateTime
end
function Bucket(pd_b)
    datestr = LightXML.content(LightXML.find_element(pd_b, "CreationDate"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")

    Bucket(LightXML.content(LightXML.find_element(pd_b, "Name")), t)
end
export Bucket




mutable struct ListAllMyBucketsResult
    owner::Union{Owner, Void}
    buckets::Vector{Bucket}
end
function ListAllMyBucketsResult(pd_lab)
    owner = Owner(LightXML.find_element(pd_lab, "Owner"))
    buckets = AWS.@parse_vector(AWS.S3.AWS.S3.Bucket, elements_by_tagname(LightXML.find_element(pd_lab, "Buckets"), "Bucket"))
    ListAllMyBucketsResult(owner, buckets)
end
export ListAllMyBucketsResult


mutable struct CopyObjectResult
    lastModified::DateTime
    eTag::Union{String, Void}
end
function CopyObjectResult(pd_cor)
    datestr = LightXML.content(LightXML.find_element(pd_cor, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")

    CopyObjectResult(t, LightXML.content(LightXML.find_element(pd_cor, "ETag")))
end
export CopyObjectResult



mutable struct RequestPaymentConfiguration{T<:Union{String, Void}}
    payer::T
end
xml(o::RequestPaymentConfiguration) = xml_hdr("RequestPaymentConfiguration") * xml("Payer", o.payer) * xml_ftr("RequestPaymentConfiguration")
RequestPaymentConfiguration(pd_rpc) = RequestPaymentConfiguration(LightXML.content(LightXML.find_element(pd_rpc, "Payer")))
export RequestPaymentConfiguration

mutable struct VersioningConfiguration
    status::Union{String, Void}
    mfaDelete::Union{String, Void}
end
function xml(o::VersioningConfiguration)
    xml_hdr("VersioningConfiguration") *
    ((o.status != "") ? xml("Status", o.status) : "") *
    ((o.mfaDelete != "") ? xml("MfaDelete", o.mfaDelete) : "")  *
    xml_ftr("VersioningConfiguration")
end
function VersioningConfiguration(pd_vc)
    status = LightXML.find_element(pd_vc, "Status")  != nothing ? LightXML.content(LightXML.find_element(pd_vc, "Status")) : ""
    mfaDelete = LightXML.find_element(pd_vc, "MfaDelete") != nothing ? LightXML.content(LightXML.find_element(pd_vc, "MfaDelete")) : ""

    VersioningConfiguration(status, mfaDelete)
end
export VersioningConfiguration

mutable struct TopicConfiguration
    topic::Union{String, Void}
    event::Vector{String}
end
function TopicConfiguration(pd_tc)
    topic = LightXML.content(LightXML.find_element(pd_tc, "Topic"))
    event = String[]
    for pde in LightXML.find_element(pd_tc, "Event")
        ## push!(event, pde.text)
        push!(event, LightXML.content(pde))
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



mutable struct NotificationConfiguration{T<:Union{Vector{TopicConfiguration}, Void}}
    topicConfiguration::T
end
NotificationConfiguration(pd) = NotificationConfiguration(AWS.@parse_vector(AWS.S3.TopicConfiguration, elements_by_tagname(pd, "TopicConfiguration")))

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


mutable struct InitiateMultipartUploadResult
    bucket::Union{String, Void}
    key::Union{String, Void}
    uploadId::Union{String, Void}
end
function InitiateMultipartUploadResult(pd)
    InitiateMultipartUploadResult(LightXML.content(LightXML.find_element(pd, "Bucket")), LightXML.content(LightXML.find_element(pd, "Key")), LightXML.content(LightXML.find_element(pd, "UploadId")))
end
export InitiateMultipartUploadResult



mutable struct CopyPartResult
   lastModified::DateTime
   eTag::Union{String, Void}
end
function CopyPartResult(pd)
    datestr = LightXML.content(LightXML.find_element(pd, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S")
    CopyPartResult(t, LightXML.content(LightXML.find_element(pd, "ETag")))
end
export CopyPartResult

mutable struct Part
    partNumber::Union{String, Void}
    lastModified::Union{DateTime, Void}
    eTag::Union{String, Void}
    size::Union{Int64, Void}

    Part(partNumber, eTag) = new(partNumber, nothing, eTag, nothing)
    Part(partNumber, lastModified, eTag, size) = new(partNumber, lastModified, eTag, size)
end
# We don't need to xmlify lastModified and Size...
xml(o::Part) = xml("Part", [("PartNumber", o.partNumber), ("ETag", o.eTag)])
function Part(pd)
    datestr = LightXML.content(LightXML.find_element(pd, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")

    Part(LightXML.content(LightXML.find_element(pd, "PartNumber")), t, LightXML.content(LightXML.find_element(pd, "ETag")), int64(LightXML.content(LightXML.find_element(pd, "Size"))))
end
export Part

mutable struct CompleteMultipartUpload
    parts::Vector{Part}
end
xml(o::CompleteMultipartUpload) = xml("CompleteMultipartUpload", o.parts)
export CompleteMultipartUpload


mutable struct CompleteMultipartUploadResult
    location::Union{String, Void}
    bucket::Union{String, Void}
    key::Union{String, Void}
    eTag::Union{String, Void}
end
CompleteMultipartUploadResult(pd) =
    CompleteMultipartUploadResult(
        LightXML.content(LightXML.find_element(pd, "Location")),
        LightXML.content(LightXML.find_element(pd, "Bucket")),
        LightXML.content(LightXML.find_element(pd, "Key")),
        LightXML.content(LightXML.find_element(pd, "ETag")),
    )
export CompleteMultipartUploadResult


mutable struct ListPartsResult
    bucket::Union{String, Void}
    key::Union{String, Void}
    uploadId::Union{String, Void}
    initiator::Initiator
    owner::Union{Owner, Void}
    storageClass::Union{String, Void}
    partNumberMarker::Union{String, Void}
    nextPartNumberMarker::Union{String, Void}
    maxParts::Union{Int, Void}
    isTruncated::Union{Bool, Void}
    parts::Vector{Part}
end
function ListPartsResult(pd)
    ListPartsResult(
        LightXML.content(LightXML.find_element(pd, "Bucket")),
        LightXML.content(LightXML.find_element(pd, "Key")),
        LightXML.content(LightXML.find_element(pd, "UploadId")),
        Initiator(LightXML.find_element(pd, "Initiator")),
        Owner(LightXML.find_element(pd, "Owner")),
        LightXML.content(LightXML.find_element(pd, "StorageClass")),
        LightXML.content(LightXML.find_element(pd, "PartNumberMarker")),
        LightXML.content(LightXML.find_element(pd, "NextPartNumberMarker")),
        int(LightXML.content(LightXML.find_element(pd, "MaxParts"))),
        (lowercase(LightXML.content(LightXML.find_element(pd, "IsTruncated"))) == "true") ? true : false,
        AWS.@parse_vector(AWS.S3.Part, elements_by_tagname(pd, "Part"))
    )
end
export ListPartsResult

mutable struct Upload
    key::Union{String, Void}
    uploadId::Union{String, Void}
    initiator::Union{Initiator, Void}
    owner::Union{Owner, Void}
    storageClass::Union{String, Void}
    initiated::Union{DateTime, Void}
end
function Upload(pd)
    datestr = LightXML.content(LightXML.find_element(pd, "Initiated"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")
    Upload(
        LightXML.content(LightXML.find_element(pd, "Key")),
        LightXML.content(LightXML.find_element(pd, "UploadId")),
        Initiator(LightXML.find_element(pd, "Initiator")),
        Owner(LightXML.find_element(pd, "Owner")),
        LightXML.content(LightXML.find_element(pd, "StorageClass")),
        t
    )
end
export Upload

mutable struct ListMultipartUploadsResult
    bucket::Union{String, Void}
    prefix::Union{String, Void}
    keyMarker::Union{String, Void}
    uploadIdMarker::Union{String, Void}
    nextKeyMarker::Union{String, Void}
    nextUploadIdMarker::Union{String, Void}
    maxUploads::Union{Int, Void}
    delimiter::Union{String, Void}
    isTruncated::Union{Bool, Void}
    upload::Union{Vector{Upload}, Void}
    commonPrefixes::Union{Vector{CommonPrefixes}, Void}
end
function ListMultipartUploadsResult(pd)
    ListMultipartUploadsResult(
        LightXML.content(LightXML.find_element(pd, "Bucket")),
        LightXML.content(LightXML.find_element(pd, "Prefix")),
        LightXML.content(LightXML.find_element(pd, "KeyMarker")),
        LightXML.content(LightXML.find_element(pd, "UploadIdMarker")),
        LightXML.content(LightXML.find_element(pd, "NextKeyMarker")),
        LightXML.content(LightXML.find_element(pd, "NextUploadIdMarker")),
        AWS.safe_parseint(LightXML.content(LightXML.find_element(pd, "MaxUploads"))),
        LightXML.content(LightXML.find_element(pd, "Delimiter")),
        AWS.safe_parsebool(LightXML.content(LightXML.find_element(pd, "IsTruncated"))),
        AWS.@parse_vector(AWS.S3.Upload, elements_by_tagname(pd, "Upload")),
        AWS.@parse_vector(AWS.S3.CommonPrefixes, elements_by_tagname(pd, "CommonPrefixes"))
    )
end
export ListMultipartUploadsResult

mutable struct CORSRule
    id::Union{String, Void}
    allowedMethod::Union{Vector{String}, Void}
    allowedOrigin::Union{Vector{String}, Void}
    allowedHeader::Union{Vector{String}, Void}
    maxAgeSeconds::Union{String, Int}
    exposeHeader::Union{Vector{String}, Void}
end

xml(o::CORSRule) = xml("CORSRule", [
        ("ID", o.id),
        ("AllowedMethod", o.allowedMethod),
        ("AllowedOrigin", o.allowedOrigin),
        ("AllowedHeader", o.allowedHeader),
        ("MaxAgeSeconds", o.maxAgeSeconds),
        ("ExposeHeader", o.exposeHeader)
    ])

function CORSRule(pd)
    id = LightXML.content(LightXML.find_element(pd, "ID"))
    allowedMethod = parse_vector_as(String, "AllowedMethod", elements_by_tagname(pd, "AllowedMethod"))
    allowedOrigin = parse_vector_as(String, "AllowedOrigin", elements_by_tagname(pd, "AllowedOrigin"))
    allowedHeader = parse_vector_as(String, "AllowedHeader", elements_by_tagname(pd, "AllowedHeader"))
    seconds = LightXML.content(LightXML.find_element(pd, "MaxAgeSeconds"))
    if (seconds != nothing) maxAgeSeconds = int(seconds) end
    exposeHeader = parse_vector_as(String, "ExposeHeader", elements_by_tagname(pd, "ExposeHeader"))

    CORSRule(id, allowedMethod, allowedOrigin, allowedHeader, maxAgeSeconds, exposeHeader)

end
export CORSRule


mutable struct CORSConfiguration{T<:Vector{CORSRule}}
    corsrules::T
end
xml(o::CORSConfiguration) = xml("CORSConfiguration", o.corsrules)
CORSConfiguration(pd) = AWS.@parse_vector(AWS.S3.CORSRule, elements_by_tagname(pd, "CORSRule"))


mutable struct S3Error
    code::Union{String, Void}
    message::Union{String, Void}
    hostId::Union{String, Void}
    requestId::Union{String, Void}
end
function S3Error(pde)
    code = LightXML.content(LightXML.find_element(pde, "Code"))
    message = LightXML.content(LightXML.find_element(pde, "Message"))
    
    # this might be redundant as it often returns empty, AWS docs 
    # at http://docs.aws.amazon.com/AmazonS3/latest/API/ErrorResponses.html
    # are incomplete
    _resrce = LightXML.find_element(pde, "Resource")
    resource =  _resrce != Void() ? LightXML.content(_resrce) : Void()

    _sig = LightXML.find_element(pde, "SignatureProvided")
    signature =  _sig != Void() ? LightXML.content(_sig) : Void()

    hostId = LightXML.content(LightXML.find_element(pde, "HostId"))
    requestId = LightXML.content(LightXML.find_element(pde, "RequestId"))

    S3Error(code, message, hostId, requestId)
end

export CORSConfiguration


mutable struct S3PartTag
    part_number::String
    etag::String
end
xml(o::S3PartTag) = xml("Part", [("PartNumber", o.part_number), ("ETag", o.etag)])

mutable struct CopyMatchOptions
    if_match::Union{String, Void}
    if_none_match::Union{String, Void}
    if_unmodified_since::Union{String, Void}
    if_modified_since::Union{String, Void}
    CopyMatchOptions(;if_match=nothing, if_none_match=nothing, if_unmodified_since=nothing, if_modified_since=nothing) = begin
        new(if_match, if_none_match, if_unmodified_since, if_modified_since)
    end
end
function amz_headers(hdrs, o::CopyMatchOptions)
    @add_amz_hdr(hdrs, "copy-source-if-match", o.if_match)
    @add_amz_hdr(hdrs, "copy-source-if-none-match", o.if_none_match)
    @add_amz_hdr(hdrs, "copy-source-if-unmodified-since", o.if_unmodified_since)
    @add_amz_hdr(hdrs, "copy-source-if-modified-since", o.if_modified_since)
    hdrs
end
export S3PartTag


mutable struct S3_ACL_Grantee
    email_address::Union{String, Void}
    id::Union{String, Void}
    uri::Union{String, Void}
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


mutable struct S3_ACL
    acl::Union{String, Void}
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
        @add_amz_hdr(hdrs, "acl", o.acl)
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
        @add_amz_hdr(hdrs, xamz_name, hdr_str(a))
    end
    hdrs
end
export S3_ACL


mutable struct CopyObjectOptions
# All are x-amz options
    copy_source::String
    metadata_directive::Union{String, Void}
    match_options::Union{CopyMatchOptions, Void}

# x-amz only header fields
    server_side_encryption::Union{String, Void}
    storage_class::Union{String, Void}
    website_redirect_location::Union{String, Void}
    acl::Union{S3_ACL, Void}

    CopyObjectOptions(copy_source; metadata_directive=nothing, match_options=nothing,
        server_side_encryption=nothing, storage_class=nothing, website_redirect_location=nothing, acl=nothing) = begin
            new(copy_source, metadata_directive,  match_options, server_side_encryption, storage_class, website_redirect_location, acl)
    end

end
function amz_headers(hdrs, o::CopyObjectOptions)
    @add_amz_hdr(hdrs, "copy-source", o.copy_source)
    @add_amz_hdr(hdrs, "metadata-directive", o.metadata_directive)

    if (o.match_options != nothing)
        hdrs = amz_headers(hdrs, o.match_options)
    end

    @add_amz_hdr(hdrs, "server-side-encryption", o.server_side_encryption)
    @add_amz_hdr(hdrs, "storage-class", o.storage_class)
    @add_amz_hdr(hdrs, "website-redirect-location", o.website_redirect_location)

    if o.acl != nothing
        hdrs = amz_headers(hdrs, o.acl)
    end
    hdrs
end
export CopyObjectOptions


mutable struct CopyUploadPartOptions
    copy_source::String
    source_range::Union{String, Void}
    match_options::Union{CopyMatchOptions, Void}

    CopyUploadPartOptions(copy_source; source_range=nothing, match_options=nothing) = new(copy_source, source_range, match_options)
end
function amz_headers(o::CopyUploadPartOptions)
    hdrs = [("x-amz-copy-source", o.copy_source)]
    @add_amz_hdr(hdrs, "source-range", o.source_range)
    hdrs = (o.match_options != nothing) ? amz_headers(hdrs, o.match_options) : hdrs
    hdrs
end
export CopyUploadPartOptions


mutable struct PutObjectOptions
# Standard HTTP headers
    cache_control::Union{String, Void}
    content_disposition::Union{String, Void}
    content_encoding::Union{String, Void}
    cont_typ::Union{String, Void}
#Expect  not supported...
    expires::Union{DateTime, Void}

# x-amz header fields
    meta::Union{Dict{String, String}, Void}
    server_side_encryption::Union{String, Void}
    storage_class::Union{String, Void}
    website_redirect_location::Union{String, Void}
    acl::Union{S3_ACL, Void}

    PutObjectOptions(;cache_control=nothing,content_disposition=nothing,content_encoding=nothing,
                        cont_typ=nothing,expires=nothing,meta=nothing,server_side_encryption=nothing,
                        storage_class=nothing,website_redirect_location=nothing,acl=nothing) = begin
            new(cache_control,content_disposition,content_encoding,cont_typ,expires,meta,server_side_encryption,storage_class,website_redirect_location,acl)
    end
end
function amz_headers(hdrs, o::PutObjectOptions)
    if (o.meta != nothing)
        for t in collect(o.meta)
            @add_amz_hdr(hdrs, "meta-" * t[1], t[2])
        end
    end

    @add_amz_hdr(hdrs, "server-side-encryption", o.server_side_encryption)
    @add_amz_hdr(hdrs, "storage-class", o.storage_class)
    @add_amz_hdr(hdrs, "website-redirect-location", o.website_redirect_location)

    if o.acl != nothing
        hdrs = amz_headers(hdrs, o.acl)
    end
    hdrs
end

function http_headers(arr, o::PutObjectOptions)
    @chk_n_add(arr, "Cache-Control", o.cache_control)
    @chk_n_add(arr, "Content-Disposition", o.content_disposition)
    @chk_n_add(arr, "Content-Encoding", o.content_encoding)
    @chk_n_add(arr, "Expires", rfc1123_date(o.expires))
    arr
end
export PutObjectOptions



mutable struct GetObjectOptions
    # These go into the query string
    response_cont_typ::Union{String, Void}
    response_content_language::Union{String, Void}
    response_expires::Union{String, Void}
    response_cache_control::Union{String, Void}
    response_content_disposition::Union{String, Void}
    response_content_encoding::Union{String, Void}

    # These go into the header
    range::Union{String, Void}
    if_modified_since::Union{DateTime, Void}
    if_unmodified_since::Union{DateTime, Void}
    if_match::Union{String, Void}
    if_none_match::Union{String, Void}

    GetObjectOptions(;response_cont_typ=nothing, response_content_language=nothing, response_expires=nothing, response_cache_control=nothing, response_content_disposition=nothing,
        response_content_encoding=nothing, range=nothing, if_modified_since=nothing, if_unmodified_since=nothing, if_match=nothing, if_none_match=nothing) = begin
            new(response_cont_typ, response_content_language, response_expires, response_cache_control, response_content_disposition,response_content_encoding, range, if_modified_since, if_unmodified_since, if_match, if_none_match)
        end
end
function http_headers(arr, o::GetObjectOptions)
    @chk_n_add(arr, "Range", o.range)
    @chk_n_add(arr, "If-Modified-Since", rfc1123_date(o.if_modified_since))
    @chk_n_add(arr, "If-Unmodified-Since", rfc1123_date(o.if_unmodified_since))
    @chk_n_add(arr, "If-Match", o.if_match)
    @chk_n_add(arr, "If-None-Match", o.if_none_match)
    arr
end

function query_params(arr, o::GetObjectOptions)
    @chk_n_add(arr, "response-cont-typ", o.response_cont_typ)
    @chk_n_add(arr, "response-content-language", o.response_content_language)
    @chk_n_add(arr, "response-expires", o.response_expires)
    @chk_n_add(arr, "response-cache-control", o.response_cache_control)
    @chk_n_add(arr, "response-content-disposition", o.response_content_disposition)
    @chk_n_add(arr, "response-content-encoding", o.response_content_encoding)
    arr
end
export GetObjectOptions


mutable struct ObjectType
    key::String
    versionId::Union{String, Void}
    ObjectType(key) = ObjectType(key, nothing)
    ObjectType(key, version) = new(key, version)
end
function xml(o::ObjectType)
    xml("Object", [("Key", o.key), ("VersionId", o.versionId)])
end
export ObjectType


mutable struct DeleteObjectsType
    quiet::Bool
    objects::Vector{ObjectType}
    DeleteObjectsType() = DeleteObjectsType(false, ObjectType[])
    DeleteObjectsType(objects) = DeleteObjectsType(objects, false)
    DeleteObjectsType(objects, quiet) = new(quiet, objects)
end
function xml(o::DeleteObjectsType)
    xml("Delete", [("Quiet", o.quiet); o.objects])
end
export DeleteObjectsType


mutable struct Tag
    key::String
    value::String
end
xml(o::Tag) = xml("Tag", [("Key", o.key), ("Value", o.value)])
export Tag


# Not a xmlns type
mutable struct Tagging
    tagSet::Vector{Tag}
end
xml(o::Tagging) = xml("Tagging", [("TagSet", o.tagSet)])
export Tagging

mutable struct GetBucketUploadsOptions
    delimiter::Union{String, Void}
    key_marker::Union{String, Void}
    max_uploads::Union{Int, Void}
    prefix::Union{String, Void}
    upload_id_marker::Union{String, Void}

    GetBucketUploadsOptions(; delimiter=nothing, key_marker=nothing, max_uploads=nothing, prefix=nothing, upload_id_marker=nothing) = begin
        new(delimiter, key_marker, max_uploads, prefix, upload_id_marker)
    end
end
function get_subres(arr, o::GetBucketUploadsOptions)
    @chk_n_add(arr, "delimiter", o.delimiter)
    @chk_n_add(arr, "key-marker", o.key_marker)
    @chk_n_add(arr, "max-uploads", o.max_uploads)
    @chk_n_add(arr, "prefix", o.prefix)
    @chk_n_add(arr, "upload-id-marker", o.upload_id_marker)
    arr
end
export GetBucketUploadsOptions



mutable struct GetBucketObjectVersionsOptions
    delimiter::Union{String, Void}
    key_marker::Union{String, Void}
    max_keys::Union{Int, Void}
    prefix::Union{String, Void}
    version_id_marker::Union{String, Void}
    GetBucketObjectVersionsOptions(; delimiter=nothing, key_marker=nothing, max_keys=nothing, prefix=nothing, version_id_marker=nothing) = begin
        new(delimiter, key_marker, max_keys, prefix, version_id_marker)
    end
end
function get_subres(arr, o::GetBucketObjectVersionsOptions)
    @chk_n_add(arr, "delimiter", o.delimiter)
    @chk_n_add(arr, "key-marker", o.key_marker)
    @chk_n_add(arr, "max-keys", o.max_keys)
    @chk_n_add(arr, "prefix", o.prefix)
    @chk_n_add(arr, "version-id-marker", o.version_id_marker)
    arr
end
export GetBucketObjectVersionsOptions


mutable struct GetBucketOptions
    delimiter::Union{String, Void}
    marker::Union{String, Void}
    max_keys::Union{Int, Void}
    prefix::Union{String, Void}
    GetBucketOptions(;delimiter=nothing, marker=nothing, max_keys=nothing, prefix=nothing) = new(delimiter, marker, max_keys, prefix)
end
function get_subres(arr, o::GetBucketOptions)
    @chk_n_add(arr, "delimiter", o.delimiter)
    @chk_n_add(arr, "marker", o.marker)
    @chk_n_add(arr, "max-keys", o.max_keys)
    @chk_n_add(arr, "prefix", o.prefix)
    arr
end
export GetBucketOptions


mutable struct Deleted
    key::Union{String, Void}
    version_id::Union{String, Void}
    marker::Union{Bool, Void}
    marker_version_id::Union{String, Void}
end
Deleted() = Deleted(nothing,nothing,nothing,nothing)
function Deleted(pd)
    d = Deleted()
    d.key = LightXML.content(LightXML.find_element(pd, "Key"))
    d.version_id = LightXML.find_element(pd, "VersionId") != nothing ? LightXML.content(LightXML.find_element(pd, "VersionId")) : nothing
    d.marker = LightXML.find_element(pd, "DeleteMarker") != nothing ? AWS.safe_parsebool(LightXML.content(LightXML.find_element(pd, "DeleteMarker"))) : nothing
    d.marker_version_id = LightXML.find_element(pd, "DeleteMarkerVersionId") != nothing ? LightXML.content(LightXML.find_element(pd, "DeleteMarkerVersionId")) : nothing
    d
end
export Deleted



mutable struct DeleteError
    key::Union{String, Void}
    version_id::Union{String, Void}
    code::Union{String, Void}
    message::Union{String, Void}
end
DeleteError() = DeleteError(nothing,nothing,nothing,nothing)
function DeleteError(pd)
    de = DeleteError()
    de.key = LightXML.content(LightXML.find_element(pd, "Key"))
    de.version_id = LightXML.find_element(pd, "VersionId") != nothing ? LightXML.content(LightXML.find_element(pd, "VersionId")) : nothing
    de.code = LightXML.find_element(pd, "Code") != nothing ? LightXML.content(LightXML.find_element(pd, "Code")) : nothing
    de.message = LightXML.find_element(pd, "Message") != noting ? LightXML.content(LightXML.find_element(pd, "Message")) : nothing
    de
end
export DeleteError


mutable struct DeleteResult
    deleted::Union{Vector{Deleted}, Void}
    delete_errors::Union{Vector{DeleteError}, Void}
end
DeleteResult() = DeleteResult(nothing, nothing)
function DeleteResult(pd)
    dr = DeleteResult()
    dr.deleted = elements_by_tagname(pd, "Deleted") != nothing ? AWS.@parse_vector(AWS.S3.Deleted, elements_by_tagname(pd, "Deleted")) : nothing
    dr.delete_errors = LightXML.find_element(pd, "Errors") != nothing ? AWS.@parse_vector(AWS.S3.DeleteError, LightXML.find_element(pd, "Errors")) : nothing
    dr
end
export DeleteResult
