include("../AWSServices.jl")
using .AWSServices: imagebuilder

"""
    ListTagsForResource()

 Returns the list of tags for the specified resource. 

Required Parameters
{
  "resourceArn": " The Amazon Resource Name (ARN) of the resource whose tags you want to retrieve. "
}
"""
ListTagsForResource(args) = imagebuilder("GET", "/tags/{resourceArn}", args)

"""
    CreateInfrastructureConfiguration()

 Creates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. 

Required Parameters
{
  "name": " The name of the infrastructure configuration. ",
  "instanceProfileName": " The instance profile to associate with the instance used to customize your EC2 AMI. ",
  "clientToken": " The idempotency token used to make this request idempotent. "
}

Optional Parameters
{
  "keyPair": " The key pair of the infrastructure configuration. This can be used to log on to and debug the instance used to create your image. ",
  "logging": " The logging configuration of the infrastructure configuration. ",
  "instanceTypes": " The instance types of the infrastructure configuration. You can specify one or more instance types to use for this build. The service will pick one of these instance types based on availability. ",
  "terminateInstanceOnFailure": " The terminate instance on failure setting of the infrastructure configuration. Set to false if you want Image Builder to retain the instance used to configure your AMI if the build or test phase of your workflow fails. ",
  "securityGroupIds": " The security group IDs to associate with the instance used to customize your EC2 AMI. ",
  "tags": " The tags of the infrastructure configuration. ",
  "description": " The description of the infrastructure configuration. ",
  "subnetId": " The subnet ID in which to place the instance used to customize your EC2 AMI. ",
  "snsTopicArn": " The SNS topic on which to send image build events. "
}
"""
CreateInfrastructureConfiguration(args) = imagebuilder("PUT", "/CreateInfrastructureConfiguration", args)

"""
    DeleteInfrastructureConfiguration()

 Deletes an infrastructure configuration. 

Required Parameters
{
  "infrastructureConfigurationArn": " The Amazon Resource Name (ARN) of the infrastructure configuration to delete. "
}
"""
DeleteInfrastructureConfiguration(args) = imagebuilder("DELETE", "/DeleteInfrastructureConfiguration", args)

"""
    ListComponents()

Returns the list of component build versions for the specified semantic version. 

Optional Parameters
{
  "filters": " The filters. ",
  "owner": " The owner defines which components you want to list. By default, this request will only show components owned by your account. You can use this field to specify if you want to view components owned by yourself, by Amazon, or those components that have been shared with you by other customers. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListComponents() = imagebuilder("POST", "/ListComponents")
ListComponents(args) = imagebuilder("POST", "/ListComponents", args)

"""
    GetInfrastructureConfiguration()

 Gets an infrastructure configuration. 

Required Parameters
{
  "infrastructureConfigurationArn": "The Amazon Resource Name (ARN) of the infrastructure configuration that you want to retrieve. "
}
"""
GetInfrastructureConfiguration(args) = imagebuilder("GET", "/GetInfrastructureConfiguration", args)

"""
    ListImages()

 Returns the list of image build versions for the specified semantic version. 

