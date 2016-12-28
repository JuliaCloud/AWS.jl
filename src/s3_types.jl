
# Seems like Metadata is not returned via XML in case of the REST API.
# type MetadataEntry
#     name::AbstractString
#     value::AbstractString
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
            id::AbstractString
            displayName::Union{AbstractString, Void}
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


type GranteeEmail
    email::AbstractString
end
xml(o::GranteeEmail) = xml("Grantee", [("EmailAddress", o.email)], xmlns=$XMLNS_ATTR, xsi_type="AmazonCustomerByEmail")
export GranteeEmail

type GranteeURI
    uri::AbstractString
end
xml(o::GranteeURI) = xml("Grantee", [("URI", o.uri)], xmlns=$XMLNS_ATTR, xsi_type="Group")
export GranteeURI

type GranteeID
    id::AbstractString
    displayName::AbstractString
end
xml(o::GranteeID) = xml("Grantee", [("ID", o.id), ("DisplayName", o.displayName)], xmlns=$XMLNS_ATTR, xsi_type="CanonicalUser")
export GranteeID


type Grant
    grantee::Union{GranteeEmail, GranteeURI, GranteeID}
    permission::AbstractString
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



type BucketLoggingStatus
    loggingEnabled::Union{Bool, Void}
    targetBucket::Union{AbstractString, Void}
    targetPrefix::Union{AbstractString, Void}
    targetGrants::Union{Vector{Grant}, Void}
end

BucketLoggingStatus() = BucketLoggingStatus(false, nothing, nothing, nothing)
function BucketLoggingStatus(pd_bls)
    bls = BucketLoggingStatus()
    if length(pd_bls["LoggingEnabled"]) > 0
        bls.targetBucket = LightXML.content(LightXML.find_element(LightXML.find_element(pd_bls, "LoggingEnabled"), "TargetBucket"))
        bls.targetPrefix = LightXML.content(LightXML.find_element(LightXML.find_element(pd_bls, "LoggingEnabled"), "TargetPrefix"))

        ## grants = LightXML.find_element(pd_bls, "LoggingEnabled/TargetGrants/Grant")
        bls.targetGrants = AWS.@parse_vector(AWS.S3.Grant, LightXML.get_elements_by_tagname(LightXML.find_element(LightXML.find_element(pd_bls, "LoggingEnabled"), "TargetGrants"), "Grant"))
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

function AccessControlPolicy(pd_acl)
    owner = Owner(LightXML.find_element(pd_acl, "Owner"))
    accessControlList = AWS.@parse_vector(AWS.S3.Grant, LightXML.get_elements_by_tagname(LightXML.find_element(pd_acl, "AccessControlList"), "Grant"))
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
    locationConstraint::Union{AbstractString, Void}
end
CreateBucketConfiguration(pd_cbc) = CreateBucketConfiguration(LightXML.content(LightXML.find_element(pd_cbc, "LocationConstraint")))
xml(o::CreateBucketConfiguration) = xml_hdr("CreateBucketConfiguration") *
                                    xml("LocationConstraint", o.locationConstraint) *
                                    xml_ftr("CreateBucketConfiguration")
export CreateBucketConfiguration



type Contents
    key::Union{AbstractString, Void}
    lastModified::DateTime
    eTag::Union{AbstractString, Void}
    size::Union{Int64, Void}
    owner::Union{Owner, Void}
    storageClass::Union{AbstractString, Void}
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



type CommonPrefixes
    prefix::Union{AbstractString, Void}
end
CommonPrefixes(pd_cp) = CommonPrefixes(LightXML.content(LightXML.find_element(pd_cp, "Prefix")))
export CommonPrefixes


type ListBucketResult
    name::Union{AbstractString, Void}
    prefix::Union{AbstractString, Void}
    marker::Union{AbstractString, Void}
    nextMarker::Union{AbstractString, Void}
    maxKeys::Union{Int, Void}
    delimiter::Union{AbstractString, Void}
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
    lbr.delimiter = LightXML.find_element(pd_lbr, "Delimiter") != nothing ?LightXML.content(LightXML.find_element(pd_lbr, "Delimiter")) : ""
    lbr.isTruncated = AWS.safe_parsebool(LightXML.content(LightXML.find_element(pd_lbr, "IsTruncated")))
    lbr.contents = AWS.@parse_vector(AWS.S3.Contents, LightXML.get_elements_by_tagname(pd_lbr, "Contents"))
    lbr.commonPrefixes = AWS.@parse_vector(AWS.S3.CommonPrefixes, LightXML.get_elements_by_tagname(pd_lbr, "CommonPrefixes"))
    lbr
