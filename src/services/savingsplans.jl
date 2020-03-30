include("../AWSServices.jl")
using .AWSServices: savingsplans

"""
    ListTagsForResource()

Lists the tags for the specified resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource."
}
"""
ListTagsForResource(args) = savingsplans("POST", "/ListTagsForResource", args)

"""
    CreateSavingsPlan()

Creates a Savings Plan.

Required Parameters
{
  "commitment": "The hourly commitment, in USD. This is a value between 0.001 and 1 million. You cannot specify more than three digits after the decimal point.",
  "savingsPlanOfferingId": "The ID of the offering."
}

Optional Parameters
{
  "upfrontPaymentAmount": "The up-front payment amount. This is a whole number between 50 and 99 percent of the total value of the Savings Plan. This parameter is supported only if the payment option is Partial Upfront.",
  "clientToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "tags": "One or more tags."
}
"""
CreateSavingsPlan(args) = savingsplans("POST", "/CreateSavingsPlan", args)

"""
    DescribeSavingsPlansOfferings()

Describes the specified Savings Plans offerings.

Optional Parameters
{
  "descriptions": "The descriptions.",
  "nextToken": "The token for the next page of results.",
  "operations": "The specific AWS operation for the line item in the billing report.",
  "usageTypes": "The usage details of the line item in the billing report.",
  "durations": "The durations, in seconds.",
  "paymentOptions": "The payment options.",
  "serviceCodes": "The services.",
  "currencies": "The currencies.",
  "offeringIds": "The IDs of the offerings.",
  "productType": "The product type.",
  "filters": "The filters.",
  "planTypes": "The plan type.",
  "maxResults": "The maximum number of results to return with a single call. To retrieve additional results, make another call with the returned token value."
}
"""
DescribeSavingsPlansOfferings() = savingsplans("POST", "/DescribeSavingsPlansOfferings")
DescribeSavingsPlansOfferings(args) = savingsplans("POST", "/DescribeSavingsPlansOfferings", args)

"""
    DescribeSavingsPlanRates()

Describes the specified Savings Plans rates.

Required Parameters
{
  "savingsPlanId": "The ID of the Savings Plan."
}

Optional Parameters
{
  "filters": "The filters.",
  "maxResults": "The maximum number of results to return with a single call. To retrieve additional results, make another call with the returned token value.",
  "nextToken": "The token for the next page of results."
}
"""
DescribeSavingsPlanRates(args) = savingsplans("POST", "/DescribeSavingsPlanRates", args)

"""
    DescribeSavingsPlansOfferingRates()

Describes the specified Savings Plans offering rates.

Optional Parameters
{
  "operations": "The specific AWS operation for the line item in the billing report.",
  "filters": "The filters.",
  "savingsPlanOfferingIds": "The IDs of the offerings.",
  "usageTypes": "The usage details of the line item in the billing report.",
  "products": "The AWS products.",
  "savingsPlanTypes": "The plan types.",
  "maxResults": "The maximum number of results to return with a single call. To retrieve additional results, make another call with the returned token value.",
  "savingsPlanPaymentOptions": "The payment options.",
  "nextToken": "The token for the next page of results.",
  "serviceCodes": "The services."
}
"""
DescribeSavingsPlansOfferingRates() = savingsplans("POST", "/DescribeSavingsPlansOfferingRates")
DescribeSavingsPlansOfferingRates(args) = savingsplans("POST", "/DescribeSavingsPlansOfferingRates", args)

"""
    DescribeSavingsPlans()

Describes the specified Savings Plans.

Optional Parameters
{
  "filters": "The filters.",
  "savingsPlanArns": "The Amazon Resource Names (ARN) of the Savings Plans.",
  "maxResults": "The maximum number of results to return with a single call. To retrieve additional results, make another call with the returned token value.",
  "nextToken": "The token for the next page of results.",
  "states": "The states.",
  "savingsPlanIds": "The IDs of the Savings Plans."
}
"""
DescribeSavingsPlans() = savingsplans("POST", "/DescribeSavingsPlans")
DescribeSavingsPlans(args) = savingsplans("POST", "/DescribeSavingsPlans", args)

"""
    TagResource()

Adds the specified tags to the specified resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "tags": "One or more tags. For example, { \"tags\": {\"key1\":\"value1\", \"key2\":\"value2\"} }."
}
"""
TagResource(args) = savingsplans("POST", "/TagResource", args)

"""
    UntagResource()

Removes the specified tags from the specified resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource.",
  "tagKeys": "The tag keys."
}
"""
UntagResource(args) = savingsplans("POST", "/UntagResource", args)
