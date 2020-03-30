include("../AWSServices.jl")
using .AWSServices: appconfig

"""
    GetDeploymentStrategy()

Retrieve information about a deployment strategy. A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.

Required Parameters
{
  "DeploymentStrategyId": "The ID of the deployment strategy to get."
}
"""
GetDeploymentStrategy(args) = appconfig("GET", "/deploymentstrategies/{DeploymentStrategyId}", args)

"""
    ListTagsForResource()

Retrieves the list of key-value tags assigned to the resource.

Required Parameters
{
  "ResourceArn": "The resource ARN."
}
"""
ListTagsForResource(args) = appconfig("GET", "/tags/{ResourceArn}", args)

"""
    StopDeployment()

Stops a deployment. This API action works only on deployments that have a status of DEPLOYING. This action moves the deployment to a status of ROLLED_BACK.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "EnvironmentId": "The environment ID.",
  "DeploymentNumber": "The sequence number of the deployment."
}
"""
StopDeployment(args) = appconfig("DELETE", "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}", args)

"""
    CreateDeploymentStrategy()

A deployment strategy defines important criteria for rolling out your configuration to the designated targets. A deployment strategy includes: the overall duration required, a percentage of targets to receive the deployment during each interval, an algorithm that defines how percentage grows, and bake time.

Required Parameters
{
  "DeploymentDurationInMinutes": "Total amount of time for a deployment to last.",
  "GrowthFactor": "The percentage of targets to receive a deployed configuration during each interval.",
  "Name": "A name for the deployment strategy.",
  "ReplicateTo": "Save the deployment strategy to a Systems Manager (SSM) document."
}

Optional Parameters
{
  "Description": "A description of the deployment strategy.",
  "FinalBakeTimeInMinutes": "The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.",
  "Tags": "Metadata to assign to the deployment strategy. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.",
  "GrowthType": "The algorithm used to define how percentage grows over time. AWS AppConfig supports the following growth types:  Linear: For this type, AppConfig processes the deployment by dividing the total number of targets by the value specified for Step percentage. For example, a linear deployment that uses a Step percentage of 10 deploys the configuration to 10 percent of the hosts. After those deployments are complete, the system deploys the configuration to the next 10 percent. This continues until 100% of the targets have successfully received the configuration.  Exponential: For this type, AppConfig processes the deployment exponentially using the following formula: G*(2^N). In this formula, G is the growth factor specified by the user and N is the number of steps until the configuration is deployed to all targets. For example, if you specify a growth factor of 2, then the system rolls out the configuration as follows:  2*(2^0)   2*(2^1)   2*(2^2)  Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and continues until the configuration has been deployed to all targets."
}
"""
CreateDeploymentStrategy(args) = appconfig("POST", "/deploymentstrategies", args)

"""
    DeleteDeploymentStrategy()

Delete a deployment strategy. Deleting a deployment strategy does not delete a configuration from a host.

Required Parameters
{
  "DeploymentStrategyId": "The ID of the deployment strategy you want to delete."
}
"""
DeleteDeploymentStrategy(args) = appconfig("DELETE", "/deployementstrategies/{DeploymentStrategyId}", args)

"""
    StartDeployment()

Starts a deployment.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "DeploymentStrategyId": "The deployment strategy ID.",
  "ConfigurationVersion": "The configuration version to deploy.",
  "ConfigurationProfileId": "The configuration profile ID.",
  "EnvironmentId": "The environment ID."
}

Optional Parameters
{
  "Description": "A description of the deployment.",
  "Tags": "Metadata to assign to the deployment. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define."
}
"""
StartDeployment(args) = appconfig("POST", "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments", args)

"""
    GetApplication()

Retrieve information about an application.

Required Parameters
{
  "ApplicationId": "The ID of the application you want to get."
}
"""
GetApplication(args) = appconfig("GET", "/applications/{ApplicationId}", args)