end
export ListBucketResult

type Version
    key::Union{AbstractString, Void}
    versionId::Union{AbstractString, Void}
    isLatest::Union{Bool, Void}
    lastModified::DateTime
    eTag::Union{AbstractString, Void}
    size::Union{Int64, Void}
    owner::Union{Owner, Void}
    storageClass::Union{AbstractString, Void}
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



type DeleteMarker
    key::Union{AbstractString, Void}
    versionId::Union{AbstractString, Void}
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




type ListVersionsResult
    name::Union{AbstractString, Void}
    prefix::Union{AbstractString, Void}
    keyMarker::Union{AbstractString, Void}
    versionIdMarker::Union{AbstractString, Void}
    nextKeyMarker::Union{AbstractString, Void}
    nextVersionIdMarker::Union{AbstractString, Void}
    maxKeys::Union{Int, Void}
    delimiter::Union{AbstractString, Void}
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
    lvr.version = AWS.@parse_vector(AWS.S3.Version, LightXML.get_elements_by_tagname(pd_lvr, "Version"))
    lvr.deleteMarker = AWS.@parse_vector(AWS.S3.DeleteMarker, LightXML.get_elements_by_tagname(pd_lvr, "DeleteMarker"))
    lvr.commonPrefixes = AWS.@parse_vector(AWS.S3.CommonPrefixes, LightXML.get_elements_by_tagname(pd_lvr, "CommonPrefixes"))
    lvr
end
export ListVersionsResult



type Bucket
    name::Union{AbstractString, Void}
    creationDate::DateTime
