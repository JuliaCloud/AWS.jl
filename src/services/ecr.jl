include("../AWSServices.jl")
using .AWSServices: ecr

"""
    ListTagsForResource()

List the tags for an Amazon ECR resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently, the only supported resource is an Amazon ECR repository."
}
"""
ListTagsForResource(args) = ecr("ListTagsForResource", args)

"""
    CreateRepository()

Creates a repository. For more information, see Amazon ECR Repositories in the Amazon Elastic Container Registry User Guide.

Required Parameters
{
  "repositoryName": "The name to use for the repository. The repository name may be specified on its own (such as nginx-web-app) or it can be prepended with a namespace to group the repository into a category (such as project-a/nginx-web-app)."
}

Optional Parameters
{
  "imageTagMutability": "The tag mutability setting for the repository. If this parameter is omitted, the default setting of MUTABLE will be used which will allow image tags to be overwritten. If IMMUTABLE is specified, all image tags within the repository will be immutable which will prevent them from being overwritten.",
  "tags": "The metadata that you apply to the repository to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters.",
  "imageScanningConfiguration": "The image scanning configuration for the repository. This setting determines whether images are scanned for known vulnerabilities after being pushed to the repository."
}
"""
CreateRepository(args) = ecr("CreateRepository", args)

"""
    DeleteRepository()

Deletes a repository. If the repository contains images, you must either delete all images in the repository or use the force option to delete the repository.

Required Parameters
{
  "repositoryName": "The name of the repository to delete."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository to delete. If you do not specify a registry, the default registry is assumed.",
  "force": " If a repository contains images, forces the deletion."
}
"""
DeleteRepository(args) = ecr("DeleteRepository", args)

"""
    DescribeRepositories()

Describes image repositories in a registry.

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repositories to be described. If you do not specify a registry, the default registry is assumed.",
  "repositoryNames": "A list of repositories to describe. If this parameter is omitted, then all repositories in a registry are described.",
  "maxResults": "The maximum number of repository results returned by DescribeRepositories in paginated output. When this parameter is used, DescribeRepositories only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another DescribeRepositories request with the returned nextToken value. This value can be between 1 and 1000. If this parameter is not used, then DescribeRepositories returns up to 100 results and a nextToken value, if applicable. This option cannot be used when you specify repositories with repositoryNames.",
  "nextToken": "The nextToken value returned from a previous paginated DescribeRepositories request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. This value is null when there are no more results to return. This option cannot be used when you specify repositories with repositoryNames.  This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. "
}
"""
DescribeRepositories() = ecr("DescribeRepositories")
DescribeRepositories(args) = ecr("DescribeRepositories", args)

"""
    ListImages()

Lists all the image IDs for the specified repository. You can filter images based on whether or not they are tagged by using the tagStatus filter and specifying either TAGGED, UNTAGGED or ANY. For example, you can filter your results to return only UNTAGGED images and then pipe that result to a BatchDeleteImage operation to delete them. Or, you can filter your results to return only TAGGED images to list all of the tags in your repository.

Required Parameters
{
  "repositoryName": "The repository with image IDs to be listed."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository in which to list images. If you do not specify a registry, the default registry is assumed.",
  "filter": "The filter key and value with which to filter your ListImages results.",
  "maxResults": "The maximum number of image results returned by ListImages in paginated output. When this parameter is used, ListImages only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another ListImages request with the returned nextToken value. This value can be between 1 and 1000. If this parameter is not used, then ListImages returns up to 100 results and a nextToken value, if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated ListImages request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. This value is null when there are no more results to return.  This token should be treated as an opaque identifier that is only used to retrieve the next items in a list and not for other programmatic purposes. "
}
"""
ListImages(args) = ecr("ListImages", args)

"""
    DeleteLifecyclePolicy()

Deletes the lifecycle policy associated with the specified repository.

Required Parameters
{
  "repositoryName": "The name of the repository."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed."
}
"""
DeleteLifecyclePolicy(args) = ecr("DeleteLifecyclePolicy", args)

"""
    GetAuthorizationToken()

Retrieves an authorization token. An authorization token represents your IAM authentication credentials and can be used to access any Amazon ECR registry that your IAM principal has access to. The authorization token is valid for 12 hours. The authorizationToken returned is a base64 encoded string that can be decoded and used in a docker login command to authenticate to a registry. The AWS CLI offers an get-login-password command that simplifies the login process. For more information, see Registry Authentication in the Amazon Elastic Container Registry User Guide.

Optional Parameters
{
  "registryIds": "A list of AWS account IDs that are associated with the registries for which to get AuthorizationData objects. If you do not specify a registry, the default registry is assumed."
}
"""
GetAuthorizationToken() = ecr("GetAuthorizationToken")
GetAuthorizationToken(args) = ecr("GetAuthorizationToken", args)

