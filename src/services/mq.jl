# This file is auto-generated by AWSMetadata.jl
include("../AWSServices.jl")
using .AWSServices: mq

"""
    CreateBroker()

Creates a broker. Note: This API is asynchronous.

Optional Parameters
{
  "AutoMinorVersionUpgrade": "Required. Enables automatic upgrades to new minor versions for brokers, as Apache releases the versions. The automatic upgrades occur during the maintenance window of the broker or after a manual broker reboot.",
  "BrokerName": "Required. The name of the broker. This value must be unique in your AWS account, 1-50 characters long, must contain only letters, numbers, dashes, and underscores, and must not contain whitespaces, brackets, wildcard characters, or special characters.",
  "Configuration": "A list of information about the configuration.",
  "CreatorRequestId": "The unique ID that the requester receives for the created broker. Amazon MQ passes your ID with the API action. Note: We recommend using a Universally Unique Identifier (UUID) for the creatorRequestId. You may omit the creatorRequestId if your application doesn't require idempotency.",
  "DeploymentMode": "Required. The deployment mode of the broker.",
  "EncryptionOptions": "Encryption options for the broker.",
  "EngineType": "Required. The type of broker engine. Note: Currently, Amazon MQ supports only ACTIVEMQ.",
  "EngineVersion": "Required. The version of the broker engine. For a list of supported engine versions, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html",
  "HostInstanceType": "Required. The broker's instance type.",
  "Logs": "Enables Amazon CloudWatch logging for brokers.",
  "MaintenanceWindowStartTime": "The parameters that determine the WeeklyStartTime.",
  "PubliclyAccessible": "Required. Enables connections from applications outside of the VPC that hosts the broker's subnets.",
  "SecurityGroups": "The list of security groups (1 minimum, 5 maximum) that authorizes connections to brokers.",
  "StorageType": "The broker's storage type.",
  "SubnetIds": "The list of groups (2 maximum) that define which subnets and IP ranges the broker can use from different Availability Zones. A SINGLE_INSTANCE deployment requires one subnet (for example, the default subnet). An ACTIVE_STANDBY_MULTI_AZ deployment requires two subnets.",
  "Tags": "Create tags when creating the broker.",
  "Users": "Required. The list of ActiveMQ users (persons or applications) who can access queues and topics. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long."
}
"""
CreateBroker() = mq("POST", "/v1/brokers")
CreateBroker(args) = mq("POST", "/v1/brokers", args)

"""
    CreateConfiguration()

Creates a new configuration for the specified configuration name. Amazon MQ uses the default configuration (the engine type and version).

Optional Parameters
{
  "EngineType": "Required. The type of broker engine. Note: Currently, Amazon MQ supports only ACTIVEMQ.",
  "EngineVersion": "Required. The version of the broker engine. For a list of supported engine versions, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html",
  "Name": "Required. The name of the configuration. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 1-150 characters long.",
  "Tags": "Create tags when creating the configuration."
}
"""
CreateConfiguration() = mq("POST", "/v1/configurations")
CreateConfiguration(args) = mq("POST", "/v1/configurations", args)

"""
    CreateTags()

Add a tag to a resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource tag."
}

Optional Parameters
{
  "Tags": "The key-value pair for the resource tag."
}
"""
CreateTags(args) = mq("POST", "/v1/tags/{resource-arn}", args)

"""
    CreateUser()

Creates an ActiveMQ user.

Required Parameters
{
  "BrokerId": "The unique ID that Amazon MQ generates for the broker.",
  "Username": "The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long."
}

Optional Parameters
{
  "ConsoleAccess": "Enables access to the the ActiveMQ Web Console for the ActiveMQ user.",
  "Groups": "The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.",
  "Password": "Required. The password of the user. This value must be at least 12 characters long, must contain at least 4 unique characters, and must not contain commas."
}
"""
CreateUser(args) = mq("POST", "/v1/brokers/{broker-id}/users/{username}", args)