"""
    UpdateDeploymentStrategy()

Updates a deployment strategy.

Required Parameters
{
  "DeploymentStrategyId": "The deployment strategy ID."
}

Optional Parameters
{
  "Description": "A description of the deployment strategy.",
  "FinalBakeTimeInMinutes": "The amount of time AppConfig monitors for alarms before considering the deployment to be complete and no longer eligible for automatic roll back.",
  "DeploymentDurationInMinutes": "Total amount of time for a deployment to last.",
  "GrowthFactor": "The percentage of targets to receive a deployed configuration during each interval.",
  "GrowthType": "The algorithm used to define how percentage grows over time. AWS AppConfig supports the following growth types:  Linear: For this type, AppConfig processes the deployment by increments of the growth factor evenly distributed over the deployment time. For example, a linear deployment that uses a growth factor of 20 initially makes the configuration available to 20 percent of the targets. After 1/5th of the deployment time has passed, the system updates the percentage to 40 percent. This continues until 100% of the targets are set to receive the deployed configuration.  Exponential: For this type, AppConfig processes the deployment exponentially using the following formula: G*(2^N). In this formula, G is the growth factor specified by the user and N is the number of steps until the configuration is deployed to all targets. For example, if you specify a growth factor of 2, then the system rolls out the configuration as follows:  2*(2^0)   2*(2^1)   2*(2^2)  Expressed numerically, the deployment rolls out as follows: 2% of the targets, 4% of the targets, 8% of the targets, and continues until the configuration has been deployed to all targets."
}
"""
UpdateDeploymentStrategy(args) = appconfig("PATCH", "/deploymentstrategies/{DeploymentStrategyId}", args)

"""
    DeleteApplication()

Delete an application. Deleting an application does not delete a configuration from a host.

Required Parameters
{
  "ApplicationId": "The ID of the application to delete."
}
"""
DeleteApplication(args) = appconfig("DELETE", "/applications/{ApplicationId}", args)

"""
    GetDeployment()

Retrieve information about a configuration deployment.

Required Parameters
{
  "ApplicationId": "The ID of the application that includes the deployment you want to get. ",
  "EnvironmentId": "The ID of the environment that includes the deployment you want to get. ",
  "DeploymentNumber": "The sequence number of the deployment."
}
"""
GetDeployment(args) = appconfig("GET", "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments/{DeploymentNumber}", args)

"""
    CreateEnvironment()

For each application, you define one or more environments. An environment is a logical deployment group of AppConfig targets, such as applications in a Beta or Production environment. You can also define environments for application subcomponents such as the Web, Mobile and Back-end components for your application. You can configure Amazon CloudWatch alarms for each environment. The system monitors alarms during a configuration deployment. If an alarm is triggered, the system rolls back the configuration.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "Name": "A name for the environment."
}

Optional Parameters
{
  "Description": "A description of the environment.",
  "Tags": "Metadata to assign to the environment. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.",
  "Monitors": "Amazon CloudWatch alarms to monitor during the deployment process."
}
"""
CreateEnvironment(args) = appconfig("POST", "/applications/{ApplicationId}/environments", args)

"""
    GetEnvironment()

Retrieve information about an environment. An environment is a logical deployment group of AppConfig applications, such as applications in a Production environment or in an EU_Region environment. Each configuration deployment targets an environment. You can enable one or more Amazon CloudWatch alarms for an environment. If an alarm is triggered during a deployment, AppConfig roles back the configuration.

Required Parameters
{
  "ApplicationId": "The ID of the application that includes the environment you want to get.",
  "EnvironmentId": "The ID of the environment you wnat to get."
}
"""
GetEnvironment(args) = appconfig("GET", "/applications/{ApplicationId}/environments/{EnvironmentId}", args)

"""
    CreateApplication()

An application in AppConfig is a logical unit of code that provides capabilities for your customers. For example, an application can be a microservice that runs on Amazon EC2 instances, a mobile application installed by your users, a serverless application using Amazon API Gateway and AWS Lambda, or any system you run on behalf of others.

Required Parameters
{
  "Name": "A name for the application."
}

Optional Parameters
{
  "Description": "A description of the application.",
  "Tags": "Metadata to assign to the application. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define."
}
"""
CreateApplication(args) = appconfig("POST", "/applications", args)

