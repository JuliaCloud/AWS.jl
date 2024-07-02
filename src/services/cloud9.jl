# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: cloud9
using AWS.Compat
using AWS.UUIDs

"""
    create_environment_ec2(image_id, instance_type, name)
    create_environment_ec2(image_id, instance_type, name, params::Dict{String,<:Any})

Creates an Cloud9 development environment, launches an Amazon Elastic Compute Cloud (Amazon
EC2) instance, and then connects from the instance to the environment.

# Arguments
- `image_id`: The identifier for the Amazon Machine Image (AMI) that's used to create the
  EC2 instance. To choose an AMI for the instance, you must specify a valid AMI alias or a
  valid Amazon EC2 Systems Manager (SSM) path. From December 04, 2023, you will be required
  to include the imageId parameter for the CreateEnvironmentEC2 action. This change will be
  reflected across all direct methods of communicating with the API, such as Amazon Web
  Services SDK, Amazon Web Services CLI and Amazon Web Services CloudFormation. This change
  will only affect direct API consumers, and not Cloud9 console users. We recommend using
  Amazon Linux 2023 as the AMI to create your environment as it is fully supported.  Since
  Ubuntu 18.04 has ended standard support as of May 31, 2023, we recommend you choose Ubuntu
  22.04.  AMI aliases     Amazon Linux 2: amazonlinux-2-x86_64    Amazon Linux 2023
  (recommended): amazonlinux-2023-x86_64    Ubuntu 18.04: ubuntu-18.04-x86_64    Ubuntu
  22.04: ubuntu-22.04-x86_64     SSM paths    Amazon Linux 2:
  resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2-x86_64    Amazon Linux 2023
  (recommended): resolve:ssm:/aws/service/cloud9/amis/amazonlinux-2023-x86_64    Ubuntu
  18.04: resolve:ssm:/aws/service/cloud9/amis/ubuntu-18.04-x86_64    Ubuntu 22.04:
  resolve:ssm:/aws/service/cloud9/amis/ubuntu-22.04-x86_64
- `instance_type`: The type of instance to connect to the environment (for example,
  t2.micro).
- `name`: The name of the environment to create. This name is visible to other IAM users in
  the same Amazon Web Services account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"automaticStopTimeMinutes"`: The number of minutes until the running instance is shut
  down after the environment has last been used.
- `"clientRequestToken"`: A unique, case-sensitive string that helps Cloud9 to ensure this
  operation completes no more than one time. For more information, see Client Tokens in the
  Amazon EC2 API Reference.
- `"connectionType"`: The connection type used for connecting to an Amazon EC2 environment.
  Valid values are CONNECT_SSH (default) and CONNECT_SSM (connected through Amazon EC2
  Systems Manager). For more information, see Accessing no-ingress EC2 instances with Amazon
  EC2 Systems Manager in the Cloud9 User Guide.
- `"description"`: The description of the environment to create.
- `"dryRun"`: Checks whether you have the required permissions for the action, without
  actually making the request, and provides an error response. If you have the required
  permissions, the error response is DryRunOperation. Otherwise, it is UnauthorizedOperation.
- `"ownerArn"`: The Amazon Resource Name (ARN) of the environment owner. This ARN can be
  the ARN of any IAM principal. If this value is not specified, the ARN defaults to this
  environment's creator.
- `"subnetId"`: The ID of the subnet in Amazon VPC that Cloud9 will use to communicate with
  the Amazon EC2 instance.
- `"tags"`: An array of key-value pairs that will be associated with the new Cloud9
  development environment.
"""
function create_environment_ec2(
    imageId, instanceType, name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "CreateEnvironmentEC2",
        Dict{String,Any}(
            "imageId" => imageId, "instanceType" => instanceType, "name" => name
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_environment_ec2(
    imageId,
    instanceType,
    name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "CreateEnvironmentEC2",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "imageId" => imageId, "instanceType" => instanceType, "name" => name
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_environment_membership(environment_id, permissions, user_arn)
    create_environment_membership(environment_id, permissions, user_arn, params::Dict{String,<:Any})

Adds an environment member to an Cloud9 development environment.

# Arguments
- `environment_id`: The ID of the environment that contains the environment member you want
  to add.
- `permissions`: The type of environment member permissions you want to associate with this
  environment member. Available values include:    read-only: Has read-only access to the
  environment.    read-write: Has read-write access to the environment.
- `user_arn`: The Amazon Resource Name (ARN) of the environment member you want to add.

"""
function create_environment_membership(
    environmentId, permissions, userArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "CreateEnvironmentMembership",
        Dict{String,Any}(
            "environmentId" => environmentId,
            "permissions" => permissions,
            "userArn" => userArn,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_environment_membership(
    environmentId,
    permissions,
    userArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "CreateEnvironmentMembership",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "environmentId" => environmentId,
                    "permissions" => permissions,
                    "userArn" => userArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_environment(environment_id)
    delete_environment(environment_id, params::Dict{String,<:Any})

Deletes an Cloud9 development environment. If an Amazon EC2 instance is connected to the
environment, also terminates the instance.

# Arguments
- `environment_id`: The ID of the environment to delete.

"""
function delete_environment(
    environmentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "DeleteEnvironment",
        Dict{String,Any}("environmentId" => environmentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_environment(
    environmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "DeleteEnvironment",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("environmentId" => environmentId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_environment_membership(environment_id, user_arn)
    delete_environment_membership(environment_id, user_arn, params::Dict{String,<:Any})

Deletes an environment member from a development environment.

# Arguments
- `environment_id`: The ID of the environment to delete the environment member from.
- `user_arn`: The Amazon Resource Name (ARN) of the environment member to delete from the
  environment.

"""
function delete_environment_membership(
    environmentId, userArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "DeleteEnvironmentMembership",
        Dict{String,Any}("environmentId" => environmentId, "userArn" => userArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_environment_membership(
    environmentId,
    userArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "DeleteEnvironmentMembership",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("environmentId" => environmentId, "userArn" => userArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_environment_memberships()
    describe_environment_memberships(params::Dict{String,<:Any})

Gets information about environment members for an Cloud9 development environment.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"environmentId"`: The ID of the environment to get environment member information about.
- `"maxResults"`: The maximum number of environment members to get information about.
- `"nextToken"`: During a previous call, if there are more than 25 items in the list, only
  the first 25 items are returned, along with a unique string called a next token. To get the
  next batch of items in the list, call this operation again, adding the next token to the
  call. To get all of the items in the list, keep calling this operation with each subsequent
  next token that is returned, until no more next tokens are returned.
- `"permissions"`: The type of environment member permissions to get information about.
  Available values include:    owner: Owns the environment.    read-only: Has read-only
  access to the environment.    read-write: Has read-write access to the environment.   If no
  value is specified, information about all environment members are returned.
- `"userArn"`: The Amazon Resource Name (ARN) of an individual environment member to get
  information about. If no value is specified, information about all environment members are
  returned.
"""
function describe_environment_memberships(;
    aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "DescribeEnvironmentMemberships";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_environment_memberships(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "DescribeEnvironmentMemberships",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_environment_status(environment_id)
    describe_environment_status(environment_id, params::Dict{String,<:Any})

Gets status information for an Cloud9 development environment.

# Arguments
- `environment_id`: The ID of the environment to get status information about.

"""
function describe_environment_status(
    environmentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "DescribeEnvironmentStatus",
        Dict{String,Any}("environmentId" => environmentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_environment_status(
    environmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "DescribeEnvironmentStatus",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("environmentId" => environmentId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_environments(environment_ids)
    describe_environments(environment_ids, params::Dict{String,<:Any})

Gets information about Cloud9 development environments.

# Arguments
- `environment_ids`: The IDs of individual environments to get information about.

"""
function describe_environments(
    environmentIds; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "DescribeEnvironments",
        Dict{String,Any}("environmentIds" => environmentIds);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_environments(
    environmentIds,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "DescribeEnvironments",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("environmentIds" => environmentIds), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_environments()
    list_environments(params::Dict{String,<:Any})

Gets a list of Cloud9 development environment identifiers.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"maxResults"`: The maximum number of environments to get identifiers for.
- `"nextToken"`: During a previous call, if there are more than 25 items in the list, only
  the first 25 items are returned, along with a unique string called a next token. To get the
  next batch of items in the list, call this operation again, adding the next token to the
  call. To get all of the items in the list, keep calling this operation with each subsequent
  next token that is returned, until no more next tokens are returned.
"""
function list_environments(; aws_config::AbstractAWSConfig=global_aws_config())
    return cloud9(
        "ListEnvironments"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_environments(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "ListEnvironments", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Gets a list of the tags associated with an Cloud9 development environment.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the Cloud9 development environment to
  get the tags for.

"""
function list_tags_for_resource(
    ResourceARN; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "ListTagsForResource",
        Dict{String,Any}("ResourceARN" => ResourceARN);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    ResourceARN,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "ListTagsForResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceARN" => ResourceARN), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Adds tags to an Cloud9 development environment.  Tags that you add to an Cloud9 environment
by using this method will NOT be automatically propagated to underlying resources.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the Cloud9 development environment to
  add tags to.
- `tags`: The list of tags to add to the given Cloud9 development environment.

"""
function tag_resource(ResourceARN, Tags; aws_config::AbstractAWSConfig=global_aws_config())
    return cloud9(
        "TagResource",
        Dict{String,Any}("ResourceARN" => ResourceARN, "Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    ResourceARN,
    Tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "TagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceARN" => ResourceARN, "Tags" => Tags),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes tags from an Cloud9 development environment.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the Cloud9 development environment to
  remove tags from.
- `tag_keys`: The tag names of the tags to remove from the given Cloud9 development
  environment.

"""
function untag_resource(
    ResourceARN, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "UntagResource",
        Dict{String,Any}("ResourceARN" => ResourceARN, "TagKeys" => TagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    ResourceARN,
    TagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "UntagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceARN" => ResourceARN, "TagKeys" => TagKeys),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_environment(environment_id)
    update_environment(environment_id, params::Dict{String,<:Any})

Changes the settings of an existing Cloud9 development environment.

# Arguments
- `environment_id`: The ID of the environment to change settings.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"description"`: Any new or replacement description for the environment.
- `"managedCredentialsAction"`: Allows the environment owner to turn on or turn off the
  Amazon Web Services managed temporary credentials for an Cloud9 environment by using one of
  the following values:    ENABLE     DISABLE     Only the environment owner can change the
  status of managed temporary credentials. An AccessDeniedException is thrown if an attempt
  to turn on or turn off managed temporary credentials is made by an account that's not the
  environment owner.
- `"name"`: A replacement name for the environment.
"""
function update_environment(
    environmentId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "UpdateEnvironment",
        Dict{String,Any}("environmentId" => environmentId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_environment(
    environmentId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "UpdateEnvironment",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("environmentId" => environmentId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_environment_membership(environment_id, permissions, user_arn)
    update_environment_membership(environment_id, permissions, user_arn, params::Dict{String,<:Any})

Changes the settings of an existing environment member for an Cloud9 development
environment.

# Arguments
- `environment_id`: The ID of the environment for the environment member whose settings you
  want to change.
- `permissions`: The replacement type of environment member permissions you want to
  associate with this environment member. Available values include:    read-only: Has
  read-only access to the environment.    read-write: Has read-write access to the
  environment.
- `user_arn`: The Amazon Resource Name (ARN) of the environment member whose settings you
  want to change.

"""
function update_environment_membership(
    environmentId, permissions, userArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return cloud9(
        "UpdateEnvironmentMembership",
        Dict{String,Any}(
            "environmentId" => environmentId,
            "permissions" => permissions,
            "userArn" => userArn,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_environment_membership(
    environmentId,
    permissions,
    userArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return cloud9(
        "UpdateEnvironmentMembership",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "environmentId" => environmentId,
                    "permissions" => permissions,
                    "userArn" => userArn,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