Optional Parameters
{
  "filters": " The filters. ",
  "owner": " The owner defines which images you want to list. By default, this request will only show images owned by your account. You can use this field to specify if you want to view images owned by yourself, by Amazon, or those images that have been shared with you by other customers. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListImages() = imagebuilder("POST", "/ListImages")
ListImages(args) = imagebuilder("POST", "/ListImages", args)

"""
    CreateImagePipeline()

 Creates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. 

Required Parameters
{
  "name": " The name of the image pipeline. ",
  "imageRecipeArn": " The Amazon Resource Name (ARN) of the image recipe that will be used to configure images created by this image pipeline. ",
  "clientToken": " The idempotency token used to make this request idempotent. ",
  "infrastructureConfigurationArn": " The Amazon Resource Name (ARN) of the infrastructure configuration that will be used to build images created by this image pipeline. "
}

Optional Parameters
{
  "imageTestsConfiguration": " The image test configuration of the image pipeline. ",
  "distributionConfigurationArn": " The Amazon Resource Name (ARN) of the distribution configuration that will be used to configure and distribute images created by this image pipeline. ",
  "status": " The status of the image pipeline. ",
  "tags": " The tags of the image pipeline. ",
  "description": " The description of the image pipeline. ",
  "schedule": " The schedule of the image pipeline. "
}
"""
CreateImagePipeline(args) = imagebuilder("PUT", "/CreateImagePipeline", args)

"""
    GetImage()

 Gets an image. 

Required Parameters
{
  "imageBuildVersionArn": " The Amazon Resource Name (ARN) of the image that you want to retrieve. "
}
"""
GetImage(args) = imagebuilder("GET", "/GetImage", args)

"""
    CreateImageRecipe()

 Creates a new image recipe. Image recipes define how images are configured, tested, and assessed. 

Required Parameters
{
  "semanticVersion": " The semantic version of the image recipe. ",
  "name": " The name of the image recipe. ",
  "clientToken": " The idempotency token used to make this request idempotent. ",
  "components": " The components of the image recipe. ",
  "parentImage": " The parent image of the image recipe. "
}

Optional Parameters
{
  "blockDeviceMappings": " The block device mappings of the image recipe. ",
  "tags": " The tags of the image recipe. ",
  "description": " The description of the image recipe. "
}
"""
CreateImageRecipe(args) = imagebuilder("PUT", "/CreateImageRecipe", args)

"""
    ImportComponent()

Imports a component and transforms its data into a component document. 

Required Parameters
{
  "semanticVersion": "The semantic version of the component. This version follows the semantic version syntax. For example, major.minor.patch. This could be versioned like software (2.0.1) or like a date (2019.12.01).",
  "name": " The name of the component. ",
  "format": " The format of the resource that you want to import as a component. ",
  "clientToken": " The idempotency token of the component. ",
  "platform": " The platform of the component. ",
  "type": "The type of the component denotes whether the component is used to build the image or only to test it. "
}

Optional Parameters
{
  "uri": "The uri of the component. Must be an S3 URL and the requester must have permission to access the S3 bucket. If you use S3, you can specify component content up to your service quota. Either data or uri can be used to specify the data within the component. ",
  "data": "The data of the component. Used to specify the data inline. Either data or uri can be used to specify the data within the component.",
  "changeDescription": " The change description of the component. Describes what change has been made in this version, or what makes this version different from other versions of this component. ",
  "tags": " The tags of the component. ",
  "description": "The description of the component. Describes the contents of the component. ",
  "kmsKeyId": " The ID of the KMS key that should be used to encrypt this component. "
}
"""
ImportComponent(args) = imagebuilder("PUT", "/ImportComponent", args)

"""
    CreateDistributionConfiguration()

Creates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. 

Required Parameters
{
  "name": " The name of the distribution configuration. ",
  "distributions": " The distributions of the distribution configuration. ",
  "clientToken": " The idempotency token of the distribution configuration. "
}

Optional Parameters
{
  "tags": " The tags of the distribution configuration. ",
  "description": " The description of the distribution configuration. "
}
"""
CreateDistributionConfiguration(args) = imagebuilder("PUT", "/CreateDistributionConfiguration", args)

"""
    ListComponentBuildVersions()

 Returns the list of component build versions for the specified semantic version. 

Required Parameters
{
  "componentVersionArn": " The component version Amazon Resource Name (ARN) whose versions you want to list. "
}

Optional Parameters
{
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListComponentBuildVersions(args) = imagebuilder("POST", "/ListComponentBuildVersions", args)

"""
    ListImageBuildVersions()

 Returns a list of distribution configurations. 

Required Parameters
{
  "imageVersionArn": " The Amazon Resource Name (ARN) of the image whose build versions you want to retrieve. "
}

Optional Parameters
{
  "filters": " The filters. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListImageBuildVersions(args) = imagebuilder("POST", "/ListImageBuildVersions", args)

"""
    PutComponentPolicy()

 Applies a policy to a component. 

Required Parameters
{
  "componentArn": " The Amazon Resource Name (ARN) of the component that this policy should be applied to. ",
  "policy": " The policy to apply. "
}
"""
PutComponentPolicy(args) = imagebuilder("PUT", "/PutComponentPolicy", args)

"""
    GetComponent()

 Gets a component object. 

Required Parameters
{
  "componentBuildVersionArn": " The Amazon Resource Name (ARN) of the component that you want to retrieve. Regex requires \"/ d+ \" suffix."
}
"""
GetComponent(args) = imagebuilder("GET", "/GetComponent", args)

"""
    DeleteImageRecipe()

 Deletes an image recipe. 

Required Parameters
{
  "imageRecipeArn": " The Amazon Resource Name (ARN) of the image recipe to delete. "
}
"""
DeleteImageRecipe(args) = imagebuilder("DELETE", "/DeleteImageRecipe", args)

"""
    CreateImage()

 Creates a new image. This request will create a new image along with all of the configured output resources defined in the distribution configuration. 

Required Parameters
{
  "imageRecipeArn": " The Amazon Resource Name (ARN) of the image recipe that defines how images are configured, tested, and assessed. ",
  "clientToken": " The idempotency token used to make this request idempotent. ",
  "infrastructureConfigurationArn": " The Amazon Resource Name (ARN) of the infrastructure configuration that defines the environment in which your image will be built and tested. "
}

Optional Parameters
{
  "imageTestsConfiguration": " The image tests configuration of the image. ",
  "distributionConfigurationArn": " The Amazon Resource Name (ARN) of the distribution configuration that defines and configures the outputs of your pipeline. ",
  "tags": " The tags of the image. "
}
"""
CreateImage(args) = imagebuilder("PUT", "/CreateImage", args)

"""
    GetImageRecipePolicy()

 Gets an image recipe policy. 

Required Parameters
{
  "imageRecipeArn": " The Amazon Resource Name (ARN) of the image recipe whose policy you want to retrieve. "
}
"""
GetImageRecipePolicy(args) = imagebuilder("GET", "/GetImageRecipePolicy", args)

"""
    StartImagePipelineExecution()

 Manually triggers a pipeline to create an image. 

Required Parameters
{
  "imagePipelineArn": " The Amazon Resource Name (ARN) of the image pipeline that you want to manually invoke. ",
  "clientToken": " The idempotency token used to make this request idempotent. "
}
"""
StartImagePipelineExecution(args) = imagebuilder("PUT", "/StartImagePipelineExecution", args)

"""
    DeleteImagePipeline()

 Deletes an image pipeline. 

Required Parameters
{
  "imagePipelineArn": " The Amazon Resource Name (ARN) of the image pipeline to delete. "
}
"""
DeleteImagePipeline(args) = imagebuilder("DELETE", "/DeleteImagePipeline", args)

"""
    GetComponentPolicy()

 Gets a component policy. 

Required Parameters
{
  "componentArn": " The Amazon Resource Name (ARN) of the component whose policy you want to retrieve. "
}
"""
GetComponentPolicy(args) = imagebuilder("GET", "/GetComponentPolicy", args)

"""
    ListImagePipelines()

Returns a list of image pipelines. 

Optional Parameters
{
  "filters": " The filters. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListImagePipelines() = imagebuilder("POST", "/ListImagePipelines")
ListImagePipelines(args) = imagebuilder("POST", "/ListImagePipelines", args)

"""
    DeleteDistributionConfiguration()

 Deletes a distribution configuration. 

Required Parameters
{
  "distributionConfigurationArn": " The Amazon Resource Name (ARN) of the distribution configuration to delete. "
}
"""
DeleteDistributionConfiguration(args) = imagebuilder("DELETE", "/DeleteDistributionConfiguration", args)

"""
    TagResource()

 Adds a tag to a resource. 

Required Parameters
{
  "resourceArn": " The Amazon Resource Name (ARN) of the resource that you want to tag. ",
  "tags": " The tags to apply to the resource. "
}
"""
TagResource(args) = imagebuilder("POST", "/tags/{resourceArn}", args)

"""
    UntagResource()

 Removes a tag from a resource. 

Required Parameters
{
  "resourceArn": " The Amazon Resource Name (ARN) of the resource that you want to untag. ",
  "tagKeys": " The tag keys to remove from the resource. "
}
"""
UntagResource(args) = imagebuilder("DELETE", "/tags/{resourceArn}", args)

"""
    ListDistributionConfigurations()

 Returns a list of distribution configurations. 

Optional Parameters
{
  "filters": " The filters. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListDistributionConfigurations() = imagebuilder("POST", "/ListDistributionConfigurations")
ListDistributionConfigurations(args) = imagebuilder("POST", "/ListDistributionConfigurations", args)

"""
    GetImagePipeline()

 Gets an image pipeline. 

Required Parameters
{
  "imagePipelineArn": " The Amazon Resource Name (ARN) of the image pipeline that you want to retrieve. "
}
"""
GetImagePipeline(args) = imagebuilder("GET", "/GetImagePipeline", args)

"""
    UpdateInfrastructureConfiguration()

 Updates a new infrastructure configuration. An infrastructure configuration defines the environment in which your image will be built and tested. 

Required Parameters
{
  "instanceProfileName": " The instance profile to associate with the instance used to customize your EC2 AMI. ",
  "clientToken": " The idempotency token used to make this request idempotent. ",
  "infrastructureConfigurationArn": " The Amazon Resource Name (ARN) of the infrastructure configuration that you want to update. "
}

Optional Parameters
{
  "keyPair": " The key pair of the infrastructure configuration. This can be used to log on to and debug the instance used to create your image. ",
  "logging": " The logging configuration of the infrastructure configuration. ",
  "instanceTypes": " The instance types of the infrastructure configuration. You can specify one or more instance types to use for this build. The service will pick one of these instance types based on availability. ",
  "terminateInstanceOnFailure": " The terminate instance on failure setting of the infrastructure configuration. Set to false if you want Image Builder to retain the instance used to configure your AMI if the build or test phase of your workflow fails. ",
  "securityGroupIds": " The security group IDs to associate with the instance used to customize your EC2 AMI. ",
  "description": " The description of the infrastructure configuration. ",
  "subnetId": " The subnet ID to place the instance used to customize your EC2 AMI in. ",
  "snsTopicArn": " The SNS topic on which to send image build events. "
}
"""
UpdateInfrastructureConfiguration(args) = imagebuilder("PUT", "/UpdateInfrastructureConfiguration", args)

"""
    GetImagePolicy()

 Gets an image policy. 

Required Parameters
{
  "imageArn": " The Amazon Resource Name (ARN) of the image whose policy you want to retrieve. "
}
"""
GetImagePolicy(args) = imagebuilder("GET", "/GetImagePolicy", args)

"""
    PutImageRecipePolicy()

 Applies a policy to an image recipe. 

Required Parameters
{
  "imageRecipeArn": " The Amazon Resource Name (ARN) of the image recipe that this policy should be applied to. ",
  "policy": " The policy to apply. "
}
"""
PutImageRecipePolicy(args) = imagebuilder("PUT", "/PutImageRecipePolicy", args)

"""
    ListInfrastructureConfigurations()

 Returns a list of infrastructure configurations. 

Optional Parameters
{
  "filters": " The filters. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListInfrastructureConfigurations() = imagebuilder("POST", "/ListInfrastructureConfigurations")
ListInfrastructureConfigurations(args) = imagebuilder("POST", "/ListInfrastructureConfigurations", args)

"""
    DeleteComponent()

 Deletes a component build version. 

Required Parameters
{
  "componentBuildVersionArn": " The Amazon Resource Name (ARN) of the component build version to delete. "
}
"""
DeleteComponent(args) = imagebuilder("DELETE", "/DeleteComponent", args)

"""
    DeleteImage()

 Deletes an image. 

Required Parameters
{
  "imageBuildVersionArn": " The Amazon Resource Name (ARN) of the image to delete. "
}
"""
DeleteImage(args) = imagebuilder("DELETE", "/DeleteImage", args)

"""
    ListImageRecipes()

 Returns a list of image recipes. 

Optional Parameters
{
  "filters": " The filters. ",
  "owner": " The owner defines which image recipes you want to list. By default, this request will only show image recipes owned by your account. You can use this field to specify if you want to view image recipes owned by yourself, by Amazon, or those image recipes that have been shared with you by other customers. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListImageRecipes() = imagebuilder("POST", "/ListImageRecipes")
ListImageRecipes(args) = imagebuilder("POST", "/ListImageRecipes", args)

"""
    GetDistributionConfiguration()

 Gets a distribution configuration. 

Required Parameters
{
  "distributionConfigurationArn": " The Amazon Resource Name (ARN) of the distribution configuration that you want to retrieve. "
}
"""
GetDistributionConfiguration(args) = imagebuilder("GET", "/GetDistributionConfiguration", args)

"""
    GetImageRecipe()

 Gets an image recipe. 

Required Parameters
{
  "imageRecipeArn": " The Amazon Resource Name (ARN) of the image recipe that you want to retrieve. "
}
"""
GetImageRecipe(args) = imagebuilder("GET", "/GetImageRecipe", args)

"""
    CancelImageCreation()

CancelImageCreation cancels the creation of Image. This operation can only be used on images in a non-terminal state.

Required Parameters
{
  "imageBuildVersionArn": "The Amazon Resource Name (ARN) of the image whose creation you want to cancel.",
  "clientToken": "The idempotency token used to make this request idempotent."
}
"""
CancelImageCreation(args) = imagebuilder("PUT", "/CancelImageCreation", args)

"""
    ListImagePipelineImages()

 Returns a list of images created by the specified pipeline. 

Required Parameters
{
  "imagePipelineArn": " The Amazon Resource Name (ARN) of the image pipeline whose images you want to view. "
}

Optional Parameters
{
  "filters": " The filters. ",
  "maxResults": " The maximum items to return in a request. ",
  "nextToken": " A token to specify where to start paginating. This is the NextToken from a previously truncated response. "
}
"""
ListImagePipelineImages(args) = imagebuilder("POST", "/ListImagePipelineImages", args)

"""
    CreateComponent()

Creates a new component that can be used to build, validate, test, and assess your image.

Required Parameters
{
  "semanticVersion": "The semantic version of the component. This version follows the semantic version syntax. For example, major.minor.patch. This could be versioned like software (2.0.1) or like a date (2019.12.01).",
  "name": "The name of the component.",
  "clientToken": "The idempotency token of the component.",
  "platform": "The platform of the component."
}

Optional Parameters
{
  "uri": "The uri of the component. Must be an S3 URL and the requester must have permission to access the S3 bucket. If you use S3, you can specify component content up to your service quota. Either data or uri can be used to specify the data within the component.",
  "data": "The data of the component. Used to specify the data inline. Either data or uri can be used to specify the data within the component.",
  "changeDescription": "The change description of the component. Describes what change has been made in this version, or what makes this version different from other versions of this component.",
  "tags": "The tags of the component.",
  "description": "The description of the component. Describes the contents of the component.",
  "kmsKeyId": "The ID of the KMS key that should be used to encrypt this component."
}
"""
CreateComponent(args) = imagebuilder("PUT", "/CreateComponent", args)

"""
    PutImagePolicy()

 Applies a policy to an image. 

Required Parameters
{
  "policy": " The policy to apply. ",
  "imageArn": " The Amazon Resource Name (ARN) of the image that this policy should be applied to. "
}
"""
PutImagePolicy(args) = imagebuilder("PUT", "/PutImagePolicy", args)

"""
    UpdateDistributionConfiguration()

 Updates a new distribution configuration. Distribution configurations define and configure the outputs of your pipeline. 

Required Parameters
{
  "distributionConfigurationArn": " The Amazon Resource Name (ARN) of the distribution configuration that you want to update. ",
  "distributions": " The distributions of the distribution configuration. ",
  "clientToken": " The idempotency token of the distribution configuration. "
}

Optional Parameters
{
  "description": " The description of the distribution configuration. "
}
"""
UpdateDistributionConfiguration(args) = imagebuilder("PUT", "/UpdateDistributionConfiguration", args)

"""
    UpdateImagePipeline()

 Updates a new image pipeline. Image pipelines enable you to automate the creation and distribution of images. 

Required Parameters
{
  "imagePipelineArn": " The Amazon Resource Name (ARN) of the image pipeline that you want to update. ",
  "imageRecipeArn": " The Amazon Resource Name (ARN) of the image recipe that will be used to configure images updated by this image pipeline. ",
  "clientToken": " The idempotency token used to make this request idempotent. ",
  "infrastructureConfigurationArn": " The Amazon Resource Name (ARN) of the infrastructure configuration that will be used to build images updated by this image pipeline. "
}

Optional Parameters
{
  "imageTestsConfiguration": " The image test configuration of the image pipeline. ",
  "distributionConfigurationArn": " The Amazon Resource Name (ARN) of the distribution configuration that will be used to configure and distribute images updated by this image pipeline. ",
  "status": " The status of the image pipeline. ",
  "description": " The description of the image pipeline. ",
  "schedule": " The schedule of the image pipeline. "
}
"""
UpdateImagePipeline(args) = imagebuilder("PUT", "/UpdateImagePipeline", args)
