
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




type BucketLoggingStatus
    loggingEnabled::Bool
    targetBucket::String
    targetPrefix::String
    targetGrants::Vector{Grant}
    
end

BucketLoggingStatus() = BucketLoggingStatus(false, "", "", [])
function BucketLoggingStatus(pd::ParsedData)
    bls = BucketLoggingStatus()
    if haskey(pd.elements, "LoggingEnabled")
        bls.targetBucket = find(pd, "LoggingEnabled/TargetBucket#text")
        bls.targetPrefix = find(pd, "LoggingEnabled/TargetPrefix#text")
        
        grants = find(pd, "LoggingEnabled/TargetGrants/Grant")
        for grant_pd in grants
            grantee_pd = find(grant_pd, "Grantee")
            grantee_type = grantee_pd.attr["xsi:type"]
            if grantee_type == "AmazonCustomerByEmail"
                grantee=find(grantee_pd, "EmailAddress#text")
            elseif grantee_type == "CanonicalUser"
                grantee=GranteeID(find(grantee_pd, "ID#text"), find(grantee_pd, "DisplayName#text")) 
            elseif grantee_type == "Group"
                grantee=find(grantee_pd, "URI#text")
            else
                error("Unknown grantee type")
            end
            
            permission = find(grant_pd, "Permission#text")
        
            push!(bls.targetGrants, LoggingGrantee(grantee, permission))
        end
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


type AccessControlPolicy
    owner::CanonicalUser
    accessControlList::Vector{Grant}
end



  

  <xsd:element name="GetObjectAccessControlPolicy">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Key::String
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="GetObjectAccessControlPolicyResponse">
    <xsd:complexType>
      <xsd:sequence>
    GetObjectAccessControlPolicyResponse" type="tns:AccessControlPolicy"/>
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="GetBucketAccessControlPolicy">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="GetBucketAccessControlPolicyResponse">
    <xsd:complexType>
      <xsd:sequence>
    GetBucketAccessControlPolicyResponse" type="tns:AccessControlPolicy"/>
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:complexType abstract="true" name="Grantee"/>

type User" abstract="true">
    <xsd:complexContent>
      <xsd:extension base="tns:Grantee"/>
    </xsd:complexContent>
end

type AmazonCustomerByEmail">
    <xsd:complexContent>
      <xsd:extension base="tns:User">
        <xsd:sequence>
      EmailAddress::String              
        </xsd:sequence>
      </xsd:extension>
    </xsd:complexContent>
end

type CanonicalUser">
    <xsd:complexContent>
      <xsd:extension base="tns:User">
        <xsd:sequence>
      ID::String              
      DisplayName::String
        </xsd:sequence>
      </xsd:extension>
    </xsd:complexContent>
end

type Group">
    <xsd:complexContent>
      <xsd:extension base="tns:Grantee">
        <xsd:sequence>
      URI::String
        </xsd:sequence>
      </xsd:extension>
    </xsd:complexContent>
end

  <xsd:simpleType name="Permission">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="READ"/>
      <xsd:enumeration value="WRITE"/>
      <xsd:enumeration value="READ_ACP"/>
      <xsd:enumeration value="WRITE_ACP"/>
      <xsd:enumeration value="FULL_CONTROL"/>
    </xsd:restriction>
  </xsd:simpleType>

  <xsd:simpleType name="StorageClass">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="STANDARD"/>
      <xsd:enumeration value="REDUCED_REDUNDANCY"/>
      <xsd:enumeration value="GLACIER"/>
      <xsd:enumeration value="UNKNOWN"/>
    </xsd:restriction>
  </xsd:simpleType>


type CreateBucketConfiguration">
    <xsd:sequence>
    LocationConstraint" type="tns:LocationConstraint"/>
    </xsd:sequence>
end

type LocationConstraint">
    <xsd:simpleContent>
      <xsd:extension base="xsd:string"/>
    </xsd:simpleContent>
