
# Seems like Metadata is not returned via XML in case of the REST API.
# type MetadataEntry
#     name::String
#     value::String
# end


const XMLNS_ATTR = "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
xml_hdr(name) = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><$(name) xmlns=\"http://doc.s3.amazonaws.com/2006-03-01\">"
xml_ftr(name) = "</$(name)>"

xml(o::Any) = string(o)
xml(tag::String, value::Any) = "<$(tag)>" * xml(value) * "</$(tag)>"

function xml(tag::String, children::Vector{Any}; xmlns="", xsi_type="")
    if (xsi_type != "")
        open_tag = "<$tag $xmlns xsi:type=\"$(xsi_type)\">"
    else
        open_tag = "<$tag $xmlns>"
    end
    
    children_xml = ""
    for child in children
        if isa(Tuple, (child_tag, child_value))
            children_xml = children_xml * xml(child_tag, child_value)
        else
            children_xml = children_xml * xml(child)
        end
    end
    
    return open_tag * children_xml * "</$(tag)>"
end

macro parse_vector (typ, vect)
    quote
        jl_vect::Vector{$(typ)} = []
        for pd in $(vect)
            push!(jl_vect, $(typ)(pd))
        end
        
        jl_vect
    end
end


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
    grantee_type = pd_g.attr["xsi:type"]
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
    loggingEnabled::Bool
    targetBucket::String
    targetPrefix::String
    targetGrants::Vector{Grant}
    
end

BucketLoggingStatus() = BucketLoggingStatus(false, "", "", [])
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


type Owner
    id::String         
    displayName::String
end
xml(o::Owner) = xml("Owner", [("ID", o.id), ("DisplayName", o.displayName)])
function Owner(pd_owner::ParsedData)
    id = find(pd_owner, "ID#text")
    displayName = haskey(pd_owner.elements, "DisplayName") ? find(pd_owner, "DisplayName#text")) : ""
    Owner(id,displayName)  
end

type AccessControlPolicy
    owner::Owner
    accessControlList::Vector{Grant}
end

function AccessControlPolicy(pd_acl::ParsedData)
    owner = Owner(find(pd_acl, "Owner[1]"))
    accessControlList = @parse_vector(Grant, find(pd_bls, "AccessControlList/Grant"))
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
    locationConstraint::String
end
CreateBucketConfiguration(pd_cbc::ParsedData) = CreateBucketConfiguration(find(pd_cbc, "LocationConstraint#text"))
xml(o::CreateBucketConfiguration) = xml_hdr("CreateBucketConfiguration") * 
                                    xml("LocationConstraint", o.locationConstraint) * 
                                    xml_ftr("CreateBucketConfiguration")



type ListBucketResult
    name::String
    prefix::String
    marker::String
    nextMarker::String
    maxKeys::Int
    delimiter::String
    isTruncated::Bool
    contents::Vector{Contents}
    commonPrefixes::Vector{CommonPrefixes}
    
    ListBucketResult() = new([], "", "", "", "", 0, "", false, [], [])
end

function ListBucketResult(pd_lbr::ParsedData)
    lbr = ListBucketResult()
    if haskey(lbr.elements, "Name") lbr.name = find(pd_lbr, "Name#text") end
    if haskey(lbr.elements, "Prefix") lbr.prefix = find(pd_lbr, "Prefix#text") end
    if haskey(lbr.elements, "Marker") lbr.marker = find(pd_lbr, "Marker#text") end
    if haskey(lbr.elements, "NextMarker") lbr.nextMarker = find(pd_lbr, "NextMarker#text") end
    if haskey(lbr.elements, "MaxKeys") 
        maxstr = find(pd_lbr, "MaxKeys#text")
        if (length(maxstr) > 0) lbr.maxKeys = parseint(maxstr) end 
    end
    if haskey(lbr.elements, "Delimiter") lbr.delimiter = find(pd_lbr, "Delimiter#text") end
    if haskey(lbr.elements, "IsTruncated") lbr.isTruncated = (lowercase(find(pd_lbr, "Delimiter#text")) == "true") ? true : false  end
    if haskey(lbr.elements, "Contents") lbr.contents = @parse_vector(Contents, lbr.elements["Contents"]) end
    if haskey(lbr.elements, "CommonPrefixes") lbr.commonPrefixes = @parse_vector(CommonPrefixes, lbr.elements["CommonPrefixes"]) end
end


type Contents
    key::String
    lastModified::CalendarTime
    eTag::String
    size::Int64
    owner::Owner
    storageClass::String
end
function Contents(pd_le::ParsedData)
    key = find(pd_le, "Key#text")
    datestr = find(pd_le, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_le, "ETag#text")
    size = parseint(find(pd_le, "Size#text"))
    owner=Owner(find(pd_le, "Owner[1]"))
    storageClass = find(pd_le, "StorageClass#text")

    Contents(key, t, etag, size, owner, storageClass)
end


type CommonPrefixes
    prefix::String
end
CommonPrefixes(pd_cp::ParsedData) = CommonPrefixes(find(pd_cp, "Prefix#text"))


type ListVersionsResult
    name::String
    prefix::String
    keyMarker::String
    versionIdMarker::String
    nextKeyMarker::String
    nextVersionIdMarker::String
    maxKeys::Int
    delimiter::String
    isTruncated::Bool
    version::Vector{Version}
    deleteMarker::Vector{DeleteMarker}
    commonPrefixes::Vector{CommonPrefixes}
    
    ListVersionsResult() = new("", "", "", "", "", "", 0, "", false, [], [], [])
