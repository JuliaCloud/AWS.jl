# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: worklink

using AWS.Compat
using AWS.UUIDs
"""
    AssociateDomain()

Specifies a domain to be associated to Amazon WorkLink.

# Required Parameters
- `AcmCertificateArn`: The ARN of an issued ACM certificate that is valid for the domain being associated.
- `DomainName`: The fully qualified domain name (FQDN).
- `FleetArn`: The Amazon Resource Name (ARN) of the fleet.

# Optional Parameters
- `DisplayName`: The name to display.
"""

associate_domain(AcmCertificateArn, DomainName, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/associateDomain", Dict{String, Any}("AcmCertificateArn"=>AcmCertificateArn, "DomainName"=>DomainName, "FleetArn"=>FleetArn); aws_config=aws_config)
associate_domain(AcmCertificateArn, DomainName, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/associateDomain", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AcmCertificateArn"=>AcmCertificateArn, "DomainName"=>DomainName, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    AssociateWebsiteAuthorizationProvider()

Associates a website authorization provider with a specified fleet. This is used to authorize users against associated websites in the company network.

# Required Parameters
- `AuthorizationProviderType`: The authorization provider type.
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `DomainName`: The domain name of the authorization provider. This applies only to SAML-based authorization providers.
"""

associate_website_authorization_provider(AuthorizationProviderType, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/associateWebsiteAuthorizationProvider", Dict{String, Any}("AuthorizationProviderType"=>AuthorizationProviderType, "FleetArn"=>FleetArn); aws_config=aws_config)
associate_website_authorization_provider(AuthorizationProviderType, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/associateWebsiteAuthorizationProvider", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AuthorizationProviderType"=>AuthorizationProviderType, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    AssociateWebsiteCertificateAuthority()

Imports the root certificate of a certificate authority (CA) used to obtain TLS certificates used by associated websites within the company network.

# Required Parameters
- `Certificate`: The root certificate of the CA.
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `DisplayName`: The certificate name to display.
"""

associate_website_certificate_authority(Certificate, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/associateWebsiteCertificateAuthority", Dict{String, Any}("Certificate"=>Certificate, "FleetArn"=>FleetArn); aws_config=aws_config)
associate_website_certificate_authority(Certificate, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/associateWebsiteCertificateAuthority", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Certificate"=>Certificate, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    CreateFleet()

Creates a fleet. A fleet consists of resources and the configuration that delivers associated websites to authorized users who download and set up the Amazon WorkLink app.

# Required Parameters
- `FleetName`: A unique name for the fleet.

# Optional Parameters
- `DisplayName`: The fleet name to display.
- `OptimizeForEndUserLocation`: The option to optimize for better performance by routing traffic through the closest AWS Region to users, which may be outside of your home Region.
- `Tags`:  The tags to add to the resource. A tag is a key-value pair.
"""

create_fleet(FleetName; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/createFleet", Dict{String, Any}("FleetName"=>FleetName); aws_config=aws_config)
create_fleet(FleetName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/createFleet", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetName"=>FleetName), args)); aws_config=aws_config)

"""
    DeleteFleet()

Deletes a fleet. Prevents users from accessing previously associated websites. 

# Required Parameters
- `FleetArn`: The ARN of the fleet.

"""

delete_fleet(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/deleteFleet", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
delete_fleet(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/deleteFleet", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeAuditStreamConfiguration()

Describes the configuration for delivering audit streams to the customer account.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

"""

describe_audit_stream_configuration(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeAuditStreamConfiguration", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
describe_audit_stream_configuration(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeAuditStreamConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeCompanyNetworkConfiguration()

Describes the networking configuration to access the internal websites associated with the specified fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

"""

describe_company_network_configuration(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeCompanyNetworkConfiguration", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
describe_company_network_configuration(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeCompanyNetworkConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeDevice()

Provides information about a user's device.

# Required Parameters
- `DeviceId`: A unique identifier for a registered user's device.
- `FleetArn`: The ARN of the fleet.

"""

describe_device(DeviceId, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeDevice", Dict{String, Any}("DeviceId"=>DeviceId, "FleetArn"=>FleetArn); aws_config=aws_config)
describe_device(DeviceId, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeDevice", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DeviceId"=>DeviceId, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeDevicePolicyConfiguration()

Describes the device policy configuration for the specified fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

"""

describe_device_policy_configuration(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeDevicePolicyConfiguration", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
describe_device_policy_configuration(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeDevicePolicyConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeDomain()

Provides information about the domain.

# Required Parameters
- `DomainName`: The name of the domain.
- `FleetArn`: The ARN of the fleet.

"""

describe_domain(DomainName, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeDomain", Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn); aws_config=aws_config)
describe_domain(DomainName, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeDomain", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeFleetMetadata()

Provides basic information for the specified fleet, excluding identity provider, networking, and device configuration details.

# Required Parameters
- `FleetArn`: The Amazon Resource Name (ARN) of the fleet.

"""

describe_fleet_metadata(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeFleetMetadata", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
describe_fleet_metadata(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeFleetMetadata", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeIdentityProviderConfiguration()

Describes the identity provider configuration of the specified fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

"""

describe_identity_provider_configuration(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeIdentityProviderConfiguration", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
describe_identity_provider_configuration(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeIdentityProviderConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DescribeWebsiteCertificateAuthority()

Provides information about the certificate authority.

# Required Parameters
- `FleetArn`: The ARN of the fleet.
- `WebsiteCaId`: A unique identifier for the certificate authority.

"""

describe_website_certificate_authority(FleetArn, WebsiteCaId; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeWebsiteCertificateAuthority", Dict{String, Any}("FleetArn"=>FleetArn, "WebsiteCaId"=>WebsiteCaId); aws_config=aws_config)
describe_website_certificate_authority(FleetArn, WebsiteCaId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/describeWebsiteCertificateAuthority", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn, "WebsiteCaId"=>WebsiteCaId), args)); aws_config=aws_config)

"""
    DisassociateDomain()

Disassociates a domain from Amazon WorkLink. End users lose the ability to access the domain with Amazon WorkLink. 

# Required Parameters
- `DomainName`: The name of the domain.
- `FleetArn`: The ARN of the fleet.

"""

disassociate_domain(DomainName, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/disassociateDomain", Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn); aws_config=aws_config)
disassociate_domain(DomainName, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/disassociateDomain", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DisassociateWebsiteAuthorizationProvider()

Disassociates a website authorization provider from a specified fleet. After the disassociation, users can't load any associated websites that require this authorization provider.

# Required Parameters
- `AuthorizationProviderId`: A unique identifier for the authorization provider.
- `FleetArn`: The ARN of the fleet.

"""

disassociate_website_authorization_provider(AuthorizationProviderId, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/disassociateWebsiteAuthorizationProvider", Dict{String, Any}("AuthorizationProviderId"=>AuthorizationProviderId, "FleetArn"=>FleetArn); aws_config=aws_config)
disassociate_website_authorization_provider(AuthorizationProviderId, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/disassociateWebsiteAuthorizationProvider", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("AuthorizationProviderId"=>AuthorizationProviderId, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    DisassociateWebsiteCertificateAuthority()

Removes a certificate authority (CA).

# Required Parameters
- `FleetArn`: The ARN of the fleet.
- `WebsiteCaId`: A unique identifier for the CA.

"""

disassociate_website_certificate_authority(FleetArn, WebsiteCaId; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/disassociateWebsiteCertificateAuthority", Dict{String, Any}("FleetArn"=>FleetArn, "WebsiteCaId"=>WebsiteCaId); aws_config=aws_config)
disassociate_website_certificate_authority(FleetArn, WebsiteCaId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/disassociateWebsiteCertificateAuthority", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn, "WebsiteCaId"=>WebsiteCaId), args)); aws_config=aws_config)

"""
    ListDevices()

Retrieves a list of devices registered with the specified fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `MaxResults`: The maximum number of results to be included in the next page.
- `NextToken`: The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.
"""

list_devices(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listDevices", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
list_devices(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listDevices", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    ListDomains()

Retrieves a list of domains associated to a specified fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `MaxResults`: The maximum number of results to be included in the next page.
- `NextToken`: The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.
"""

list_domains(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listDomains", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
list_domains(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listDomains", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    ListFleets()

Retrieves a list of fleets for the current account and Region.

# Optional Parameters
- `MaxResults`: The maximum number of results to be included in the next page.
- `NextToken`: The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.
"""

list_fleets(; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listFleets"; aws_config=aws_config)
list_fleets(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listFleets", args; aws_config=aws_config)

"""
    ListTagsForResource()

Retrieves a list of tags for the specified resource.

# Required Parameters
- `ResourceArn`: The Amazon Resource Name (ARN) of the fleet.

"""

list_tags_for_resource(ResourceArn; aws_config::AWSConfig=global_aws_config()) = worklink("GET", "/tags/$(ResourceArn)"; aws_config=aws_config)
list_tags_for_resource(ResourceArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("GET", "/tags/$(ResourceArn)", args; aws_config=aws_config)

"""
    ListWebsiteAuthorizationProviders()

Retrieves a list of website authorization providers associated with a specified fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `MaxResults`: The maximum number of results to be included in the next page.
- `NextToken`: The pagination token to use to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.
"""

list_website_authorization_providers(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listWebsiteAuthorizationProviders", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
list_website_authorization_providers(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listWebsiteAuthorizationProviders", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    ListWebsiteCertificateAuthorities()

Retrieves a list of certificate authorities added for the current account and Region.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `MaxResults`: The maximum number of results to be included in the next page.
- `NextToken`: The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page.
"""

list_website_certificate_authorities(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listWebsiteCertificateAuthorities", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
list_website_certificate_authorities(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/listWebsiteCertificateAuthorities", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    RestoreDomainAccess()

Moves a domain to ACTIVE status if it was in the INACTIVE status.

# Required Parameters
- `DomainName`: The name of the domain.
- `FleetArn`: The ARN of the fleet.

"""

restore_domain_access(DomainName, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/restoreDomainAccess", Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn); aws_config=aws_config)
restore_domain_access(DomainName, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/restoreDomainAccess", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    RevokeDomainAccess()

Moves a domain to INACTIVE status if it was in the ACTIVE status.

# Required Parameters
- `DomainName`: The name of the domain.
- `FleetArn`: The ARN of the fleet.

"""

revoke_domain_access(DomainName, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/revokeDomainAccess", Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn); aws_config=aws_config)
revoke_domain_access(DomainName, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/revokeDomainAccess", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    SignOutUser()

Signs the user out from all of their devices. The user can sign in again if they have valid credentials.

# Required Parameters
- `FleetArn`: The ARN of the fleet.
- `Username`: The name of the user.

"""

sign_out_user(FleetArn, Username; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/signOutUser", Dict{String, Any}("FleetArn"=>FleetArn, "Username"=>Username); aws_config=aws_config)
sign_out_user(FleetArn, Username, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/signOutUser", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn, "Username"=>Username), args)); aws_config=aws_config)

"""
    TagResource()

Adds or overwrites one or more tags for the specified resource, such as a fleet. Each tag consists of a key and an optional value. If a resource already has a tag with the same key, this operation updates its value.

# Required Parameters
- `ResourceArn`: The Amazon Resource Name (ARN) of the fleet.
- `Tags`: The tags to add to the resource. A tag is a key-value pair.

"""

tag_resource(ResourceArn, Tags; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/tags/$(ResourceArn)", Dict{String, Any}("Tags"=>Tags); aws_config=aws_config)
tag_resource(ResourceArn, Tags, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/tags/$(ResourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Tags"=>Tags), args)); aws_config=aws_config)

"""
    UntagResource()

Removes one or more tags from the specified resource.

# Required Parameters
- `ResourceArn`: The Amazon Resource Name (ARN) of the fleet.
- `tagKeys`: The list of tag keys to remove from the resource.

"""

untag_resource(ResourceArn, tagKeys; aws_config::AWSConfig=global_aws_config()) = worklink("DELETE", "/tags/$(ResourceArn)", Dict{String, Any}("tagKeys"=>tagKeys); aws_config=aws_config)
untag_resource(ResourceArn, tagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("DELETE", "/tags/$(ResourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws_config=aws_config)

"""
    UpdateAuditStreamConfiguration()

Updates the audit stream configuration for the fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `AuditStreamArn`: The ARN of the Amazon Kinesis data stream that receives the audit events.
"""

update_audit_stream_configuration(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateAuditStreamConfiguration", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
update_audit_stream_configuration(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateAuditStreamConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    UpdateCompanyNetworkConfiguration()

Updates the company network configuration for the fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.
- `SecurityGroupIds`: The security groups associated with access to the provided subnets.
- `SubnetIds`: The subnets used for X-ENI connections from Amazon WorkLink rendering containers.
- `VpcId`: The VPC with connectivity to associated websites.

"""

update_company_network_configuration(FleetArn, SecurityGroupIds, SubnetIds, VpcId; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateCompanyNetworkConfiguration", Dict{String, Any}("FleetArn"=>FleetArn, "SecurityGroupIds"=>SecurityGroupIds, "SubnetIds"=>SubnetIds, "VpcId"=>VpcId); aws_config=aws_config)
update_company_network_configuration(FleetArn, SecurityGroupIds, SubnetIds, VpcId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateCompanyNetworkConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn, "SecurityGroupIds"=>SecurityGroupIds, "SubnetIds"=>SubnetIds, "VpcId"=>VpcId), args)); aws_config=aws_config)

"""
    UpdateDevicePolicyConfiguration()

Updates the device policy configuration for the fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `DeviceCaCertificate`: The certificate chain, including intermediate certificates and the root certificate authority certificate used to issue device certificates.
"""

update_device_policy_configuration(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateDevicePolicyConfiguration", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
update_device_policy_configuration(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateDevicePolicyConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    UpdateDomainMetadata()

Updates domain metadata, such as DisplayName.

# Required Parameters
- `DomainName`: The name of the domain.
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `DisplayName`: The name to display.
"""

update_domain_metadata(DomainName, FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateDomainMetadata", Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn); aws_config=aws_config)
update_domain_metadata(DomainName, FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateDomainMetadata", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName, "FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    UpdateFleetMetadata()

Updates fleet metadata, such as DisplayName.

# Required Parameters
- `FleetArn`: The ARN of the fleet.

# Optional Parameters
- `DisplayName`: The fleet name to display. The existing DisplayName is unset if null is passed.
- `OptimizeForEndUserLocation`: The option to optimize for better performance by routing traffic through the closest AWS Region to users, which may be outside of your home Region.
"""

update_fleet_metadata(FleetArn; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/UpdateFleetMetadata", Dict{String, Any}("FleetArn"=>FleetArn); aws_config=aws_config)
update_fleet_metadata(FleetArn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/UpdateFleetMetadata", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn), args)); aws_config=aws_config)

"""
    UpdateIdentityProviderConfiguration()

Updates the identity provider configuration for the fleet.

# Required Parameters
- `FleetArn`: The ARN of the fleet.
- `IdentityProviderType`: The type of identity provider.

# Optional Parameters
- `IdentityProviderSamlMetadata`: The SAML metadata document provided by the customer’s identity provider. The existing IdentityProviderSamlMetadata is unset if null is passed.
"""

update_identity_provider_configuration(FleetArn, IdentityProviderType; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateIdentityProviderConfiguration", Dict{String, Any}("FleetArn"=>FleetArn, "IdentityProviderType"=>IdentityProviderType); aws_config=aws_config)
update_identity_provider_configuration(FleetArn, IdentityProviderType, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = worklink("POST", "/updateIdentityProviderConfiguration", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("FleetArn"=>FleetArn, "IdentityProviderType"=>IdentityProviderType), args)); aws_config=aws_config)
