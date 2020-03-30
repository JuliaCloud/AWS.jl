include("../AWSServices.jl")
using .AWSServices: cost_and_usage_report_service

"""
    ModifyReportDefinition()

Allows you to programatically update your report preferences.

Required Parameters
{
  "ReportName": "",
  "ReportDefinition": ""
}
"""
ModifyReportDefinition(args) = cost_and_usage_report_service("ModifyReportDefinition", args)

"""
    DeleteReportDefinition()

Deletes the specified report.

Optional Parameters
{
  "ReportName": ""
}
"""
DeleteReportDefinition() = cost_and_usage_report_service("DeleteReportDefinition")
DeleteReportDefinition(args) = cost_and_usage_report_service("DeleteReportDefinition", args)

"""
    PutReportDefinition()

Creates a new report using the description that you provide.

Required Parameters
{
  "ReportDefinition": "Represents the output of the PutReportDefinition operation. The content consists of the detailed metadata and data file information. "
}
"""
PutReportDefinition(args) = cost_and_usage_report_service("PutReportDefinition", args)

"""
    DescribeReportDefinitions()

Lists the AWS Cost and Usage reports available to this account.

Optional Parameters
{
  "MaxResults": "",
  "NextToken": ""
}
"""
DescribeReportDefinitions() = cost_and_usage_report_service("DescribeReportDefinitions")
DescribeReportDefinitions(args) = cost_and_usage_report_service("DescribeReportDefinitions", args)
