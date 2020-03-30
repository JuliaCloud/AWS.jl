include("../AWSServices.jl")
using .AWSServices: worklink

"""
    DisassociateDomain()

Disassociates a domain from Amazon WorkLink. End users lose the ability to access the domain with Amazon WorkLink. 

Required Parameters
{
  "DomainName": "The name of the domain.",
  "FleetArn": "The ARN of the fleet."
}
"""
DisassociateDomain(args) = worklink("POST", "/disassociateDomain", args)

"""
    AssociateWebsiteCertificateAuthority()

Imports the root certificate of a certificate authority (CA) used to obtain TLS certificates used by associated websites within the company network.

Required Parameters
{
  "FleetArn": "The ARN of the fleet.",
  "Certificate": "The root certificate of the CA."
}

Optional Parameters
{
  "DisplayName": "The certificate name to display."
}
"""
AssociateWebsiteCertificateAuthority(args) = worklink("POST", "/associateWebsiteCertificateAuthority", args)

"""
    UpdateCompanyNetworkConfiguration()

Updates the company network configuration for the fleet.

Required Parameters
{
  "SecurityGroupIds": "The security groups associated with access to the provided subnets.",
  "SubnetIds": "The subnets used for X-ENI connections from Amazon WorkLink rendering containers.",
  "FleetArn": "The ARN of the fleet.",
  "VpcId": "The VPC with connectivity to associated websites."
}
"""
UpdateCompanyNetworkConfiguration(args) = worklink("POST", "/updateCompanyNetworkConfiguration", args)

"""
    ListDevices()

Retrieves a list of devices registered with the specified fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be included in the next page.",
  "NextToken": "The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page."
}
"""
ListDevices(args) = worklink("POST", "/listDevices", args)

"""
    DescribeDevicePolicyConfiguration()

Describes the device policy configuration for the specified fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}
"""
DescribeDevicePolicyConfiguration(args) = worklink("POST", "/describeDevicePolicyConfiguration", args)

"""
    UpdateDevicePolicyConfiguration()

Updates the device policy configuration for the fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "DeviceCaCertificate": "The certificate chain, including intermediate certificates and the root certificate authority certificate used to issue device certificates."
}
"""
UpdateDevicePolicyConfiguration(args) = worklink("POST", "/updateDevicePolicyConfiguration", args)

"""
    DescribeDomain()

Provides information about the domain.

Required Parameters
{
  "DomainName": "The name of the domain.",
  "FleetArn": "The ARN of the fleet."
}
"""
DescribeDomain(args) = worklink("POST", "/describeDomain", args)

"""
    RestoreDomainAccess()

Moves a domain to ACTIVE status if it was in the INACTIVE status.

Required Parameters
{
  "DomainName": "The name of the domain.",
  "FleetArn": "The ARN of the fleet."
}
"""
RestoreDomainAccess(args) = worklink("POST", "/restoreDomainAccess", args)

"""
    DisassociateWebsiteCertificateAuthority()

Removes a certificate authority (CA).

Required Parameters
{
  "FleetArn": "The ARN of the fleet.",
  "WebsiteCaId": "A unique identifier for the CA."
}
"""
DisassociateWebsiteCertificateAuthority(args) = worklink("POST", "/disassociateWebsiteCertificateAuthority", args)

"""
    RevokeDomainAccess()

Moves a domain to INACTIVE status if it was in the ACTIVE status.

Required Parameters
{
  "DomainName": "The name of the domain.",
  "FleetArn": "The ARN of the fleet."
}
"""
RevokeDomainAccess(args) = worklink("POST", "/revokeDomainAccess", args)

"""
    ListDomains()

Retrieves a list of domains associated to a specified fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be included in the next page.",
  "NextToken": "The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page."
}
"""
ListDomains(args) = worklink("POST", "/listDomains", args)

"""
    UpdateDomainMetadata()

Updates domain metadata, such as DisplayName.

Required Parameters
{
  "DomainName": "The name of the domain.",
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "DisplayName": "The name to display."
}
"""
UpdateDomainMetadata(args) = worklink("POST", "/updateDomainMetadata", args)

"""
    DescribeFleetMetadata()

Provides basic information for the specified fleet, excluding identity provider, networking, and device configuration details.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}
"""
DescribeFleetMetadata(args) = worklink("POST", "/describeFleetMetadata", args)

"""
    ListFleets()

Retrieves a list of fleets for the current account and Region.

Optional Parameters
{
  "MaxResults": "The maximum number of results to be included in the next page.",
  "NextToken": "The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page."
}
"""
ListFleets() = worklink("POST", "/listFleets")
ListFleets(args) = worklink("POST", "/listFleets", args)

"""
    DescribeWebsiteCertificateAuthority()

Provides information about the certificate authority.

Required Parameters
{
  "FleetArn": "The ARN of the fleet.",
  "WebsiteCaId": "A unique identifier for the certificate authority."
}
"""
DescribeWebsiteCertificateAuthority(args) = worklink("POST", "/describeWebsiteCertificateAuthority", args)

"""
    AssociateDomain()

Specifies a domain to be associated to Amazon WorkLink.

Required Parameters
{
  "DomainName": "The fully qualified domain name (FQDN).",
  "AcmCertificateArn": "The ARN of an issued ACM certificate that is valid for the domain being associated.",
  "FleetArn": "The Amazon Resource Name (ARN) of the fleet."
}

Optional Parameters
{
  "DisplayName": "The name to display."
}
"""
AssociateDomain(args) = worklink("POST", "/associateDomain", args)

