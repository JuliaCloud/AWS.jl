include("../AWSServices.jl")
using .AWSServices: elastic_inference

"""
    ListTagsForResource()

Returns all tags of an Elastic Inference Accelerator.

Required Parameters
{
  "resourceArn": "The ARN of the Elastic Inference Accelerator to list the tags for."
}
"""
ListTagsForResource(args) = elastic_inference("GET", "/tags/{resourceArn}", args)

"""
    TagResource()

Adds the specified tag(s) to an Elastic Inference Accelerator.

Required Parameters
{
  "resourceArn": "The ARN of the Elastic Inference Accelerator to tag.",
  "tags": "The tags to add to the Elastic Inference Accelerator."
}
"""
TagResource(args) = elastic_inference("POST", "/tags/{resourceArn}", args)

"""
    UntagResource()

Removes the specified tag(s) from an Elastic Inference Accelerator.

Required Parameters
{
  "resourceArn": "The ARN of the Elastic Inference Accelerator to untag.",
  "tagKeys": "The list of tags to remove from the Elastic Inference Accelerator."
}
"""
UntagResource(args) = elastic_inference("DELETE", "/tags/{resourceArn}", args)