end


  <xsd:element name="SetObjectAccessControlPolicy">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Key::String
    AccessControlList" type="tns:AccessControlList"/>
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="SetObjectAccessControlPolicyResponse">
    <xsd:complexType>
      <xsd:sequence/>
  end
  </xsd:element>

  <xsd:element name="SetBucketAccessControlPolicy">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    AccessControlList::AccessControlList
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="SetBucketAccessControlPolicyResponse">
    <xsd:complexType>
      <xsd:sequence/>
  end
  </xsd:element>

  <xsd:element name="GetObject">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Key::String
    GetMetadata" type="xsd:boolean"/>
    GetData" type="xsd:boolean"/>
    InlineData" type="xsd:boolean"/>
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
        
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="GetObjectResponse">
    <xsd:complexType>
      <xsd:sequence>
    GetObjectResponse" type="tns:GetObjectResult"/>
      </xsd:sequence>
  end
  </xsd:element>

type GetObjectResult">
    <xsd:complexContent>
      <xsd:extension base="tns:Result">
        <xsd:sequence>
      Metadata" type="tns:MetadataEntry" minOccurs="0" maxOccurs="unbounded"/>
      Data" type="xsd:base64Binary" nillable="true"/>
      LastModified" type="xsd:dateTime"/>
      ETag::String
        </xsd:sequence>
      </xsd:extension>
    </xsd:complexContent>
end

  <xsd:element name="GetObjectExtended">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Key::String
    GetMetadata" type="xsd:boolean"/>
    GetData" type="xsd:boolean"/>
    InlineData" type="xsd:boolean"/>
    ByteRangeStart" type="xsd:long" minOccurs="0"/>
    ByteRangeEnd" type="xsd:long" minOccurs="0"/>
    IfModifiedSince" type="xsd:dateTime" minOccurs="0"/>
    IfUnmodifiedSince" type="xsd:dateTime" minOccurs="0"/>
    IfMatch" type="xsd:string" minOccurs="0" maxOccurs="100"/>
    IfNoneMatch" type="xsd:string" minOccurs="0" maxOccurs="100"/>
    ReturnCompleteObjectOnConditionFailure" type="xsd:boolean" minOccurs="0"/>
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="GetObjectExtendedResponse">
    <xsd:complexType>
      <xsd:sequence>
    GetObjectResponse" type="tns:GetObjectResult"/>
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="PutObject">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Key::String
    Metadata" type="tns:MetadataEntry" minOccurs="0" maxOccurs="100"/>
    ContentLength" type="xsd:long"/>
    AccessControlList::AccessControlList
    StorageClass" type="tns:StorageClass" minOccurs="0"/>
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="PutObjectResponse">
    <xsd:complexType>
      <xsd:sequence>
    PutObjectResponse" type="tns:PutObjectResult"/>
      </xsd:sequence>
  end
  </xsd:element>

type PutObjectResult">
    <xsd:sequence>
    ETag::String
    LastModified" type="xsd:dateTime"/>
    </xsd:sequence>
end

  <xsd:element name="PutObjectInline">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Key::String
        <xsd:element minOccurs="0" maxOccurs="100" name="Metadata" type="tns:MetadataEntry"/>
    Data" type="xsd:base64Binary"/>
    ContentLength" type="xsd:long"/>
    AccessControlList::AccessControlList
    StorageClass" type="tns:StorageClass" minOccurs="0"/>
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="PutObjectInlineResponse">
    <xsd:complexType>
      <xsd:sequence>
    PutObjectInlineResponse" type="tns:PutObjectResult"/>
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="DeleteObject">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Key::String
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="DeleteObjectResponse">
    <xsd:complexType>
      <xsd:sequence>
    DeleteObjectResponse" type="tns:Status"/>
      </xsd:sequence>
  end
  </xsd:element>

  <xsd:element name="ListBucket">
    <xsd:complexType>
      <xsd:sequence>
    Bucket::String
    Prefix::String
    Marker::String
    MaxKeys" type="xsd:int" minOccurs="0"/>
    Delimiter::String
    AWSAccessKeyId::String
    Timestamp" type="xsd:dateTime" minOccurs="0"/>
    Signature::String
    Credential::String
      </xsd:sequence>
  end
  </xsd:element>

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

type ListBucketResult">
    <xsd:sequence>
    Metadata" type="tns:MetadataEntry" minOccurs="0" maxOccurs="unbounded"/>
    Name::String
    Prefix::String
    Marker::String
    NextMarker::String
    MaxKeys" type="xsd:int"/>
    Delimiter::String
    IsTruncated" type="xsd:boolean"/>
    Contents" type="tns:ListEntry" minOccurs="0" maxOccurs="unbounded"/>
    CommonPrefixes" type="tns:PrefixEntry" minOccurs="0" maxOccurs="unbounded"/>
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