"""
    GetLifecyclePolicy()

Retrieves the lifecycle policy for the specified repository.

Required Parameters
{
  "repositoryName": "The name of the repository."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed."
}
"""
GetLifecyclePolicy(args) = ecr("GetLifecyclePolicy", args)

"""
    CompleteLayerUpload()

Informs Amazon ECR that the image layer upload has completed for a specified registry, repository name, and upload ID. You can optionally provide a sha256 digest of the image layer for data validation purposes. When an image is pushed, the CompleteLayerUpload API is called once per each new image layer to verify that the upload has completed.  This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images. 

Required Parameters
{
  "repositoryName": "The name of the repository to associate with the image layer.",
  "layerDigests": "The sha256 digest of the image layer.",
  "uploadId": "The upload ID from a previous InitiateLayerUpload operation to associate with the image layer."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry to which to upload layers. If you do not specify a registry, the default registry is assumed."
}
"""
CompleteLayerUpload(args) = ecr("CompleteLayerUpload", args)

"""
    DescribeImages()

Returns metadata about the images in a repository.  Beginning with Docker version 1.9, the Docker client compresses image layers before pushing them to a V2 Docker registry. The output of the docker images command shows the uncompressed image size, so it may return a larger image size than the image sizes returned by DescribeImages. 

Required Parameters
{
  "repositoryName": "The repository that contains the images to describe."
}

Optional Parameters
{
  "imageIds": "The list of image IDs for the requested repository.",
  "registryId": "The AWS account ID associated with the registry that contains the repository in which to describe images. If you do not specify a registry, the default registry is assumed.",
  "filter": "The filter key and value with which to filter your DescribeImages results.",
  "maxResults": "The maximum number of repository results returned by DescribeImages in paginated output. When this parameter is used, DescribeImages only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another DescribeImages request with the returned nextToken value. This value can be between 1 and 1000. If this parameter is not used, then DescribeImages returns up to 100 results and a nextToken value, if applicable. This option cannot be used when you specify images with imageIds.",
  "nextToken": "The nextToken value returned from a previous paginated DescribeImages request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. This value is null when there are no more results to return. This option cannot be used when you specify images with imageIds."
}
"""
DescribeImages(args) = ecr("DescribeImages", args)

"""
    BatchCheckLayerAvailability()

Checks the availability of one or more image layers in a repository. When an image is pushed to a repository, each image layer is checked to verify if it has been uploaded before. If it is, then the image layer is skipped. When an image is pulled from a repository, each image layer is checked once to verify it is available to be pulled.  This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images. 

Required Parameters
{
  "repositoryName": "The name of the repository that is associated with the image layers to check.",
  "layerDigests": "The digests of the image layers to check."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the image layers to check. If you do not specify a registry, the default registry is assumed."
}
"""
BatchCheckLayerAvailability(args) = ecr("BatchCheckLayerAvailability", args)

"""
    GetRepositoryPolicy()

Retrieves the repository policy for the specified repository.

Required Parameters
{
  "repositoryName": "The name of the repository with the policy to retrieve."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed."
}
"""
GetRepositoryPolicy(args) = ecr("GetRepositoryPolicy", args)

"""
    PutImage()

Creates or updates the image manifest and tags associated with an image. When an image is pushed and all new image layers have been uploaded, the PutImage API is called once to create or update the image manifest and tags associated with the image.  This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images. 

Required Parameters
{
  "repositoryName": "The name of the repository in which to put the image.",
  "imageManifest": "The image manifest corresponding to the image to be uploaded."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository in which to put the image. If you do not specify a registry, the default registry is assumed.",
  "imageTag": "The tag to associate with the image. This parameter is required for images that use the Docker Image Manifest V2 Schema 2 or OCI formats."
}
"""
PutImage(args) = ecr("PutImage", args)

"""
    BatchDeleteImage()

Deletes a list of specified images within a repository. Images are specified with either an imageTag or imageDigest. You can remove a tag from an image by specifying the image's tag in your request. When you remove the last tag from an image, the image is deleted from your repository. You can completely delete an image (and all of its tags) by specifying the image's digest in your request.

Required Parameters
{
  "imageIds": "A list of image ID references that correspond to images to delete. The format of the imageIds reference is imageTag=tag or imageDigest=digest.",
  "repositoryName": "The repository that contains the image to delete."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the image to delete. If you do not specify a registry, the default registry is assumed."
}
"""
BatchDeleteImage(args) = ecr("BatchDeleteImage", args)

"""
    PutImageScanningConfiguration()

Updates the image scanning configuration for the specified repository.

Required Parameters
{
  "repositoryName": "The name of the repository in which to update the image scanning configuration setting.",
  "imageScanningConfiguration": "The image scanning configuration for the repository. This setting determines whether images are scanned for known vulnerabilities after being pushed to the repository."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository in which to update the image scanning configuration setting. If you do not specify a registry, the default registry is assumed."
}
"""
PutImageScanningConfiguration(args) = ecr("PutImageScanningConfiguration", args)