"""
    UpdateApplication()

Updates an application.

Required Parameters
{
  "ApplicationId": "The application ID."
}

Optional Parameters
{
  "Description": "A description of the application.",
  "Name": "The name of the application."
}
"""
UpdateApplication(args) = appconfig("PATCH", "/applications/{ApplicationId}", args)

"""
    DeleteConfigurationProfile()

Delete a configuration profile. Deleting a configuration profile does not delete a configuration from a host.

Required Parameters
{
  "ApplicationId": "The application ID that includes the configuration profile you want to delete.",
  "ConfigurationProfileId": "The ID of the configuration profile you want to delete."
}
"""
DeleteConfigurationProfile(args) = appconfig("DELETE", "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}", args)

"""
    ValidateConfiguration()

Uses the validators in a configuration profile to validate a configuration.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "ConfigurationVersion": "The version of the configuration to validate.",
  "ConfigurationProfileId": "The configuration profile ID."
}
"""
ValidateConfiguration(args) = appconfig("POST", "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}/validators", args)

"""
    ListDeploymentStrategies()

List deployment strategies.

Optional Parameters
{
  "MaxResults": "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.",
  "NextToken": "A token to start the list. Use this token to get the next set of results."
}
"""
ListDeploymentStrategies() = appconfig("GET", "/deploymentstrategies")
ListDeploymentStrategies(args) = appconfig("GET", "/deploymentstrategies", args)

"""
    TagResource()

Metadata to assign to an AppConfig resource. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define. You can specify a maximum of 50 tags for a resource.

Required Parameters
{
  "ResourceArn": "The ARN of the resource for which to retrieve tags.",
  "Tags": "The key-value string map. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up to 128 characters and must not start with aws:. The tag value can be up to 256 characters."
}
"""
TagResource(args) = appconfig("POST", "/tags/{ResourceArn}", args)

"""
    UntagResource()

Deletes a tag key and value from an AppConfig resource.

Required Parameters
{
  "ResourceArn": "The ARN of the resource for which to remove tags.",
  "TagKeys": "The tag keys to delete."
}
"""
UntagResource(args) = appconfig("DELETE", "/tags/{ResourceArn}", args)

"""
    GetConfiguration()

Retrieve information about a configuration.

Required Parameters
{
  "Application": "The application to get. Specify either the application name or the application ID.",
  "Environment": "The environment to get. Specify either the environment name or the environment ID.",
  "Configuration": "The configuration to get. Specify either the configuration name or the configuration ID.",
  "ClientId": "A unique ID to identify the client for the configuration. This ID enables AppConfig to deploy the configuration in intervals, as defined in the deployment strategy."
}

Optional Parameters
{
  "ClientConfigurationVersion": "The configuration version returned in the most recent GetConfiguration response."
}
"""
GetConfiguration(args) = appconfig("GET", "/applications/{Application}/environments/{Environment}/configurations/{Configuration}", args)

"""
    DeleteEnvironment()

Delete an environment. Deleting an environment does not delete a configuration from a host.

Required Parameters
{
  "ApplicationId": "The application ID that includes the environment you want to delete.",
  "EnvironmentId": "The ID of the environment you want to delete."
}
"""
DeleteEnvironment(args) = appconfig("DELETE", "/applications/{ApplicationId}/environments/{EnvironmentId}", args)

"""
    ListEnvironments()

List the environments for an application.

Required Parameters
{
  "ApplicationId": "The application ID."
}

Optional Parameters
{
  "MaxResults": "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.",
  "NextToken": "A token to start the list. Use this token to get the next set of results."
}
"""
ListEnvironments(args) = appconfig("GET", "/applications/{ApplicationId}/environments", args)

"""
    ListApplications()

List all applications in your AWS account.

Optional Parameters
{
  "MaxResults": "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.",
  "NextToken": "A token to start the list. Use this token to get the next set of results."
}
"""
ListApplications() = appconfig("GET", "/applications")
ListApplications(args) = appconfig("GET", "/applications", args)

