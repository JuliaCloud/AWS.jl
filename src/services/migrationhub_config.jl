include("../AWSServices.jl")
using .AWSServices: migrationhub_config

"""
    CreateHomeRegionControl()

This API sets up the home region for the calling account only.

Required Parameters
{
  "HomeRegion": "The name of the home region of the calling account.",
  "Target": "The account for which this command sets up a home region control. The Target is always of type ACCOUNT."
}

Optional Parameters
{
  "DryRun": "Optional Boolean flag to indicate whether any effect should take place. It tests whether the caller has permission to make the call."
}
"""
CreateHomeRegionControl(args) = migrationhub_config("CreateHomeRegionControl", args)

"""
    GetHomeRegion()

Returns the calling account’s home region, if configured. This API is used by other AWS services to determine the regional endpoint for calling AWS Application Discovery Service and Migration Hub. You must call GetHomeRegion at least once before you call any other AWS Application Discovery Service and AWS Migration Hub APIs, to obtain the account's Migration Hub home region.
"""
GetHomeRegion() = migrationhub_config("GetHomeRegion")
GetHomeRegion(args) = migrationhub_config("GetHomeRegion", args)

"""
    DescribeHomeRegionControls()

This API permits filtering on the ControlId, HomeRegion, and RegionControlScope fields.

Optional Parameters
{
  "MaxResults": "The maximum number of filtering results to display per page. ",
  "NextToken": "If a NextToken was returned by a previous call, more results are available. To retrieve the next page of results, make the call again using the returned token in NextToken.",
  "ControlId": "The ControlID is a unique identifier string of your HomeRegionControl object.",
  "HomeRegion": "The name of the home region you'd like to view.",
  "Target": "The target parameter specifies the identifier to which the home region is applied, which is always of type ACCOUNT. It applies the home region to the current ACCOUNT."
}
"""
DescribeHomeRegionControls() = migrationhub_config("DescribeHomeRegionControls")
DescribeHomeRegionControls(args) = migrationhub_config("DescribeHomeRegionControls", args)
