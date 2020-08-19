# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: honeycode

using Compat
using UUIDs
"""
    GetScreenData()

 The GetScreenData API allows retrieval of data from a screen in a Honeycode app. The API allows setting local variables in the screen to filter, sort or otherwise affect what will be displayed on the screen. 

# Required Parameters
- `appId`: The ID of the app that contains the screem.
- `screenId`: The ID of the screen.
- `workbookId`: The ID of the workbook that contains the screen.

# Optional Parameters
- `maxResults`:  The number of results to be returned on a single page. Specify a number between 1 and 100. The maximum value is 100.   This parameter is optional. If you don't specify this parameter, the default page size is 100. 
- `nextToken`:  This parameter is optional. If a nextToken is not specified, the API returns the first page of data.   Pagination tokens expire after 1 hour. If you use a token that was returned more than an hour back, the API will throw ValidationException. 
- `variables`:  Variables are optional and are needed only if the screen requires them to render correctly. Variables are specified as a map where the key is the name of the variable as defined on the screen. The value is an object which currently has only one property, rawValue, which holds the value of the variable to be passed to the screen. 
"""

GetScreenData(appId, screenId, workbookId; aws_config::AWSConfig=global_aws_config()) = honeycode("POST", "/screendata", Dict{String, Any}("appId"=>appId, "screenId"=>screenId, "workbookId"=>workbookId); aws_config=aws_config)
GetScreenData(appId, screenId, workbookId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = honeycode("POST", "/screendata", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("appId"=>appId, "screenId"=>screenId, "workbookId"=>workbookId), args)); aws_config=aws_config)

"""
    InvokeScreenAutomation()

 The InvokeScreenAutomation API allows invoking an action defined in a screen in a Honeycode app. The API allows setting local variables, which can then be used in the automation being invoked. This allows automating the Honeycode app interactions to write, update or delete data in the workbook. 

# Required Parameters
- `appId`: The ID of the app that contains the screen automation.
- `automationId`: The ID of the automation action to be performed.
- `screenId`: The ID of the screen that contains the screen automation.
- `workbookId`: The ID of the workbook that contains the screen automation.

# Optional Parameters
- `clientRequestToken`:  The request token for performing the automation action. Request tokens help to identify duplicate requests. If a call times out or fails due to a transient error like a failed network connection, you can retry the call with the same request token. The service ensures that if the first call using that request token is successfully performed, the second call will return the response of the previous call rather than performing the action again.   Note that request tokens are valid only for a few minutes. You cannot use request tokens to dedupe requests spanning hours or days. 
- `rowId`:  The row ID for the automation if the automation is defined inside a block with source or list. 
- `variables`:  Variables are optional and are needed only if the screen requires them to render correctly. Variables are specified as a map where the key is the name of the variable as defined on the screen. The value is an object which currently has only one property, rawValue, which holds the value of the variable to be passed to the screen. 
"""

InvokeScreenAutomation(appId, automationId, screenId, workbookId; aws_config::AWSConfig=global_aws_config()) = honeycode("POST", "/workbooks/$(workbookId)/apps/$(appId)/screens/$(screenId)/automations/$(automationId)"; aws_config=aws_config)
InvokeScreenAutomation(appId, automationId, screenId, workbookId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = honeycode("POST", "/workbooks/$(workbookId)/apps/$(appId)/screens/$(screenId)/automations/$(automationId)", args; aws_config=aws_config)