"""
    UpdateEnvironment()

Updates an environment.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "EnvironmentId": "The environment ID."
}

Optional Parameters
{
  "Description": "A description of the environment.",
  "Monitors": "Amazon CloudWatch alarms to monitor during the deployment process.",
  "Name": "The name of the environment."
}
"""
UpdateEnvironment(args) = appconfig("PATCH", "/applications/{ApplicationId}/environments/{EnvironmentId}", args)

"""
    GetConfigurationProfile()

Retrieve information about a configuration profile.

Required Parameters
{
  "ApplicationId": "The ID of the application that includes the configuration profile you want to get.",
  "ConfigurationProfileId": "The ID of the configuration profile you want to get."
}
"""
GetConfigurationProfile(args) = appconfig("GET", "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}", args)

"""
    CreateConfigurationProfile()

Information that enables AppConfig to access the configuration source. Valid configuration sources include Systems Manager (SSM) documents, SSM Parameter Store parameters, and Amazon S3 objects. A configuration profile includes the following information.   The Uri location of the configuration data.   The AWS Identity and Access Management (IAM) role that provides access to the configuration data.   A validator for the configuration data. Available validators include either a JSON Schema or an AWS Lambda function.   For more information, see Create a Configuration and a Configuration Profile in the AWS AppConfig User Guide.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "LocationUri": "A URI to locate the configuration. You can specify a Systems Manager (SSM) document, an SSM Parameter Store parameter, or an Amazon S3 object. For an SSM document, specify either the document name in the format ssm-document://&lt;Document_name&gt; or the Amazon Resource Name (ARN). For a parameter, specify either the parameter name in the format ssm-parameter://&lt;Parameter_name&gt; or the ARN. For an Amazon S3 object, specify the URI in the following format: s3://&lt;bucket&gt;/&lt;objectKey&gt; . Here is an example: s3://my-bucket/my-app/us-east-1/my-config.json",
  "Name": "A name for the configuration profile.",
  "RetrievalRoleArn": "The ARN of an IAM role with permission to access the configuration at the specified LocationUri."
}

Optional Parameters
{
  "Description": "A description of the configuration profile.",
  "Tags": "Metadata to assign to the configuration profile. Tags help organize and categorize your AppConfig resources. Each tag consists of a key and an optional value, both of which you define.",
  "Validators": "A list of methods for validating the configuration."
}
"""
CreateConfigurationProfile(args) = appconfig("POST", "/applications/{ApplicationId}/configurationprofiles", args)

"""
    ListConfigurationProfiles()

Lists the configuration profiles for an application.

Required Parameters
{
  "ApplicationId": "The application ID."
}

Optional Parameters
{
  "MaxResults": "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.",
  "NextToken": "A token to start the list. Use this token to get the next set of results."
}
"""
ListConfigurationProfiles(args) = appconfig("GET", "/applications/{ApplicationId}/configurationprofiles", args)

"""
    ListDeployments()

Lists the deployments for an environment.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "EnvironmentId": "The environment ID."
}

Optional Parameters
{
  "MaxResults": "The maximum number of items to return for this call. The call also returns a token that you can specify in a subsequent call to get the next set of results.",
  "NextToken": "A token to start the list. Use this token to get the next set of results."
}
"""
ListDeployments(args) = appconfig("GET", "/applications/{ApplicationId}/environments/{EnvironmentId}/deployments", args)

"""
    UpdateConfigurationProfile()

Updates a configuration profile.

Required Parameters
{
  "ApplicationId": "The application ID.",
  "ConfigurationProfileId": "The ID of the configuration profile."
}

Optional Parameters
{
  "Description": "A description of the configuration profile.",
  "Validators": "A list of methods for validating the configuration.",
  "Name": "The name of the configuration profile.",
  "RetrievalRoleArn": "The ARN of an IAM role with permission to access the configuration at the specified LocationUri."
}
"""
UpdateConfigurationProfile(args) = appconfig("PATCH", "/applications/{ApplicationId}/configurationprofiles/{ConfigurationProfileId}", args)
