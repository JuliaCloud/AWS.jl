include("../AWSServices.jl")
using .AWSServices: marketplace_entitlement_service

"""
    GetEntitlements()

GetEntitlements retrieves entitlement values for a given product. The results can be filtered based on customer identifier or product dimensions.

Required Parameters
{
  "ProductCode": "Product code is used to uniquely identify a product in AWS Marketplace. The product code will be provided by AWS Marketplace when the product listing is created."
}

Optional Parameters
{
  "MaxResults": "The maximum number of items to retrieve from the GetEntitlements operation. For pagination, use the NextToken field in subsequent calls to GetEntitlements.",
  "NextToken": "For paginated calls to GetEntitlements, pass the NextToken from the previous GetEntitlementsResult.",
  "Filter": "Filter is used to return entitlements for a specific customer or for a specific dimension. Filters are described as keys mapped to a lists of values. Filtered requests are unioned for each value in the value list, and then intersected for each filter key."
}
"""
GetEntitlements(args) = marketplace_entitlement_service("GetEntitlements", args)
