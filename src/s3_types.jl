
type MetadataEntry
    Name::String
    Value::String
end

const XMLNS_ATTR = "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
xml_hdr(name) = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><$(name) xmlns=\"http://doc.s3.amazonaws.com/2006-03-01\">"
xml_ftr(name) = "</$(name)>"

xml(o::Any) = string(o)
xml(tag::String, value::Any) = "<$(child_tag)>" * xml(value) * "</$(child_tag)>"

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



function parse_grants(grants::Vector{ParsedData})
    jl_grants::Vector{Grants} = []
    for grant_pd in grants
        grantee_pd = find(grant_pd, "Grantee[1]")
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
        
        permission = find(grant_pd, "Permission#text")
    
        push!(jl_grants, Grant(grantee, permission))
    end
    
    return jl_grants
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
        bls.targetGrants = parse_grants(grants)
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
Owner(pd_owner::ParsedData)=Owner(find(pd_owner, "ID#text"), find(pd_owner, "DisplayName#text")) 


type AccessControlPolicy
    owner::CanonicalUser
    accessControlList::Vector{Grant}
end

function AccessControlPolicy(pd_acl::ParsedData)
    owner = Owner(find(pd_acl, "Owner[1]"))
    accessControlList = parse_grants(find(pd_bls, "AccessControlList/Grant"))
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
    metadata::Vector{MetadataEntry}
    name::String
    prefix::String
    marker::String
    nextMarker::String
    maxKeys::Int
    delimiter::String
    isTruncated::Bool
    contents::Vector{ListEntry}
    commonPrefixes::Vector{PrefixEntry}
    
    ListBucketResult() = new([], "", "", "", "", 0, "", false, [], [])
end

function ListBucketResult(pd_lbr::ParsedData)
    lbr = ListBucketResult()

end















  <xsd:element name="ListBucketResponse">
    <xsd:complexType>
      <xsd:sequence>
    ListBucketResponse" type="tns:ListBucketResult"/>
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="ListVersionsResponse">
    <xsd:complexType>
      <xsd:sequence>
    ListVersionsResponse" type="tns:ListVersionsResult"/>
      </xsd:sequence>
  end
  </xsd:element>  

type ListEntry">
    <xsd:sequence>
    Key::String
    LastModified" type="xsd:dateTime"/>
    ETag::String
    Size" type="xsd:long"/>
    Owner" type="tns:CanonicalUser" minOccurs="0"/>
    StorageClass" type="tns:StorageClass"/>
    </xsd:sequence>
end

type VersionEntry">
    <xsd:sequence>
    Key::String
    VersionId::String
    IsLatest" type="xsd:boolean"/>
    LastModified" type="xsd:dateTime"/>
    ETag::String
    Size" type="xsd:long"/>
    Owner" type="tns:CanonicalUser" minOccurs="0"/>
    StorageClass" type="tns:StorageClass"/>
    </xsd:sequence>
end

type DeleteMarkerEntry">
    <xsd:sequence>
    Key::String
    VersionId::String
    IsLatest" type="xsd:boolean"/>
    LastModified" type="xsd:dateTime"/>
    Owner" type="tns:CanonicalUser" minOccurs="0"/>
    </xsd:sequence>
end

type PrefixEntry">
    <xsd:sequence>
    Prefix::String
    </xsd:sequence>
end


type ListVersionsResult">
    <xsd:sequence>
    Metadata" type="tns:MetadataEntry" minOccurs="0" maxOccurs="unbounded"/>
    Name::String
    Prefix::String
    KeyMarker::String
    VersionIdMarker::String
    NextKeyMarker::String
    NextVersionIdMarker::String
    MaxKeys" type="xsd:int"/>
    Delimiter::String
    IsTruncated" type="xsd:boolean"/>
      <xsd:choice minOccurs="0" maxOccurs="unbounded">
      Version" type="tns:VersionEntry"/>
      DeleteMarker" type="tns:DeleteMarkerEntry"/>
      </xsd:choice>
    CommonPrefixes" type="tns:PrefixEntry" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