end
function Bucket(pd_b)
    datestr = LightXML.content(LightXML.find_element(pd_b, "CreationDate"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")

    Bucket(LightXML.content(LightXML.find_element(pd_b, "Name")), t)
end
export Bucket




type ListAllMyBucketsResult
    owner::Union{Owner, Void}
    buckets::Vector{Bucket}
end
function ListAllMyBucketsResult(pd_lab)
    owner = Owner(LightXML.find_element(pd_lab, "Owner"))
    buckets = AWS.@parse_vector(AWS.S3.AWS.S3.Bucket, LightXML.get_elements_by_tagname(LightXML.find_element(pd_lab, "Buckets"), "Bucket"))
    ListAllMyBucketsResult(owner, buckets)
end
export ListAllMyBucketsResult


type CopyObjectResult
    lastModified::DateTime
    eTag::Union{AbstractString, Void}
end
function CopyObjectResult(pd_cor)
    datestr = LightXML.content(LightXML.find_element(pd_cor, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S.s")

    CopyObjectResult(t, LightXML.content(LightXML.find_element(pd_cor, "ETag")))
end
export CopyObjectResult



type RequestPaymentConfiguration
    payer::Union{AbstractString, Void}
end
xml(o::RequestPaymentConfiguration) = xml_hdr("RequestPaymentConfiguration") * xml("Payer", o.payer) * xml_ftr("RequestPaymentConfiguration")
RequestPaymentConfiguration(pd_rpc) = RequestPaymentConfiguration(LightXML.content(LightXML.find_element(pd_rpc, "Payer")))
export RequestPaymentConfiguration

type VersioningConfiguration
    status::Union{AbstractString, Void}
    mfaDelete::Union{AbstractString, Void}
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

type TopicConfiguration
    topic::Union{AbstractString, Void}
    event::Vector{AbstractString}
end
function TopicConfiguration(pd_tc)
    topic = LightXML.content(LightXML.find_element(pd_tc, "Topic"))
    event = AbstractString[]
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



type NotificationConfiguration
    topicConfiguration::Union{Vector{TopicConfiguration}, Void}
end
NotificationConfiguration(pd) = NotificationConfiguration(AWS.@parse_vector(AWS.S3.TopicConfiguration, LightXML.get_elements_by_tagname(pd, "TopicConfiguration")))

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
    bucket::Union{AbstractString, Void}
    key::Union{AbstractString, Void}
    uploadId::Union{AbstractString, Void}
end
function InitiateMultipartUploadResult(pd)
    InitiateMultipartUploadResult(LightXML.content(LightXML.find_element(pd, "Bucket")), LightXML.content(LightXML.find_element(pd, "Key")), LightXML.content(LightXML.find_element(pd, "UploadId")))
end
export InitiateMultipartUploadResult



type CopyPartResult
   lastModified::DateTime
   eTag::Union{AbstractString, Void}
end
function CopyPartResult(pd)
    datestr = LightXML.content(LightXML.find_element(pd, "LastModified"))
    t = DateTime(datestr[1:end-1], "y-m-dTH:M:S")
    CopyPartResult(t, LightXML.content(LightXML.find_element(pd, "ETag")))
end
export CopyPartResult

type Part
    partNumber::Union{AbstractString, Void}
    lastModified::Union{DateTime, Void}
    eTag::Union{AbstractString, Void}
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

type CompleteMultipartUpload
    parts::Vector{Part}
end
xml(o::CompleteMultipartUpload) = xml("CompleteMultipartUpload", o.parts)
export CompleteMultipartUpload


type CompleteMultipartUploadResult
    location::Union{AbstractString, Void}
    bucket::Union{AbstractString, Void}
    key::Union{AbstractString, Void}
    eTag::Union{AbstractString, Void}
end
CompleteMultipartUploadResult(pd) =
    CompleteMultipartUploadResult(
        LightXML.content(LightXML.find_element(pd, "Location")),
        LightXML.content(LightXML.find_element(pd, "Bucket")),
        LightXML.content(LightXML.find_element(pd, "Key")),
        LightXML.content(LightXML.find_element(pd, "ETag")),
    )
export CompleteMultipartUploadResult


type ListPartsResult
    bucket::Union{AbstractString, Void}
    key::Union{AbstractString, Void}
    uploadId::Union{AbstractString, Void}
    initiator::Initiator
    owner::Union{Owner, Void}
    storageClass::Union{AbstractString, Void}
    partNumberMarker::Union{AbstractString, Void}
    nextPartNumberMarker::Union{AbstractString, Void}
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
        AWS.@parse_vector(AWS.S3.Part, LightXML.get_elements_by_tagname(pd, "Part"))
    )
end
export ListPartsResult

type Upload
    key::Union{AbstractString, Void}
    uploadId::Union{AbstractString, Void}
    initiator::Union{Initiator, Void}
    owner::Union{Owner, Void}
    storageClass::Union{AbstractString, Void}
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

type ListMultipartUploadsResult
    bucket::Union{AbstractString, Void}
    prefix::Union{AbstractString, Void}
    keyMarker::Union{AbstractString, Void}
    uploadIdMarker::Union{AbstractString, Void}
    nextKeyMarker::Union{AbstractString, Void}
    nextUploadIdMarker::Union{AbstractString, Void}
    maxUploads::Union{Int, Void}
    delimiter::Union{AbstractString, Void}
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
        AWS.@parse_vector(AWS.S3.Upload, LightXML.get_elements_by_tagname(pd, "Upload")),
        AWS.@parse_vector(AWS.S3.CommonPrefixes, LightXML.get_elements_by_tagname(pd, "CommonPrefixes"))
    )
end
export ListMultipartUploadsResult

type CORSRule
    id::Union{AbstractString, Void}
    allowedMethod::Union{Vector{AbstractString}, Void}
    allowedOrigin::Union{Vector{AbstractString}, Void}
    allowedHeader::Union{Vector{AbstractString}, Void}
    maxAgeSeconds::Union{AbstractString, Int}
    exposeHeader::Union{Vector{AbstractString}, Void}
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
    allowedMethod = parse_vector_as(AbstractString, "AllowedMethod", LightXML.get_elements_by_tagname(pd, "AllowedMethod"))
    allowedOrigin = parse_vector_as(AbstractString, "AllowedOrigin", LightXML.get_elements_by_tagname(pd, "AllowedOrigin"))
    allowedHeader = parse_vector_as(AbstractString, "AllowedHeader", LightXML.get_elements_by_tagname(pd, "AllowedHeader"))
    seconds = LightXML.content(LightXML.find_element(pd, "MaxAgeSeconds"))
    if (seconds != nothing) maxAgeSeconds = int(seconds) end
    exposeHeader = parse_vector_as(AbstractString, "ExposeHeader", LightXML.get_elements_by_tagname(pd, "ExposeHeader"))

    CORSRule(id, allowedMethod, allowedOrigin, allowedHeader, maxAgeSeconds, exposeHeader)

end
export CORSRule


type CORSConfiguration
    corsrules::Vector{CORSRule}
end
xml(o::CORSConfiguration) = xml("CORSConfiguration", o.corsrules)
CORSConfiguration(pd) = AWS.@parse_vector(AWS.S3.CORSRule, LightXML.get_elements_by_tagname(pd, "CORSRule"))


type S3Error
    code::Union{AbstractString, Void}
    message::Union{AbstractString, Void}
    hostId::Union{AbstractString, Void}
    requestId::Union{AbstractString, Void}
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


type S3PartTag
    part_number::AbstractString
    etag::AbstractString
end
xml(o::S3PartTag) = xml("Part", [("PartNumber", o.part_number), ("ETag", o.etag)])

type CopyMatchOptions
    if_match::Union{AbstractString, Void}
    if_none_match::Union{AbstractString, Void}
    if_unmodified_since::Union{AbstractString, Void}
    if_modified_since::Union{AbstractString, Void}
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
    email_address::Union{AbstractString, Void}
    id::Union{AbstractString, Void}
    uri::Union{AbstractString, Void}
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
    acl::Union{AbstractString, Void}
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

function add_acl_grantee(hdrs, xamz_name::AbstractString, arr::Vector{S3_ACL_Grantee})
    for a in arr
        @add_amz_hdr(xamz_name, hdr_str(a))
    end
    hdrs
end
export S3_ACL


type CopyObjectOptions
# All are x-amz options
    copy_source::AbstractString
    metadata_directive::Union{AbstractString, Void}
    match_options::Union{CopyMatchOptions, Void}

# x-amz only header fields
    server_side_encryption::Union{AbstractString, Void}
    storage_class::Union{AbstractString, Void}
    website_redirect_location::Union{AbstractString, Void}
    acl::Union{S3_ACL, Void}

    CopyObjectOptions(copy_source; metadata_directive=nothing, match_options=nothing,
        server_side_encryption=nothing, storage_class=nothing, website_redirect_location=nothing, acl=nothing) = begin
            new(copy_source, metadata_directive,  match_options, server_side_encryption, storage_class, website_redirect_location, acl)
    end

end
function amz_headers(hdrs, o::CopyObjectOptions)
    @add_amz_hdr("copy-source", o.copy_source)
    @add_amz_hdr("metadata-directive", o.metadata_directive)

    if (o.match_options != nothing)
        hdrs = amz_headers(hdrs, o.match_options)
    end

    @add_amz_hdr("server-side-encryption", o.server_side_encryption)
    @add_amz_hdr("storage-class", o.storage_class)
    @add_amz_hdr("website-redirect-location", o.website_redirect_location)

    if o.acl != nothing
        hdrs = amz_headers(hdrs, o.acl)
    end
    hdrs
end
export CopyObjectOptions


type CopyUploadPartOptions
    copy_source::AbstractString
    source_range::Union{AbstractString, Void}
    match_options::Union{CopyMatchOptions, Void}

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
    cache_control::Union{AbstractString, Void}
    content_disposition::Union{AbstractString, Void}
    content_encoding::Union{AbstractString, Void}
    cont_typ::Union{AbstractString, Void}
#Expect  not supported...
    expires::Union{DateTime, Void}

# x-amz header fields
    meta::Union{Dict{AbstractString, AbstractString}, Void}
    server_side_encryption::Union{AbstractString, Void}
    storage_class::Union{AbstractString, Void}
    website_redirect_location::Union{AbstractString, Void}
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
            @add_amz_hdr("meta-" * t[1], t[2])
        end
    end

    @add_amz_hdr("server-side-encryption", o.server_side_encryption)
    @add_amz_hdr("storage-class", o.storage_class)
    @add_amz_hdr("website-redirect-location", o.website_redirect_location)

    if o.acl != nothing
        hdrs = amz_headers(hdrs, o.acl)
    end
    hdrs
end

function http_headers(arr, o::PutObjectOptions)
    @chk_n_add("Cache-Control", o.cache_control)
    @chk_n_add("Content-Disposition", o.content_disposition)
    @chk_n_add("Content-Encoding", o.content_encoding)
    @chk_n_add("Expires", rfc1123_date(o.expires))
    arr
end
export PutObjectOptions



type GetObjectOptions
    # These go into the query string
    response_cont_typ::Union{AbstractString, Void}
    response_content_language::Union{AbstractString, Void}
    response_expires::Union{AbstractString, Void}
    response_cache_control::Union{AbstractString, Void}
    response_content_disposition::Union{AbstractString, Void}
    response_content_encoding::Union{AbstractString, Void}

    # These go into the header
    range::Union{AbstractString, Void}
    if_modified_since::Union{DateTime, Void}
    if_unmodified_since::Union{DateTime, Void}
    if_match::Union{AbstractString, Void}
    if_none_match::Union{AbstractString, Void}

    GetObjectOptions(;response_cont_typ=nothing, response_content_language=nothing, response_expires=nothing, response_cache_control=nothing, response_content_disposition=nothing,
        response_content_encoding=nothing, range=nothing, if_modified_since=nothing, if_unmodified_since=nothing, if_match=nothing, if_none_match=nothing) = begin
            new(response_cont_typ, response_content_language, response_expires, response_cache_control, response_content_disposition,response_content_encoding, range, if_modified_since, if_unmodified_since, if_match, if_none_match)
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
    key::AbstractString
    versionId::Union{AbstractString, Void}
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
    xml("Delete", [("Quiet", o.quiet); o.objects])
end
export DeleteObjectsType


type Tag
    key::AbstractString
    value::AbstractString
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
    delimiter::Union{AbstractString, Void}
    key_marker::Union{AbstractString, Void}
    max_uploads::Union{Int, Void}
    prefix::Union{AbstractString, Void}
    upload_id_marker::Union{AbstractString, Void}

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
    delimiter::Union{AbstractString, Void}
    key_marker::Union{AbstractString, Void}
    max_keys::Union{Int, Void}
    prefix::Union{AbstractString, Void}
    version_id_marker::Union{AbstractString, Void}
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
    delimiter::Union{AbstractString, Void}
    marker::Union{AbstractString, Void}
    max_keys::Union{Int, Void}
    prefix::Union{AbstractString, Void}
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
    key::Union{AbstractString, Void}
    version_id::Union{AbstractString, Void}
    marker::Union{Bool, Void}
    marker_version_id::Union{AbstractString, Void}
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



type DeleteError
    key::Union{AbstractString, Void}
    version_id::Union{AbstractString, Void}
    code::Union{AbstractString, Void}
    message::Union{AbstractString, Void}
end
DeleteError() = DeleteError(nothing,nothing,nothing,nothing)
function DeleteError(pd)
    de = DeleteError()
    de.key = LightXML.content(LightXML.find_element(pd, "Key"))
    de.version_id = LightXML.find_element(pd, "VersionId") != nothing ? LightXML.content(LightXML.find_element(pd, "VersionId")) : nothing
    de.code = LightXML.find_element(pd, "Code") != nothing ? LightXML.content(LightXML.find_element(pd, "Code")) : nothing
    de.message = LightXML.find_element(pd, "Message") != noting ?LightXML.content(LightXML.find_element(pd, "Message")) : nothing
    de
end
export DeleteError


type DeleteResult
    deleted::Union{Vector{Deleted}, Void}
    delete_errors::Union{Vector{DeleteError}, Void}
end
DeleteResult() = DeleteResult(nothing, nothing)
function DeleteResult(pd)
    dr = DeleteResult()
    dr.deleted = LightXML.get_elements_by_tagname(pd, "Deleted") != nothing ? AWS.@parse_vector(AWS.S3.Deleted, LightXML.get_elements_by_tagname(pd, "Deleted")) : nothing
    dr.delete_errors = LightXML.find_element(pd, "Errors") != nothing ? AWS.@parse_vector(AWS.S3.DeleteError, LightXML.find_element(pd, "Errors")) : nothing
    dr
end
export DeleteResult
