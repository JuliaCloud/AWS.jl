# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: pca_connector_scep
using AWS.Compat
using AWS.UUIDs

"""
    create_challenge(connector_arn)
    create_challenge(connector_arn, params::Dict{String,<:Any})

For general-purpose connectors. Creates a challenge password for the specified connector.
The SCEP protocol uses a challenge password to authenticate a request before issuing a
certificate from a certificate authority (CA). Your SCEP clients include the challenge
password as part of their certificate request to Connector for SCEP. To retrieve the
connector Amazon Resource Names (ARNs) for the connectors in your account, call
ListConnectors. To create additional challenge passwords for the connector, call
CreateChallenge again. We recommend frequently rotating your challenge passwords.

# Arguments
- `connector_arn`: The Amazon Resource Name (ARN) of the connector that you want to create
  a challenge for.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClientToken"`: Custom string that can be used to distinguish between calls to the
  CreateChallenge action. Client tokens for CreateChallenge time out after five minutes.
  Therefore, if you call CreateChallenge multiple times with the same client token within
  five minutes, Connector for SCEP recognizes that you are requesting only one challenge and
  will only respond with one. If you change the client token for each call, Connector for
  SCEP recognizes that you are requesting multiple challenge passwords.
- `"Tags"`: The key-value pairs to associate with the resource.
"""
function create_challenge(ConnectorArn; aws_config::AbstractAWSConfig=global_aws_config())
    return pca_connector_scep(
        "POST",
        "/challenges",
        Dict{String,Any}("ConnectorArn" => ConnectorArn, "ClientToken" => string(uuid4()));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_challenge(
    ConnectorArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "POST",
        "/challenges",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ConnectorArn" => ConnectorArn, "ClientToken" => string(uuid4())
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_connector(certificate_authority_arn)
    create_connector(certificate_authority_arn, params::Dict{String,<:Any})

Creates a SCEP connector. A SCEP connector links Amazon Web Services Private Certificate
Authority to your SCEP-compatible devices and mobile device management (MDM) systems.
Before you create a connector, you must complete a set of prerequisites, including creation
of a private certificate authority (CA) to use with this connector. For more information,
see Connector for SCEP prerequisites.

# Arguments
- `certificate_authority_arn`: The Amazon Resource Name (ARN) of the Amazon Web Services
  Private Certificate Authority certificate authority to use with this connector. Due to
  security vulnerabilities present in the SCEP protocol, we recommend using a private CA
  that's dedicated for use with the connector. To retrieve the private CAs associated with
  your account, you can call ListCertificateAuthorities using the Amazon Web Services Private
  CA API.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClientToken"`: Custom string that can be used to distinguish between calls to the
  CreateChallenge action. Client tokens for CreateChallenge time out after five minutes.
  Therefore, if you call CreateChallenge multiple times with the same client token within
  five minutes, Connector for SCEP recognizes that you are requesting only one challenge and
  will only respond with one. If you change the client token for each call, Connector for
  SCEP recognizes that you are requesting multiple challenge passwords.
- `"MobileDeviceManagement"`: If you don't supply a value, by default Connector for SCEP
  creates a connector for general-purpose use. A general-purpose connector is designed to
  work with clients or endpoints that support the SCEP protocol, except Connector for SCEP
  for Microsoft Intune. With connectors for general-purpose use, you manage SCEP challenge
  passwords using Connector for SCEP. For information about considerations and limitations
  with using Connector for SCEP, see Considerations and Limitations. If you provide an
  IntuneConfiguration, Connector for SCEP creates a connector for use with Microsoft Intune,
  and you manage the challenge passwords using Microsoft Intune. For more information, see
  Using Connector for SCEP for Microsoft Intune.
- `"Tags"`: The key-value pairs to associate with the resource.
"""
function create_connector(
    CertificateAuthorityArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return pca_connector_scep(
        "POST",
        "/connectors",
        Dict{String,Any}(
            "CertificateAuthorityArn" => CertificateAuthorityArn,
            "ClientToken" => string(uuid4()),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_connector(
    CertificateAuthorityArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "POST",
        "/connectors",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "CertificateAuthorityArn" => CertificateAuthorityArn,
                    "ClientToken" => string(uuid4()),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_challenge(challenge_arn)
    delete_challenge(challenge_arn, params::Dict{String,<:Any})

Deletes the specified Challenge.

# Arguments
- `challenge_arn`: The Amazon Resource Name (ARN) of the challenge password to delete.

"""
function delete_challenge(ChallengeArn; aws_config::AbstractAWSConfig=global_aws_config())
    return pca_connector_scep(
        "DELETE",
        "/challenges/$(ChallengeArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_challenge(
    ChallengeArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "DELETE",
        "/challenges/$(ChallengeArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_connector(connector_arn)
    delete_connector(connector_arn, params::Dict{String,<:Any})

Deletes the specified Connector. This operation also deletes any challenges associated with
the connector.

# Arguments
- `connector_arn`: The Amazon Resource Name (ARN) of the connector to delete.

"""
function delete_connector(ConnectorArn; aws_config::AbstractAWSConfig=global_aws_config())
    return pca_connector_scep(
        "DELETE",
        "/connectors/$(ConnectorArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_connector(
    ConnectorArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "DELETE",
        "/connectors/$(ConnectorArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_challenge_metadata(challenge_arn)
    get_challenge_metadata(challenge_arn, params::Dict{String,<:Any})

Retrieves the metadata for the specified Challenge.

# Arguments
- `challenge_arn`: The Amazon Resource Name (ARN) of the challenge.

"""
function get_challenge_metadata(
    ChallengeArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return pca_connector_scep(
        "GET",
        "/challengeMetadata/$(ChallengeArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_challenge_metadata(
    ChallengeArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "GET",
        "/challengeMetadata/$(ChallengeArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_challenge_password(challenge_arn)
    get_challenge_password(challenge_arn, params::Dict{String,<:Any})

Retrieves the challenge password for the specified Challenge.

# Arguments
- `challenge_arn`: The Amazon Resource Name (ARN) of the challenge.

"""
function get_challenge_password(
    ChallengeArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return pca_connector_scep(
        "GET",
        "/challengePasswords/$(ChallengeArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_challenge_password(
    ChallengeArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "GET",
        "/challengePasswords/$(ChallengeArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_connector(connector_arn)
    get_connector(connector_arn, params::Dict{String,<:Any})

Retrieves details about the specified Connector. Calling this action returns important
details about the connector, such as the public SCEP URL where your clients can request
certificates.

# Arguments
- `connector_arn`: The Amazon Resource Name (ARN) of the connector.

"""
function get_connector(ConnectorArn; aws_config::AbstractAWSConfig=global_aws_config())
    return pca_connector_scep(
        "GET",
        "/connectors/$(ConnectorArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_connector(
    ConnectorArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "GET",
        "/connectors/$(ConnectorArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_challenge_metadata(connector_arn)
    list_challenge_metadata(connector_arn, params::Dict{String,<:Any})

Retrieves the challenge metadata for the specified ARN.

# Arguments
- `connector_arn`: The Amazon Resource Name (ARN) of the connector.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of objects that you want Connector for SCEP to return
  for this request. If more objects are available, in the response, Connector for SCEP
  provides a NextToken value that you can use in a subsequent call to get the next batch of
  objects.
- `"NextToken"`: When you request a list of objects with a MaxResults setting, if the
  number of objects that are still available for retrieval exceeds the maximum you requested,
  Connector for SCEP returns a NextToken value in the response. To retrieve the next batch of
  objects, use the token returned from the prior request in your next request.
"""
function list_challenge_metadata(
    ConnectorArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return pca_connector_scep(
        "GET",
        "/challengeMetadata",
        Dict{String,Any}("ConnectorArn" => ConnectorArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_challenge_metadata(
    ConnectorArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "GET",
        "/challengeMetadata",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ConnectorArn" => ConnectorArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_connectors()
    list_connectors(params::Dict{String,<:Any})

Lists the connectors belonging to your Amazon Web Services account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of objects that you want Connector for SCEP to return
  for this request. If more objects are available, in the response, Connector for SCEP
  provides a NextToken value that you can use in a subsequent call to get the next batch of
  objects.
- `"NextToken"`: When you request a list of objects with a MaxResults setting, if the
  number of objects that are still available for retrieval exceeds the maximum you requested,
  Connector for SCEP returns a NextToken value in the response. To retrieve the next batch of
  objects, use the token returned from the prior request in your next request.
"""
function list_connectors(; aws_config::AbstractAWSConfig=global_aws_config())
    return pca_connector_scep(
        "GET", "/connectors"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_connectors(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return pca_connector_scep(
        "GET", "/connectors", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Retrieves the tags associated with the specified resource. Tags are key-value pairs that
you can use to categorize and manage your resources, for purposes like billing. For
example, you might set the tag key to \"customer\" and the value to the customer name or
ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50
tags for a resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.

"""
function list_tags_for_resource(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return pca_connector_scep(
        "GET",
        "/tags/$(ResourceArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "GET",
        "/tags/$(ResourceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds one or more tags to your resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `tags`: The key-value pairs to associate with the resource.

"""
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config())
    return pca_connector_scep(
        "POST",
        "/tags/$(ResourceArn)",
        Dict{String,Any}("Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    ResourceArn,
    Tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "POST",
        "/tags/$(ResourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Tags" => Tags), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes one or more tags from your resource.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the resource.
- `tag_keys`: Specifies a list of tag keys that you want to remove from the specified
  resources.

"""
function untag_resource(
    ResourceArn, tagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return pca_connector_scep(
        "DELETE",
        "/tags/$(ResourceArn)",
        Dict{String,Any}("tagKeys" => tagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    ResourceArn,
    tagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return pca_connector_scep(
        "DELETE",
        "/tags/$(ResourceArn)",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("tagKeys" => tagKeys), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