end  
function ListVersionsResult(pd_lvr::ParsedData)
    lvr = ListVersionsResult()
    if haskey(lvr.elements, "Name") lvr.name = find(pd_lvr, "Name#text") end
    if haskey(lvr.elements, "Prefix") lvr.prefix = find(pd_lvr, "Prefix#text") end
    if haskey(lvr.elements, "KeyMarker") lvr.keyMarker = find(pd_lvr, "KeyMarker#text") end
    if haskey(lvr.elements, "VersionIdMarker") lvr.versionIdMarker = find(pd_lvr, "VersionIdMarker#text") end
    if haskey(lvr.elements, "NextKeyMarker") lvr.nextKeyMarker = find(pd_lvr, "NextKeyMarker#text") end
    if haskey(lvr.elements, "NextVersionIdMarker") lvr.nextVersionIdMarker = find(pd_lvr, "NextVersionIdMarker#text") end
    if haskey(lvr.elements, "MaxKeys") 
        maxstr = find(pd_lvr, "MaxKeys#text")
        if (length(maxstr) > 0) lvr.maxKeys = parseint(maxstr) end 
    end
    if haskey(lvr.elements, "Delimiter") lvr.delimiter = find(pd_lvr, "Delimiter#text") end
    if haskey(lvr.elements, "IsTruncated") lvr.isTruncated = (lowercase(find(pd_lvr, "Delimiter#text")) == "true") ? true : false  end
    if haskey(lvr.elements, "Version") lvr.version = @parse_vector(Version, lvr.elements["Version"]) end
    if haskey(lvr.elements, "DeleteMarker") lvr.deleteMarker = @parse_vector(DeleteMarker, lvr.elements["DeleteMarker"]) end
    if haskey(lvr.elements, "CommonPrefixes") lvr.commonPrefixes = @parse_vector(CommonPrefixes, lvr.elements["CommonPrefixes"]) end
end



type Version
    key::String
    versionId::String
    isLatest::Bool
    lastModified::CalendarTime
    eTag::String
    size::Int64
    owner::Owner
    storageClass::String
end
function Version(pd_v::ParsedData)
    key = find(pd_v, "Key#text")
    versionId = find(pd_v, "VersionId#text")
    isLatest = (lowercase(find(pd_v, "IsLatest#text")) == "true") ? true : false 
    datestr = find(pd_v, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    etag = find(pd_v, "ETag#text")
    size = parseint(find(pd_v, "Size#text"))
    owner=Owner(find(pd_v, "Owner[1]"))
    storageClass = find(pd_v, "StorageClass#text")

    Version(key, versionId, isLatest, t, etag, size, owner, storageClass)
end




type DeleteMarker
    key::String
    versionId::String
    isLatest::Bool
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



type ListAllMyBucketsResult
    owner::Owner
    buckets::Vector{Bucket}
end
function ListAllMyBucketsResult(pd_lab::ParsedData)
    owner = Owner(find(pd_lab, "Owner[1]"))
    buckets = []
    try
        buckets = @parse_vector(Bucket, find(pd_lab, "Owner/Buckets/Bucket"))
    catch
        buckets = []
    end
    
    ListAllMyBucketsResult(owner, buckets)
end

type Bucket
    name::String
    creationDate::CalendarTime
end
function Bucket(pd_b::ParsedData)
    datestr = find(pd_b, "CreationDate#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    Bucket(find(pd_b, "Name#text"), t)
end




type CopyObjectResult
    lastModified::CalendarTime
    eTag::String      
end
function CopyObjectResult(pd_cor::ParsedData)
    datestr = find(pd_cor, "LastModified#text")
    t = Calendar.parse("yyyy-MM-DD'T'HH:mm:ss.SSS", datestr[1:end-1], "GMT")
    
    CopyObjectResult(t, find(pd_cor, "ETag#text"))
end




type RequestPaymentConfiguration
    payer::String
end
xml(o::RequestPaymentConfiguration) = xml_hdr("RequestPaymentConfiguration") * xml("Payer", o.payer) * xml_ftr("RequestPaymentConfiguration")
RequestPaymentConfiguration(pd_rpc::ParsedData) = RequestPaymentConfiguration(find(pd_rpc, "Payer#text"))

  
type VersioningConfiguration
    status::String
    mfaDelete::String
end
function xml(o::VersioningConfiguration)    
    xml_hdr("VersioningConfiguration") * 
    ((o.status != "") ? xml("Status", o.status) : "") * 
    ((o.mfaDelete 1= "") ? xml("MfaDelete", o.mfaDelete) : "")  * 
    xml_ftr("VersioningConfiguration")
end
function VersioningConfiguration(pd_vc::VersioningConfiguration) 
    status = (haskey(pd_vc.elements, "Status") ? find(pd_vc, "Status#text") : "")
    mfaDelete = (haskey(pd_vc.elements, "MfaDelete") ? find(pd_vc, "MfaDelete#text") : "")
    
    VersioningConfiguration(status, mfaDelete)
end


type NotificationConfiguration
    topicConfiguration::Union(Vector{TopicConfiguration}, Nothing)
end
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

type TopicConfiguration
    topic::String
    event::Vector{String}
end
function TopicConfiguration(pd_tc::ParsedData)
    topic = find(pd_tc, "Topic#text")
    event = [] 
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