"""
    PutImageTagMutability()

Updates the image tag mutability settings for the specified repository. For more information, see Image Tag Mutability in the Amazon Elastic Container Registry User Guide.

Required Parameters
{
  "repositoryName": "The name of the repository in which to update the image tag mutability settings.",
  "imageTagMutability": "The tag mutability setting for the repository. If MUTABLE is specified, image tags can be overwritten. If IMMUTABLE is specified, all image tags within the repository will be immutable which will prevent them from being overwritten."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository in which to update the image tag mutability settings. If you do not specify a registry, the default registry is assumed."
}
"""
PutImageTagMutability(args) = ecr("PutImageTagMutability", args)

"""
    PutLifecyclePolicy()

Creates or updates the lifecycle policy for the specified repository. For more information, see Lifecycle Policy Template.

Required Parameters
{
  "repositoryName": "The name of the repository to receive the policy.",
  "lifecyclePolicyText": "The JSON repository policy text to apply to the repository."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository. If you do&#x2028; not specify a registry, the default registry is assumed."
}
"""
PutLifecyclePolicy(args) = ecr("PutLifecyclePolicy", args)

"""
    StartLifecyclePolicyPreview()

Starts a preview of a lifecycle policy for the specified repository. This allows you to see the results before associating the lifecycle policy with the repository.

Required Parameters
{
  "repositoryName": "The name of the repository to be evaluated."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.",
  "lifecyclePolicyText": "The policy to be evaluated against. If you do not specify a policy, the current policy for the repository is used."
}
"""
StartLifecyclePolicyPreview(args) = ecr("StartLifecyclePolicyPreview", args)

"""
    UploadLayerPart()

Uploads an image layer part to Amazon ECR. When an image is pushed, each new image layer is uploaded in parts. The maximum size of each image layer part can be 20971520 bytes (or about 20MB). The UploadLayerPart API is called once per each new image layer part.  This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images. 

Required Parameters
{
  "repositoryName": "The name of the repository to which you are uploading layer parts.",
  "partFirstByte": "The integer value of the first byte of the layer part.",
  "partLastByte": "The integer value of the last byte of the layer part.",
  "uploadId": "The upload ID from a previous InitiateLayerUpload operation to associate with the layer part upload.",
  "layerPartBlob": "The base64-encoded layer part payload."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry to which you are uploading layer parts. If you do not specify a registry, the default registry is assumed."
}
"""
UploadLayerPart(args) = ecr("UploadLayerPart", args)

"""
    TagResource()

Adds specified tags to a resource with the specified ARN. Existing tags on a resource are not changed if they are not specified in the request parameters.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the the resource to which to add tags. Currently, the only supported resource is an Amazon ECR repository.",
  "tags": "The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have a maximum character length of 128 characters, and tag values can have a maximum length of 256 characters."
}
"""
TagResource(args) = ecr("TagResource", args)

"""
    UntagResource()

Deletes specified tags from a resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource from which to remove tags. Currently, the only supported resource is an Amazon ECR repository.",
  "tagKeys": "The keys of the tags to be removed."
}
"""
UntagResource(args) = ecr("UntagResource", args)

"""
    GetDownloadUrlForLayer()

Retrieves the pre-signed Amazon S3 download URL corresponding to an image layer. You can only get URLs for image layers that are referenced in an image. When an image is pulled, the GetDownloadUrlForLayer API is called once per image layer.  This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images. 

Required Parameters
{
  "layerDigest": "The digest of the image layer to download.",
  "repositoryName": "The name of the repository that is associated with the image layer to download."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the image layer to download. If you do not specify a registry, the default registry is assumed."
}
"""
GetDownloadUrlForLayer(args) = ecr("GetDownloadUrlForLayer", args)

"""
    SetRepositoryPolicy()

Applies a repository policy to the specified repository to control access permissions. For more information, see Amazon ECR Repository Policies in the Amazon Elastic Container Registry User Guide.

Required Parameters
{
  "repositoryName": "The name of the repository to receive the policy.",
  "policyText": "The JSON repository policy text to apply to the repository. For more information, see Amazon ECR Repository Policy Examples in the Amazon Elastic Container Registry User Guide."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.",
  "force": "If the policy you are attempting to set on a repository policy would prevent you from setting another policy in the future, you must force the SetRepositoryPolicy operation. This is intended to prevent accidental repository lock outs."
}
"""
SetRepositoryPolicy(args) = ecr("SetRepositoryPolicy", args)

