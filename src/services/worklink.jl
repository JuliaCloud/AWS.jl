# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: worklink
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "device_ca_certificate" => "DeviceCaCertificate",
    "display_name" => "DisplayName",
    "identity_provider_saml_metadata" => "IdentityProviderSamlMetadata",
    "audit_stream_arn" => "AuditStreamArn",
    "domain_name" => "DomainName",
    "tags" => "Tags",
    "next_token" => "NextToken",
    "max_results" => "MaxResults",
    "optimize_for_end_user_location" => "OptimizeForEndUserLocation",
)

"""
    associate_domain(acm_certificate_arn, domain_name, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Specifies a domain to be associated to Amazon WorkLink.

# Arguments
- `acm_certificate_arn`: The ARN of an issued ACM certificate that is valid for the domain
  being associated.
- `domain_name`: The fully qualified domain name (FQDN).
- `fleet_arn`: The Amazon Resource Name (ARN) of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"display_name"`: The name to display.
"""
function associate_domain(
    AcmCertificateArn,
    DomainName,
    FleetArn;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/associateDomain",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AcmCertificateArn" => AcmCertificateArn,
                    "DomainName" => DomainName,
                    "FleetArn" => FleetArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    associate_website_authorization_provider(authorization_provider_type, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Associates a website authorization provider with a specified fleet. This is used to
authorize users against associated websites in the company network.

# Arguments
- `authorization_provider_type`: The authorization provider type.
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"domain_name"`: The domain name of the authorization provider. This applies only to
  SAML-based authorization providers.
"""
function associate_website_authorization_provider(
    AuthorizationProviderType,
    FleetArn;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/associateWebsiteAuthorizationProvider",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AuthorizationProviderType" => AuthorizationProviderType,
                    "FleetArn" => FleetArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    associate_website_certificate_authority(certificate, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Imports the root certificate of a certificate authority (CA) used to obtain TLS
certificates used by associated websites within the company network.

# Arguments
- `certificate`: The root certificate of the CA.
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"display_name"`: The certificate name to display.
"""
function associate_website_certificate_authority(
    Certificate, FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/associateWebsiteCertificateAuthority",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("Certificate" => Certificate, "FleetArn" => FleetArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_fleet(fleet_name; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a fleet. A fleet consists of resources and the configuration that delivers
associated websites to authorized users who download and set up the Amazon WorkLink app.

# Arguments
- `fleet_name`: A unique name for the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"display_name"`: The fleet name to display.
- `"optimize_for_end_user_location"`: The option to optimize for better performance by
  routing traffic through the closest AWS Region to users, which may be outside of your home
  Region.
- `"tags"`:  The tags to add to the resource. A tag is a key-value pair.
"""
function create_fleet(
    FleetName; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/createFleet",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetName" => FleetName), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_fleet(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Deletes a fleet. Prevents users from accessing previously associated websites.

# Arguments
- `fleet_arn`: The ARN of the fleet.

"""
function delete_fleet(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/deleteFleet",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_audit_stream_configuration(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the configuration for delivering audit streams to the customer account.

# Arguments
- `fleet_arn`: The ARN of the fleet.

"""
function describe_audit_stream_configuration(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeAuditStreamConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_company_network_configuration(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the networking configuration to access the internal websites associated with the
specified fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

"""
function describe_company_network_configuration(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeCompanyNetworkConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_device(device_id, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides information about a user's device.

# Arguments
- `device_id`: A unique identifier for a registered user's device.
- `fleet_arn`: The ARN of the fleet.

"""
function describe_device(
    DeviceId, FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeDevice",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("DeviceId" => DeviceId, "FleetArn" => FleetArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_device_policy_configuration(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the device policy configuration for the specified fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

"""
function describe_device_policy_configuration(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeDevicePolicyConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_domain(domain_name, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides information about the domain.

# Arguments
- `domain_name`: The name of the domain.
- `fleet_arn`: The ARN of the fleet.

"""
function describe_domain(
    DomainName, FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeDomain",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("DomainName" => DomainName, "FleetArn" => FleetArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_fleet_metadata(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides basic information for the specified fleet, excluding identity provider,
networking, and device configuration details.

# Arguments
- `fleet_arn`: The Amazon Resource Name (ARN) of the fleet.

"""
function describe_fleet_metadata(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeFleetMetadata",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_identity_provider_configuration(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Describes the identity provider configuration of the specified fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

"""
function describe_identity_provider_configuration(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeIdentityProviderConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_website_certificate_authority(fleet_arn, website_ca_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Provides information about the certificate authority.

# Arguments
- `fleet_arn`: The ARN of the fleet.
- `website_ca_id`: A unique identifier for the certificate authority.

"""
function describe_website_certificate_authority(
    FleetArn, WebsiteCaId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/describeWebsiteCertificateAuthority",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("FleetArn" => FleetArn, "WebsiteCaId" => WebsiteCaId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disassociate_domain(domain_name, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociates a domain from Amazon WorkLink. End users lose the ability to access the
domain with Amazon WorkLink.

# Arguments
- `domain_name`: The name of the domain.
- `fleet_arn`: The ARN of the fleet.

"""
function disassociate_domain(
    DomainName, FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/disassociateDomain",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("DomainName" => DomainName, "FleetArn" => FleetArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disassociate_website_authorization_provider(authorization_provider_id, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Disassociates a website authorization provider from a specified fleet. After the
disassociation, users can't load any associated websites that require this authorization
provider.

# Arguments
- `authorization_provider_id`: A unique identifier for the authorization provider.
- `fleet_arn`: The ARN of the fleet.

"""
function disassociate_website_authorization_provider(
    AuthorizationProviderId,
    FleetArn;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/disassociateWebsiteAuthorizationProvider",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AuthorizationProviderId" => AuthorizationProviderId,
                    "FleetArn" => FleetArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    disassociate_website_certificate_authority(fleet_arn, website_ca_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes a certificate authority (CA).

# Arguments
- `fleet_arn`: The ARN of the fleet.
- `website_ca_id`: A unique identifier for the CA.

"""
function disassociate_website_certificate_authority(
    FleetArn, WebsiteCaId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/disassociateWebsiteCertificateAuthority",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("FleetArn" => FleetArn, "WebsiteCaId" => WebsiteCaId),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_devices(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of devices registered with the specified fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to be included in the next page.
- `"next_token"`: The pagination token used to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_devices(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/listDevices",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_domains(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of domains associated to a specified fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to be included in the next page.
- `"next_token"`: The pagination token used to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_domains(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/listDomains",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_fleets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of fleets for the current account and Region.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to be included in the next page.
- `"next_token"`: The pagination token used to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_fleets(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/listFleets",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(resource_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of tags for the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the fleet.

"""
function list_tags_for_resource(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "GET",
        "/tags/$(ResourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_website_authorization_providers(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of website authorization providers associated with a specified fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to be included in the next page.
- `"next_token"`: The pagination token to use to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_website_authorization_providers(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/listWebsiteAuthorizationProviders",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_website_certificate_authorities(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Retrieves a list of certificate authorities added for the current account and Region.

# Arguments
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results to be included in the next page.
- `"next_token"`: The pagination token used to retrieve the next page of results for this
  operation. If this value is null, it retrieves the first page.
"""
function list_website_certificate_authorities(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/listWebsiteCertificateAuthorities",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    restore_domain_access(domain_name, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Moves a domain to ACTIVE status if it was in the INACTIVE status.

# Arguments
- `domain_name`: The name of the domain.
- `fleet_arn`: The ARN of the fleet.

"""
function restore_domain_access(
    DomainName, FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/restoreDomainAccess",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("DomainName" => DomainName, "FleetArn" => FleetArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    revoke_domain_access(domain_name, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Moves a domain to INACTIVE status if it was in the ACTIVE status.

# Arguments
- `domain_name`: The name of the domain.
- `fleet_arn`: The ARN of the fleet.

"""
function revoke_domain_access(
    DomainName, FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/revokeDomainAccess",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("DomainName" => DomainName, "FleetArn" => FleetArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    sign_out_user(fleet_arn, username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Signs the user out from all of their devices. The user can sign in again if they have valid
credentials.

# Arguments
- `fleet_arn`: The ARN of the fleet.
- `username`: The name of the user.

"""
function sign_out_user(
    FleetArn, Username; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/signOutUser",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("FleetArn" => FleetArn, "Username" => Username),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Adds or overwrites one or more tags for the specified resource, such as a fleet. Each tag
consists of a key and an optional value. If a resource already has a tag with the same key,
this operation updates its value.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the fleet.
- `tags`: The tags to add to the resource. A tag is a key-value pair.

"""
function tag_resource(
    ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/tags/$(ResourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Tags" => Tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Removes one or more tags from the specified resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the fleet.
- `tag_keys`: The list of tag keys to remove from the resource.

"""
function untag_resource(
    ResourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "DELETE",
        "/tags/$(ResourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_audit_stream_configuration(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the audit stream configuration for the fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"audit_stream_arn"`: The ARN of the Amazon Kinesis data stream that receives the audit
  events.
"""
function update_audit_stream_configuration(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/updateAuditStreamConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_company_network_configuration(fleet_arn, security_group_ids, subnet_ids, vpc_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the company network configuration for the fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.
- `security_group_ids`: The security groups associated with access to the provided subnets.
- `subnet_ids`: The subnets used for X-ENI connections from Amazon WorkLink rendering
  containers.
- `vpc_id`: The VPC with connectivity to associated websites.

"""
function update_company_network_configuration(
    FleetArn,
    SecurityGroupIds,
    SubnetIds,
    VpcId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/updateCompanyNetworkConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "FleetArn" => FleetArn,
                    "SecurityGroupIds" => SecurityGroupIds,
                    "SubnetIds" => SubnetIds,
                    "VpcId" => VpcId,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_device_policy_configuration(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the device policy configuration for the fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"device_ca_certificate"`: The certificate chain, including intermediate certificates and
  the root certificate authority certificate used to issue device certificates.
"""
function update_device_policy_configuration(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/updateDevicePolicyConfiguration",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_domain_metadata(domain_name, fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates domain metadata, such as DisplayName.

# Arguments
- `domain_name`: The name of the domain.
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"display_name"`: The name to display.
"""
function update_domain_metadata(
    DomainName, FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/updateDomainMetadata",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("DomainName" => DomainName, "FleetArn" => FleetArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_fleet_metadata(fleet_arn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates fleet metadata, such as DisplayName.

# Arguments
- `fleet_arn`: The ARN of the fleet.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"display_name"`: The fleet name to display. The existing DisplayName is unset if null is
  passed.
- `"optimize_for_end_user_location"`: The option to optimize for better performance by
  routing traffic through the closest AWS Region to users, which may be outside of your home
  Region.
"""
function update_fleet_metadata(
    FleetArn; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/UpdateFleetMetadata",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("FleetArn" => FleetArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_identity_provider_configuration(fleet_arn, identity_provider_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the identity provider configuration for the fleet.

# Arguments
- `fleet_arn`: The ARN of the fleet.
- `identity_provider_type`: The type of identity provider.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"identity_provider_saml_metadata"`: The SAML metadata document provided by the
  customer’s identity provider. The existing IdentityProviderSamlMetadata is unset if null
  is passed.
"""
function update_identity_provider_configuration(
    FleetArn,
    IdentityProviderType;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return worklink(
        "POST",
        "/updateIdentityProviderConfiguration",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "FleetArn" => FleetArn, "IdentityProviderType" => IdentityProviderType
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