end  

  <xsd:element name="ListAllMyBuckets">
    <xsd:complexType>
      <xsd:sequence>
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="ListAllMyBucketsResponse">
    <xsd:complexType>
      <xsd:sequence>
    ListAllMyBucketsResponse" type="tns:ListAllMyBucketsResult"/>
      </xsd:sequence>
  end
  </xsd:element>

type ListAllMyBucketsEntry">
    <xsd:sequence>
    Name::String
    CreationDate" type="xsd:dateTime"/>
    </xsd:sequence>
end

type ListAllMyBucketsResult">
    <xsd:sequence>
    Owner" type="tns:CanonicalUser"/>
    Buckets" type="tns:ListAllMyBucketsList"/>
    </xsd:sequence>
end

type ListAllMyBucketsList">
    <xsd:sequence>
    Bucket" type="tns:ListAllMyBucketsEntry" minOccurs="0" maxOccurs="unbounded"/>
    </xsd:sequence>
end

  <xsd:element name="PostResponse">
    <xsd:complexType>
      <xsd:sequence>
    Location" type="xsd:anyURI"/>
    Bucket::String
    Key::String
    ETag::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:simpleType name="MetadataDirective">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="COPY"/>
      <xsd:enumeration value="REPLACE"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:element name="CopyObject">
    <xsd:complexType>
      <xsd:sequence>
    SourceBucket::String
    SourceKey::String
    DestinationBucket::String
    DestinationKey::String
    MetadataDirective" type="tns:MetadataDirective" minOccurs="0"/>
    Metadata" type="tns:MetadataEntry" minOccurs="0" maxOccurs="100"/>
    AccessControlList::AccessControlList
    <xsd:element name="CopySourceIfModifiedSince" type="xsd:dateTime" minOccurs="0"/>
    CopySourceIfUnmodifiedSince" type="xsd:dateTime" minOccurs="0"/>
    CopySourceIfMatch" type="xsd:string" minOccurs="0" maxOccurs="100"/>
    CopySourceIfNoneMatch" type="xsd:string" minOccurs="0" maxOccurs="100"/>
    StorageClass" type="tns:StorageClass" minOccurs="0"/>
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="CopyObjectResponse">
    <xsd:complexType>
      <xsd:sequence>
    CopyObjectResult" type="tns:CopyObjectResult" />
      </xsd:sequence>
  end
  </xsd:element>

type CopyObjectResult">
    <xsd:sequence>
    LastModified" type="xsd:dateTime"/>
    ETag::String      
    </xsd:sequence>
end

type RequestPaymentConfiguration">
    <xsd:sequence>
    Payer" type="tns:Payer" minOccurs="1" maxOccurs="1"/>
    </xsd:sequence>
end

  <xsd:simpleType name="Payer">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="BucketOwner"/>
      <xsd:enumeration value="Requester"/>
    </xsd:restriction>
  </xsd:simpleType>
  
type VersioningConfiguration">
    <xsd:sequence>
    Status" type="tns:VersioningStatus" minOccurs="0"/>
    MfaDelete" type="tns:MfaDeleteStatus" minOccurs="0"/>
    </xsd:sequence>
end

  <xsd:simpleType name="MfaDeleteStatus">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Enabled"/>
      <xsd:enumeration value="Disabled"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="VersioningStatus">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Enabled"/>
      <xsd:enumeration value="Suspended"/>
    </xsd:restriction>
  </xsd:simpleType>

type NotificationConfiguration">
    <xsd:sequence>
    TopicConfiguration" minOccurs="0" maxOccurs="unbounded" type="tns:TopicConfiguration"/>
    </xsd:sequence>
end

type TopicConfiguration">
    <xsd:sequence>
    Topic" minOccurs="1" maxOccurs="1::String
    Event" minOccurs="1" maxOccurs="unbounded::String
    </xsd:sequence>
end

</xsd:schema>