"""
    DeleteRepositoryPolicy()

Deletes the repository policy associated with the specified repository.

Required Parameters
{
  "repositoryName": "The name of the repository that is associated with the repository policy to delete."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository policy to delete. If you do not specify a registry, the default registry is assumed."
}
"""
DeleteRepositoryPolicy(args) = ecr("DeleteRepositoryPolicy", args)

"""
    StartImageScan()

Starts an image vulnerability scan. An image scan can only be started once per day on an individual image. This limit includes if an image was scanned on initial push. For more information, see Image Scanning in the Amazon Elastic Container Registry User Guide.

Required Parameters
{
  "repositoryName": "The name of the repository that contains the images to scan.",
  "imageId": ""
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository in which to start an image scan request. If you do not specify a registry, the default registry is assumed."
}
"""
StartImageScan(args) = ecr("StartImageScan", args)

"""
    BatchGetImage()

Gets detailed information for an image. Images are specified with either an imageTag or imageDigest. When an image is pulled, the BatchGetImage API is called once to retrieve the image manifest.

Required Parameters
{
  "imageIds": "A list of image ID references that correspond to images to describe. The format of the imageIds reference is imageTag=tag or imageDigest=digest.",
  "repositoryName": "The repository that contains the images to describe."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the images to describe. If you do not specify a registry, the default registry is assumed.",
  "acceptedMediaTypes": "The accepted media types for the request. Valid values: application/vnd.docker.distribution.manifest.v1+json | application/vnd.docker.distribution.manifest.v2+json | application/vnd.oci.image.manifest.v1+json "
}
"""
BatchGetImage(args) = ecr("BatchGetImage", args)

"""
    GetLifecyclePolicyPreview()

Retrieves the results of the lifecycle policy preview request for the specified repository.

Required Parameters
{
  "repositoryName": "The name of the repository."
}

Optional Parameters
{
  "imageIds": "The list of imageIDs to be included.",
  "registryId": "The AWS account ID associated with the registry that contains the repository. If you do not specify a registry, the default registry is assumed.",
  "filter": "An optional parameter that filters results based on image tag status and all tags, if tagged.",
  "maxResults": "The maximum number of repository results returned by GetLifecyclePolicyPreviewRequest in&#x2028; paginated output. When this parameter is used, GetLifecyclePolicyPreviewRequest only returns&#x2028; maxResults results in a single page along with a nextToken&#x2028; response element. The remaining results of the initial request can be seen by sending&#x2028; another GetLifecyclePolicyPreviewRequest request with the returned nextToken&#x2028; value. This value can be between 1 and 1000. If this&#x2028; parameter is not used, then GetLifecyclePolicyPreviewRequest returns up to&#x2028; 100 results and a nextToken value, if&#x2028; applicable. This option cannot be used when you specify images with imageIds.",
  "nextToken": "The nextToken value returned from a previous paginated&#x2028; GetLifecyclePolicyPreviewRequest request where maxResults was used and the&#x2028; results exceeded the value of that parameter. Pagination continues from the end of the&#x2028; previous results that returned the nextToken value. This value is&#x2028; null when there are no more results to return. This option cannot be used when you specify images with imageIds."
}
"""
GetLifecyclePolicyPreview(args) = ecr("GetLifecyclePolicyPreview", args)

"""
    DescribeImageScanFindings()

Returns the scan findings for the specified image.

Required Parameters
{
  "repositoryName": "The repository for the image for which to describe the scan findings.",
  "imageId": ""
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry that contains the repository in which to describe the image scan findings for. If you do not specify a registry, the default registry is assumed.",
  "maxResults": "The maximum number of image scan results returned by DescribeImageScanFindings in paginated output. When this parameter is used, DescribeImageScanFindings only returns maxResults results in a single page along with a nextToken response element. The remaining results of the initial request can be seen by sending another DescribeImageScanFindings request with the returned nextToken value. This value can be between 1 and 1000. If this parameter is not used, then DescribeImageScanFindings returns up to 100 results and a nextToken value, if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated DescribeImageScanFindings request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value. This value is null when there are no more results to return."
}
"""
DescribeImageScanFindings(args) = ecr("DescribeImageScanFindings", args)

"""
    InitiateLayerUpload()

Notifies Amazon ECR that you intend to upload an image layer. When an image is pushed, the InitiateLayerUpload API is called once per image layer that has not already been uploaded. Whether an image layer has been uploaded before is determined by the BatchCheckLayerAvailability API action.  This operation is used by the Amazon ECR proxy, and it is not intended for general use by customers for pulling and pushing images. In most cases, you should use the docker CLI to pull, tag, and push images. 

Required Parameters
{
  "repositoryName": "The name of the repository to which you intend to upload layers."
}

Optional Parameters
{
  "registryId": "The AWS account ID associated with the registry to which you intend to upload layers. If you do not specify a registry, the default registry is assumed."
}
"""
InitiateLayerUpload(args) = ecr("InitiateLayerUpload", args)