"""
    DeleteBroker()

Deletes a broker. Note: This API is asynchronous.

Required Parameters
{
  "BrokerId": "The name of the broker. This value must be unique in your AWS account, 1-50 characters long, must contain only letters, numbers, dashes, and underscores, and must not contain whitespaces, brackets, wildcard characters, or special characters."
}
"""
DeleteBroker(args) = mq("DELETE", "/v1/brokers/{broker-id}", args)

"""
    DeleteTags()

Removes a tag from a resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource tag.",
  "TagKeys": "An array of tag keys to delete"
}
"""
DeleteTags(args) = mq("DELETE", "/v1/tags/{resource-arn}", args)

"""
    DeleteUser()

Deletes an ActiveMQ user.

Required Parameters
{
  "BrokerId": "The unique ID that Amazon MQ generates for the broker.",
  "Username": "The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long."
}
"""
DeleteUser(args) = mq("DELETE", "/v1/brokers/{broker-id}/users/{username}", args)

"""
    DescribeBroker()

Returns information about the specified broker.

Required Parameters
{
  "BrokerId": "The name of the broker. This value must be unique in your AWS account, 1-50 characters long, must contain only letters, numbers, dashes, and underscores, and must not contain whitespaces, brackets, wildcard characters, or special characters."
}
"""
DescribeBroker(args) = mq("GET", "/v1/brokers/{broker-id}", args)

"""
    DescribeBrokerEngineTypes()

Describe available engine types and versions.

Optional Parameters
{
  "EngineType": "Filter response by engine type.",
  "MaxResults": "The maximum number of engine types that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.",
  "NextToken": "The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty."
}
"""
DescribeBrokerEngineTypes() = mq("GET", "/v1/broker-engine-types")
DescribeBrokerEngineTypes(args) = mq("GET", "/v1/broker-engine-types", args)

"""
    DescribeBrokerInstanceOptions()

Describe available broker instance options.

Optional Parameters
{
  "EngineType": "Filter response by engine type.",
  "HostInstanceType": "Filter response by host instance type.",
  "MaxResults": "The maximum number of instance options that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.",
  "NextToken": "The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty.",
  "StorageType": "Filter response by storage type."
}
"""
DescribeBrokerInstanceOptions() = mq("GET", "/v1/broker-instance-options")
DescribeBrokerInstanceOptions(args) = mq("GET", "/v1/broker-instance-options", args)

"""
    DescribeConfiguration()

Returns information about the specified configuration.

Required Parameters
{
  "ConfigurationId": "The unique ID that Amazon MQ generates for the configuration."
}
"""
DescribeConfiguration(args) = mq("GET", "/v1/configurations/{configuration-id}", args)

"""
    DescribeConfigurationRevision()

Returns the specified configuration revision for the specified configuration.

Required Parameters
{
  "ConfigurationId": "The unique ID that Amazon MQ generates for the configuration.",
  "ConfigurationRevision": "The revision of the configuration."
}
"""
DescribeConfigurationRevision(args) = mq("GET", "/v1/configurations/{configuration-id}/revisions/{configuration-revision}", args)

"""
    DescribeUser()

Returns information about an ActiveMQ user.

Required Parameters
{
  "BrokerId": "The unique ID that Amazon MQ generates for the broker.",
  "Username": "The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long."
}
"""
DescribeUser(args) = mq("GET", "/v1/brokers/{broker-id}/users/{username}", args)

"""
    ListBrokers()

Returns a list of all brokers.

Optional Parameters
{
  "MaxResults": "The maximum number of brokers that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.",
  "NextToken": "The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty."
}
"""
ListBrokers() = mq("GET", "/v1/brokers")
ListBrokers(args) = mq("GET", "/v1/brokers", args)

"""
    ListConfigurationRevisions()

Returns a list of all revisions for the specified configuration.

Required Parameters
{
  "ConfigurationId": "The unique ID that Amazon MQ generates for the configuration."
}

Optional Parameters
{
  "MaxResults": "The maximum number of configurations that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.",
  "NextToken": "The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty."
}
"""
ListConfigurationRevisions(args) = mq("GET", "/v1/configurations/{configuration-id}/revisions", args)