"""
    DisassociateWebsiteAuthorizationProvider()

Disassociates a website authorization provider from a specified fleet. After the disassociation, users can't load any associated websites that require this authorization provider.

Required Parameters
{
  "FleetArn": "The ARN of the fleet.",
  "AuthorizationProviderId": "A unique identifier for the authorization provider."
}
"""
DisassociateWebsiteAuthorizationProvider(args) = worklink("POST", "/disassociateWebsiteAuthorizationProvider", args)

"""
    UpdateAuditStreamConfiguration()

Updates the audit stream configuration for the fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "AuditStreamArn": "The ARN of the Amazon Kinesis data stream that receives the audit events."
}
"""
UpdateAuditStreamConfiguration(args) = worklink("POST", "/updateAuditStreamConfiguration", args)

"""
    UpdateFleetMetadata()

Updates fleet metadata, such as DisplayName.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "DisplayName": "The fleet name to display. The existing DisplayName is unset if null is passed.",
  "OptimizeForEndUserLocation": "The option to optimize for better performance by routing traffic through the closest AWS Region to users, which may be outside of your home Region."
}
"""
UpdateFleetMetadata(args) = worklink("POST", "/UpdateFleetMetadata", args)

"""
    ListWebsiteCertificateAuthorities()

Retrieves a list of certificate authorities added for the current account and Region.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be included in the next page.",
  "NextToken": "The pagination token used to retrieve the next page of results for this operation. If this value is null, it retrieves the first page."
}
"""
ListWebsiteCertificateAuthorities(args) = worklink("POST", "/listWebsiteCertificateAuthorities", args)

"""
    ListWebsiteAuthorizationProviders()

Retrieves a list of website authorization providers associated with a specified fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "MaxResults": "The maximum number of results to be included in the next page.",
  "NextToken": "The pagination token to use to retrieve the next page of results for this operation. If this value is null, it retrieves the first page."
}
"""
ListWebsiteAuthorizationProviders(args) = worklink("POST", "/listWebsiteAuthorizationProviders", args)

"""
    DeleteFleet()

Deletes a fleet. Prevents users from accessing previously associated websites. 

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}
"""
DeleteFleet(args) = worklink("POST", "/deleteFleet", args)

"""
    DescribeDevice()

Provides information about a user's device.

Required Parameters
{
  "FleetArn": "The ARN of the fleet.",
  "DeviceId": "A unique identifier for a registered user's device."
}
"""
DescribeDevice(args) = worklink("POST", "/describeDevice", args)

"""
    AssociateWebsiteAuthorizationProvider()

Associates a website authorization provider with a specified fleet. This is used to authorize users against associated websites in the company network.

Required Parameters
{
  "FleetArn": "The ARN of the fleet.",
  "AuthorizationProviderType": "The authorization provider type."
}

Optional Parameters
{
  "DomainName": "The domain name of the authorization provider. This applies only to SAML-based authorization providers."
}
"""
AssociateWebsiteAuthorizationProvider(args) = worklink("POST", "/associateWebsiteAuthorizationProvider", args)

"""
    SignOutUser()

Signs the user out from all of their devices. The user can sign in again if they have valid credentials.

Required Parameters
{
  "FleetArn": "The ARN of the fleet.",
  "Username": "The name of the user."
}
"""
SignOutUser(args) = worklink("POST", "/signOutUser", args)

"""
    UpdateIdentityProviderConfiguration()

Updates the identity provider configuration for the fleet.

Required Parameters
{
  "IdentityProviderType": "The type of identity provider.",
  "FleetArn": "The ARN of the fleet."
}

Optional Parameters
{
  "IdentityProviderSamlMetadata": "The SAML metadata document provided by the customer’s identity provider. The existing IdentityProviderSamlMetadata is unset if null is passed."
}
"""
UpdateIdentityProviderConfiguration(args) = worklink("POST", "/updateIdentityProviderConfiguration", args)

"""
    DescribeAuditStreamConfiguration()

Describes the configuration for delivering audit streams to the customer account.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}
"""
DescribeAuditStreamConfiguration(args) = worklink("POST", "/describeAuditStreamConfiguration", args)

"""
    CreateFleet()

Creates a fleet. A fleet consists of resources and the configuration that delivers associated websites to authorized users who download and set up the Amazon WorkLink app.

Required Parameters
{
  "FleetName": "A unique name for the fleet."
}

Optional Parameters
{
  "DisplayName": "The fleet name to display.",
  "OptimizeForEndUserLocation": "The option to optimize for better performance by routing traffic through the closest AWS Region to users, which may be outside of your home Region."
}
"""
CreateFleet(args) = worklink("POST", "/createFleet", args)

"""
    DescribeCompanyNetworkConfiguration()

Describes the networking configuration to access the internal websites associated with the specified fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}
"""
DescribeCompanyNetworkConfiguration(args) = worklink("POST", "/describeCompanyNetworkConfiguration", args)

"""
    DescribeIdentityProviderConfiguration()

Describes the identity provider configuration of the specified fleet.

Required Parameters
{
  "FleetArn": "The ARN of the fleet."
}
"""
DescribeIdentityProviderConfiguration(args) = worklink("POST", "/describeIdentityProviderConfiguration", args)