"""
    ListConfigurations()

Returns a list of all configurations.

Optional Parameters
{
  "MaxResults": "The maximum number of configurations that Amazon MQ can return per page (20 by default). This value must be an integer from 5 to 100.",
  "NextToken": "The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty."
}
"""
ListConfigurations() = mq("GET", "/v1/configurations")
ListConfigurations(args) = mq("GET", "/v1/configurations", args)

"""
    ListTags()

Lists tags for a resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource tag."
}
"""
ListTags(args) = mq("GET", "/v1/tags/{resource-arn}", args)

"""
    ListUsers()

Returns a list of all ActiveMQ users.

Required Parameters
{
  "BrokerId": "The unique ID that Amazon MQ generates for the broker."
}

Optional Parameters
{
  "MaxResults": "The maximum number of ActiveMQ users that can be returned per page (20 by default). This value must be an integer from 5 to 100.",
  "NextToken": "The token that specifies the next page of results Amazon MQ should return. To request the first page, leave nextToken empty."
}
"""
ListUsers(args) = mq("GET", "/v1/brokers/{broker-id}/users", args)

"""
    RebootBroker()

Reboots a broker. Note: This API is asynchronous.

Required Parameters
{
  "BrokerId": "The unique ID that Amazon MQ generates for the broker."
}
"""
RebootBroker(args) = mq("POST", "/v1/brokers/{broker-id}/reboot", args)

"""
    UpdateBroker()

Adds a pending configuration change to a broker.

Required Parameters
{
  "BrokerId": "The name of the broker. This value must be unique in your AWS account, 1-50 characters long, must contain only letters, numbers, dashes, and underscores, and must not contain whitespaces, brackets, wildcard characters, or special characters."
}

Optional Parameters
{
  "AutoMinorVersionUpgrade": "Enables automatic upgrades to new minor versions for brokers, as Apache releases the versions. The automatic upgrades occur during the maintenance window of the broker or after a manual broker reboot.",
  "Configuration": "A list of information about the configuration.",
  "EngineVersion": "The version of the broker engine. For a list of supported engine versions, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide/broker-engine.html",
  "HostInstanceType": "The host instance type of the broker to upgrade to. For a list of supported instance types, see https://docs.aws.amazon.com/amazon-mq/latest/developer-guide//broker.html#broker-instance-types",
  "Logs": "Enables Amazon CloudWatch logging for brokers.",
  "SecurityGroups": "The list of security groups (1 minimum, 5 maximum) that authorizes connections to brokers."
}
"""
UpdateBroker(args) = mq("PUT", "/v1/brokers/{broker-id}", args)

"""
    UpdateConfiguration()

Updates the specified configuration.

Required Parameters
{
  "ConfigurationId": "The unique ID that Amazon MQ generates for the configuration."
}

Optional Parameters
{
  "Data": "Required. The base64-encoded XML configuration.",
  "Description": "The description of the configuration."
}
"""
UpdateConfiguration(args) = mq("PUT", "/v1/configurations/{configuration-id}", args)

"""
    UpdateUser()

Updates the information for an ActiveMQ user.

Required Parameters
{
  "BrokerId": "The unique ID that Amazon MQ generates for the broker.",
  "Username": "Required. The username of the ActiveMQ user. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long."
}

Optional Parameters
{
  "ConsoleAccess": "Enables access to the the ActiveMQ Web Console for the ActiveMQ user.",
  "Groups": "The list of groups (20 maximum) to which the ActiveMQ user belongs. This value can contain only alphanumeric characters, dashes, periods, underscores, and tildes (- . _ ~). This value must be 2-100 characters long.",
  "Password": "The password of the user. This value must be at least 12 characters long, must contain at least 4 unique characters, and must not contain commas."
}
"""
UpdateUser(args) = mq("PUT", "/v1/brokers/{broker-id}/users/{username}", args)
