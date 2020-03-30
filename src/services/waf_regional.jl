include("../AWSServices.jl")
using .AWSServices: waf_regional

"""
    GetRuleGroup()

Returns the RuleGroup that is specified by the RuleGroupId that you included in the GetRuleGroup request. To view the rules in a rule group, use ListActivatedRulesInRuleGroup.

Required Parameters
{
  "RuleGroupId": "The RuleGroupId of the RuleGroup that you want to get. RuleGroupId is returned by CreateRuleGroup and by ListRuleGroups."
}
"""
GetRuleGroup(args) = waf_regional("GetRuleGroup", args)

"""
    CreateIPSet()

Creates an IPSet, which you use to specify which web requests that you want to allow or block based on the IP addresses that the requests originate from. For example, if you're receiving a lot of requests from one or more individual IP addresses or one or more ranges of IP addresses and you want to block the requests, you can create an IPSet that contains those IP addresses and then configure AWS WAF to block the requests.  To create and configure an IPSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateIPSet request.   Submit a CreateIPSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateIPSet request.   Submit an UpdateIPSet request to specify the IP addresses that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description of the IPSet. You can't change Name after you create the IPSet."
}
"""
CreateIPSet(args) = waf_regional("CreateIPSet", args)

"""
    GetChangeToken()

When you want to create, update, or delete AWS WAF objects, get a change token and include the change token in the create, update, or delete request. Change tokens ensure that your application doesn't submit conflicting requests to AWS WAF. Each create, update, or delete request must use a unique change token. If your application submits a GetChangeToken request and then submits a second GetChangeToken request before submitting a create, update, or delete request, the second GetChangeToken request returns the same value as the first GetChangeToken request. When you use a change token in a create, update, or delete request, the status of the change token changes to PENDING, which indicates that AWS WAF is propagating the change to all AWS WAF servers. Use GetChangeTokenStatus to determine the status of your change token.
"""
GetChangeToken() = waf_regional("GetChangeToken")
GetChangeToken(args) = waf_regional("GetChangeToken", args)

"""
    GetSizeConstraintSet()

Returns the SizeConstraintSet specified by SizeConstraintSetId.

Required Parameters
{
  "SizeConstraintSetId": "The SizeConstraintSetId of the SizeConstraintSet that you want to get. SizeConstraintSetId is returned by CreateSizeConstraintSet and by ListSizeConstraintSets."
}
"""
GetSizeConstraintSet(args) = waf_regional("GetSizeConstraintSet", args)

"""
    ListGeoMatchSets()

Returns an array of GeoMatchSetSummary objects in the response.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more GeoMatchSets than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of GeoMatchSet objects. For the second and subsequent ListGeoMatchSets requests, specify the value of NextMarker from the previous response to get information about another batch of GeoMatchSet objects.",
  "Limit": "Specifies the number of GeoMatchSet objects that you want AWS WAF to return for this request. If you have more GeoMatchSet objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of GeoMatchSet objects."
}
"""
ListGeoMatchSets() = waf_regional("ListGeoMatchSets")
ListGeoMatchSets(args) = waf_regional("ListGeoMatchSets", args)

"""
    DeleteByteMatchSet()

Permanently deletes a ByteMatchSet. You can't delete a ByteMatchSet if it's still used in any Rules or if it still includes any ByteMatchTuple objects (any filters). If you just want to remove a ByteMatchSet from a Rule, use UpdateRule. To permanently delete a ByteMatchSet, perform the following steps:   Update the ByteMatchSet to remove filters, if any. For more information, see UpdateByteMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteByteMatchSet request.   Submit a DeleteByteMatchSet request.  

Required Parameters
{
  "ByteMatchSetId": "The ByteMatchSetId of the ByteMatchSet that you want to delete. ByteMatchSetId is returned by CreateByteMatchSet and by ListByteMatchSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
DeleteByteMatchSet(args) = waf_regional("DeleteByteMatchSet", args)

"""
    GetChangeTokenStatus()

Returns the status of a ChangeToken that you got by calling GetChangeToken. ChangeTokenStatus is one of the following values:    PROVISIONED: You requested the change token by calling GetChangeToken, but you haven't used it yet in a call to create, update, or delete an AWS WAF object.    PENDING: AWS WAF is propagating the create, update, or delete request to all AWS WAF servers.    INSYNC: Propagation is complete.  

Required Parameters
{
  "ChangeToken": "The change token for which you want to get the status. This change token was previously returned in the GetChangeToken response."
}
"""
GetChangeTokenStatus(args) = waf_regional("GetChangeTokenStatus", args)

"""
    UpdateSqlInjectionMatchSet()

Inserts or deletes SqlInjectionMatchTuple objects (filters) in a SqlInjectionMatchSet. For each SqlInjectionMatchTuple object, you specify the following values:    Action: Whether to insert the object into or delete the object from the array. To change a SqlInjectionMatchTuple, you delete the existing object and add a new one.    FieldToMatch: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.    TextTransformation: Which text transformation, if any, to perform on the web request before inspecting the request for snippets of malicious SQL code. You can only specify a single type of TextTransformation.   You use SqlInjectionMatchSet objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain snippets of SQL code in the query string and you want to block the requests, you can create a SqlInjectionMatchSet with the applicable settings, and then configure AWS WAF to block the requests.  To create and configure a SqlInjectionMatchSet, perform the following steps:   Submit a CreateSqlInjectionMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateIPSet request.   Submit an UpdateSqlInjectionMatchSet request to specify the parts of web requests that you want AWS WAF to inspect for snippets of SQL code.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "Updates": "An array of SqlInjectionMatchSetUpdate objects that you want to insert into or delete from a SqlInjectionMatchSet. For more information, see the applicable data types:    SqlInjectionMatchSetUpdate: Contains Action and SqlInjectionMatchTuple     SqlInjectionMatchTuple: Contains FieldToMatch and TextTransformation     FieldToMatch: Contains Data and Type   ",
  "SqlInjectionMatchSetId": "The SqlInjectionMatchSetId of the SqlInjectionMatchSet that you want to update. SqlInjectionMatchSetId is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
UpdateSqlInjectionMatchSet(args) = waf_regional("UpdateSqlInjectionMatchSet", args)

"""
    CreateRegexMatchSet()

Creates a RegexMatchSet. You then use UpdateRegexMatchSet to identify the part of a web request that you want AWS WAF to inspect, such as the values of the User-Agent header or the query string. For example, you can create a RegexMatchSet that contains a RegexMatchTuple that looks for any requests with User-Agent headers that match a RegexPatternSet with pattern B[a@]dB[o0]t. You can then configure AWS WAF to reject those requests. To create and configure a RegexMatchSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateRegexMatchSet request.   Submit a CreateRegexMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRegexMatchSet request.   Submit an UpdateRegexMatchSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value, using a RegexPatternSet, that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description of the RegexMatchSet. You can't change Name after you create a RegexMatchSet."
}
"""
CreateRegexMatchSet(args) = waf_regional("CreateRegexMatchSet", args)

"""
    CreateByteMatchSet()

Creates a ByteMatchSet. You then use UpdateByteMatchSet to identify the part of a web request that you want AWS WAF to inspect, such as the values of the User-Agent header or the query string. For example, you can create a ByteMatchSet that matches any requests with User-Agent headers that contain the string BadBot. You can then configure AWS WAF to reject those requests. To create and configure a ByteMatchSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateByteMatchSet request.   Submit a CreateByteMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateByteMatchSet request.   Submit an UpdateByteMatchSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description of the ByteMatchSet. You can't change Name after you create a ByteMatchSet."
}
"""
CreateByteMatchSet(args) = waf_regional("CreateByteMatchSet", args)

"""
    TagResource()



Required Parameters
{
  "ResourceARN": "",
  "Tags": ""
}
"""
TagResource(args) = waf_regional("TagResource", args)

"""
    ListRuleGroups()

Returns an array of RuleGroup objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more RuleGroups than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of RuleGroups. For the second and subsequent ListRuleGroups requests, specify the value of NextMarker from the previous response to get information about another batch of RuleGroups.",
  "Limit": "Specifies the number of RuleGroups that you want AWS WAF to return for this request. If you have more RuleGroups than the number that you specify for Limit, the response includes a NextMarker value that you can use to get another batch of RuleGroups."
}
"""
ListRuleGroups() = waf_regional("ListRuleGroups")
ListRuleGroups(args) = waf_regional("ListRuleGroups", args)

"""
    GetPermissionPolicy()

Returns the IAM policy attached to the RuleGroup.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the RuleGroup for which you want to get the policy."
}
"""
GetPermissionPolicy(args) = waf_regional("GetPermissionPolicy", args)

"""
    CreateRateBasedRule()

Creates a RateBasedRule. The RateBasedRule contains a RateLimit, which specifies the maximum number of requests that AWS WAF allows from a specified IP address in a five-minute period. The RateBasedRule also contains the IPSet objects, ByteMatchSet objects, and other predicates that identify the requests that you want to count or block if these requests exceed the RateLimit. If you add more than one predicate to a RateBasedRule, a request not only must exceed the RateLimit, but it also must match all the specifications to be counted or blocked. For example, suppose you add the following to a RateBasedRule:   An IPSet that matches the IP address 192.0.2.44/32    A ByteMatchSet that matches BadBot in the User-Agent header   Further, you specify a RateLimit of 15,000. You then add the RateBasedRule to a WebACL and specify that you want to block requests that meet the conditions in the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 and the User-Agent header in the request must contain the value BadBot. Further, requests that match these two conditions must be received at a rate of more than 15,000 requests every five minutes. If both conditions are met and the rate is exceeded, AWS WAF blocks the requests. If the rate drops below 15,000 for a five-minute period, AWS WAF no longer blocks the requests. As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a RateBasedRule:   A ByteMatchSet with FieldToMatch of URI    A PositionalConstraint of STARTS_WITH    A TargetString of login    Further, you specify a RateLimit of 15,000. By adding this RateBasedRule to a WebACL, you could limit requests to your login page without affecting the rest of your site. To create and configure a RateBasedRule, perform the following steps:   Create and update the predicates that you want to include in the rule. For more information, see CreateByteMatchSet, CreateIPSet, and CreateSqlInjectionMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateRule request.   Submit a CreateRateBasedRule request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRule request.   Submit an UpdateRateBasedRule request to specify the predicates that you want to include in the rule.   Create and update a WebACL that contains the RateBasedRule. For more information, see CreateWebACL.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The ChangeToken that you used to submit the CreateRateBasedRule request. You can also use this value to query the status of the request. For more information, see GetChangeTokenStatus.",
  "RateLimit": "The maximum number of requests, which have an identical value in the field that is specified by RateKey, allowed in a five-minute period. If the number of requests exceeds the RateLimit and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.",
  "RateKey": "The field that AWS WAF uses to determine if requests are likely arriving from a single source and thus subject to rate monitoring. The only valid value for RateKey is IP. IP indicates that requests that arrive from the same IP address are subject to the RateLimit that is specified in the RateBasedRule.",
  "MetricName": "A friendly name or description for the metrics for this RateBasedRule. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" and \"Default_Action.\" You can't change the name of the metric after you create the RateBasedRule.",
  "Name": "A friendly name or description of the RateBasedRule. You can't change the name of a RateBasedRule after you create it."
}

Optional Parameters
{
  "Tags": ""
}
"""
CreateRateBasedRule(args) = waf_regional("CreateRateBasedRule", args)

"""
    GetWebACLForResource()

Returns the web ACL for the specified resource, either an application load balancer or Amazon API Gateway stage.

Required Parameters
{
  "ResourceArn": "The ARN (Amazon Resource Name) of the resource for which to get the web ACL, either an application load balancer or Amazon API Gateway stage. The ARN should be in one of the following formats:   For an Application Load Balancer: arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/load-balancer-name/load-balancer-id     For an Amazon API Gateway stage: arn:aws:apigateway:region::/restapis/api-id/stages/stage-name    "
}
"""
GetWebACLForResource(args) = waf_regional("GetWebACLForResource", args)

"""
    CreateRuleGroup()

Creates a RuleGroup. A rule group is a collection of predefined rules that you add to a web ACL. You use UpdateRuleGroup to add rules to the rule group. Rule groups are subject to the following limits:   Three rule groups per account. You can request an increase to this limit by contacting customer support.   One rule group per web ACL.   Ten rules per rule group.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "MetricName": "A friendly name or description for the metrics for this RuleGroup. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" and \"Default_Action.\" You can't change the name of the metric after you create the RuleGroup.",
  "Name": "A friendly name or description of the RuleGroup. You can't change Name after you create a RuleGroup."
}

Optional Parameters
{
  "Tags": ""
}
"""
CreateRuleGroup(args) = waf_regional("CreateRuleGroup", args)

"""
    DeletePermissionPolicy()

Permanently deletes an IAM policy from the specified RuleGroup. The user making the request must be the owner of the RuleGroup.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the RuleGroup from which you want to delete the policy. The user making the request must be the owner of the RuleGroup."
}
"""
DeletePermissionPolicy(args) = waf_regional("DeletePermissionPolicy", args)

"""
    DeleteSizeConstraintSet()

Permanently deletes a SizeConstraintSet. You can't delete a SizeConstraintSet if it's still used in any Rules or if it still includes any SizeConstraint objects (any filters). If you just want to remove a SizeConstraintSet from a Rule, use UpdateRule. To permanently delete a SizeConstraintSet, perform the following steps:   Update the SizeConstraintSet to remove filters, if any. For more information, see UpdateSizeConstraintSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteSizeConstraintSet request.   Submit a DeleteSizeConstraintSet request.  

Required Parameters
{
  "SizeConstraintSetId": "The SizeConstraintSetId of the SizeConstraintSet that you want to delete. SizeConstraintSetId is returned by CreateSizeConstraintSet and by ListSizeConstraintSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
DeleteSizeConstraintSet(args) = waf_regional("DeleteSizeConstraintSet", args)

"""
    GetWebACL()

Returns the WebACL that is specified by WebACLId.

Required Parameters
{
  "WebACLId": "The WebACLId of the WebACL that you want to get. WebACLId is returned by CreateWebACL and by ListWebACLs."
}
"""
GetWebACL(args) = waf_regional("GetWebACL", args)

"""
    CreateWebACL()

Creates a WebACL, which contains the Rules that identify the CloudFront web requests that you want to allow, block, or count. AWS WAF evaluates Rules in order based on the value of Priority for each Rule. You also specify a default action, either ALLOW or BLOCK. If a web request doesn't match any of the Rules in a WebACL, AWS WAF responds to the request with the default action.  To create and configure a WebACL, perform the following steps:   Create and update the ByteMatchSet objects and other predicates that you want to include in Rules. For more information, see CreateByteMatchSet, UpdateByteMatchSet, CreateIPSet, UpdateIPSet, CreateSqlInjectionMatchSet, and UpdateSqlInjectionMatchSet.   Create and update the Rules that you want to include in the WebACL. For more information, see CreateRule and UpdateRule.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateWebACL request.   Submit a CreateWebACL request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateWebACL request.   Submit an UpdateWebACL request to specify the Rules that you want to include in the WebACL, to specify the default action, and to associate the WebACL with a CloudFront distribution.   For more information about how to use the AWS WAF API, see the AWS WAF Developer Guide.

Required Parameters
{
  "DefaultAction": "The action that you want AWS WAF to take when a request doesn't match the criteria specified in any of the Rule objects that are associated with the WebACL.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "MetricName": "A friendly name or description for the metrics for this WebACL.The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" and \"Default_Action.\" You can't change MetricName after you create the WebACL.",
  "Name": "A friendly name or description of the WebACL. You can't change Name after you create the WebACL."
}

Optional Parameters
{
  "Tags": ""
}
"""
CreateWebACL(args) = waf_regional("CreateWebACL", args)

"""
    CreateRegexPatternSet()

Creates a RegexPatternSet. You then use UpdateRegexPatternSet to specify the regular expression (regex) pattern that you want AWS WAF to search for, such as B[a@]dB[o0]t. You can then configure AWS WAF to reject those requests. To create and configure a RegexPatternSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateRegexPatternSet request.   Submit a CreateRegexPatternSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRegexPatternSet request.   Submit an UpdateRegexPatternSet request to specify the string that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description of the RegexPatternSet. You can't change Name after you create a RegexPatternSet."
}
"""
CreateRegexPatternSet(args) = waf_regional("CreateRegexPatternSet", args)

"""
    CreateSizeConstraintSet()

Creates a SizeConstraintSet. You then use UpdateSizeConstraintSet to identify the part of a web request that you want AWS WAF to check for length, such as the length of the User-Agent header or the length of the query string. For example, you can create a SizeConstraintSet that matches any requests that have a query string that is longer than 100 bytes. You can then configure AWS WAF to reject those requests. To create and configure a SizeConstraintSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateSizeConstraintSet request.   Submit a CreateSizeConstraintSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateSizeConstraintSet request.   Submit an UpdateSizeConstraintSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description of the SizeConstraintSet. You can't change Name after you create a SizeConstraintSet."
}
"""
CreateSizeConstraintSet(args) = waf_regional("CreateSizeConstraintSet", args)

"""
    UpdateSizeConstraintSet()

Inserts or deletes SizeConstraint objects (filters) in a SizeConstraintSet. For each SizeConstraint object, you specify the following values:    Whether to insert or delete the object from the array. If you want to change a SizeConstraintSetUpdate object, you delete the existing object and add a new one.   The part of a web request that you want AWS WAF to evaluate, such as the length of a query string or the length of the User-Agent header.   Whether to perform any transformations on the request, such as converting it to lowercase, before checking its length. Note that transformations of the request body are not supported because the AWS resource forwards only the first 8192 bytes of your request to AWS WAF. You can only specify a single type of TextTransformation.   A ComparisonOperator used for evaluating the selected part of the request against the specified Size, such as equals, greater than, less than, and so on.   The length, in bytes, that you want AWS WAF to watch for in selected part of the request. The length is computed after applying the transformation.   For example, you can add a SizeConstraintSetUpdate object that matches web requests in which the length of the User-Agent header is greater than 100 bytes. You can then configure AWS WAF to block those requests. To create and configure a SizeConstraintSet, perform the following steps:   Create a SizeConstraintSet. For more information, see CreateSizeConstraintSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateSizeConstraintSet request.   Submit an UpdateSizeConstraintSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "Updates": "An array of SizeConstraintSetUpdate objects that you want to insert into or delete from a SizeConstraintSet. For more information, see the applicable data types:    SizeConstraintSetUpdate: Contains Action and SizeConstraint     SizeConstraint: Contains FieldToMatch, TextTransformation, ComparisonOperator, and Size     FieldToMatch: Contains Data and Type   ",
  "SizeConstraintSetId": "The SizeConstraintSetId of the SizeConstraintSet that you want to update. SizeConstraintSetId is returned by CreateSizeConstraintSet and by ListSizeConstraintSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
UpdateSizeConstraintSet(args) = waf_regional("UpdateSizeConstraintSet", args)

"""
    ListIPSets()

Returns an array of IPSetSummary objects in the response.

Optional Parameters
{
  "NextMarker": "AWS WAF returns a NextMarker value in the response that allows you to list another group of IPSets. For the second and subsequent ListIPSets requests, specify the value of NextMarker from the previous response to get information about another batch of IPSets.",
  "Limit": "Specifies the number of IPSet objects that you want AWS WAF to return for this request. If you have more IPSet objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of IPSet objects."
}
"""
ListIPSets() = waf_regional("ListIPSets")
ListIPSets(args) = waf_regional("ListIPSets", args)

"""
    UpdateRegexMatchSet()

Inserts or deletes RegexMatchTuple objects (filters) in a RegexMatchSet. For each RegexMatchSetUpdate object, you specify the following values:    Whether to insert or delete the object from the array. If you want to change a RegexMatchSetUpdate object, you delete the existing object and add a new one.   The part of a web request that you want AWS WAF to inspectupdate, such as a query string or the value of the User-Agent header.    The identifier of the pattern (a regular expression) that you want AWS WAF to look for. For more information, see RegexPatternSet.    Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.    For example, you can create a RegexPatternSet that matches any requests with User-Agent headers that contain the string B[a@]dB[o0]t. You can then configure AWS WAF to reject those requests. To create and configure a RegexMatchSet, perform the following steps:   Create a RegexMatchSet. For more information, see CreateRegexMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRegexMatchSet request.   Submit an UpdateRegexMatchSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the identifier of the RegexPatternSet that contain the regular expression patters you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "Updates": "An array of RegexMatchSetUpdate objects that you want to insert into or delete from a RegexMatchSet. For more information, see RegexMatchTuple.",
  "RegexMatchSetId": "The RegexMatchSetId of the RegexMatchSet that you want to update. RegexMatchSetId is returned by CreateRegexMatchSet and by ListRegexMatchSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
UpdateRegexMatchSet(args) = waf_regional("UpdateRegexMatchSet", args)

"""
    DeleteXssMatchSet()

Permanently deletes an XssMatchSet. You can't delete an XssMatchSet if it's still used in any Rules or if it still contains any XssMatchTuple objects. If you just want to remove an XssMatchSet from a Rule, use UpdateRule. To permanently delete an XssMatchSet from AWS WAF, perform the following steps:   Update the XssMatchSet to remove filters, if any. For more information, see UpdateXssMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteXssMatchSet request.   Submit a DeleteXssMatchSet request.  

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "XssMatchSetId": "The XssMatchSetId of the XssMatchSet that you want to delete. XssMatchSetId is returned by CreateXssMatchSet and by ListXssMatchSets."
}
"""
DeleteXssMatchSet(args) = waf_regional("DeleteXssMatchSet", args)

"""
    CreateSqlInjectionMatchSet()

Creates a SqlInjectionMatchSet, which you use to allow, block, or count requests that contain snippets of SQL code in a specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings. To create and configure a SqlInjectionMatchSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateSqlInjectionMatchSet request.   Submit a CreateSqlInjectionMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateSqlInjectionMatchSet request.   Submit an UpdateSqlInjectionMatchSet request to specify the parts of web requests in which you want to allow, block, or count malicious SQL code.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description for the SqlInjectionMatchSet that you're creating. You can't change Name after you create the SqlInjectionMatchSet."
}
"""
CreateSqlInjectionMatchSet(args) = waf_regional("CreateSqlInjectionMatchSet", args)

"""
    ListSubscribedRuleGroups()

Returns an array of RuleGroup objects that you are subscribed to.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more ByteMatchSetssubscribed rule groups than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of subscribed rule groups. For the second and subsequent ListSubscribedRuleGroupsRequest requests, specify the value of NextMarker from the previous response to get information about another batch of subscribed rule groups.",
  "Limit": "Specifies the number of subscribed rule groups that you want AWS WAF to return for this request. If you have more objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of objects."
}
"""
ListSubscribedRuleGroups() = waf_regional("ListSubscribedRuleGroups")
ListSubscribedRuleGroups(args) = waf_regional("ListSubscribedRuleGroups", args)

"""
    CreateRule()

Creates a Rule, which contains the IPSet objects, ByteMatchSet objects, and other predicates that identify the requests that you want to block. If you add more than one predicate to a Rule, a request must match all of the specifications to be allowed or blocked. For example, suppose that you add the following to a Rule:   An IPSet that matches the IP address 192.0.2.44/32    A ByteMatchSet that matches BadBot in the User-Agent header   You then add the Rule to a WebACL and specify that you want to blocks requests that satisfy the Rule. For a request to be blocked, it must come from the IP address 192.0.2.44 and the User-Agent header in the request must contain the value BadBot. To create and configure a Rule, perform the following steps:   Create and update the predicates that you want to include in the Rule. For more information, see CreateByteMatchSet, CreateIPSet, and CreateSqlInjectionMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateRule request.   Submit a CreateRule request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRule request.   Submit an UpdateRule request to specify the predicates that you want to include in the Rule.   Create and update a WebACL that contains the Rule. For more information, see CreateWebACL.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "MetricName": "A friendly name or description for the metrics for this Rule. The name can contain only alphanumeric characters (A-Z, a-z, 0-9), with maximum length 128 and minimum length one. It can't contain whitespace or metric names reserved for AWS WAF, including \"All\" and \"Default_Action.\" You can't change the name of the metric after you create the Rule.",
  "Name": "A friendly name or description of the Rule. You can't change the name of a Rule after you create it."
}

Optional Parameters
{
  "Tags": ""
}
"""
CreateRule(args) = waf_regional("CreateRule", args)

"""
    GetRateBasedRule()

Returns the RateBasedRule that is specified by the RuleId that you included in the GetRateBasedRule request.

Required Parameters
{
  "RuleId": "The RuleId of the RateBasedRule that you want to get. RuleId is returned by CreateRateBasedRule and by ListRateBasedRules."
}
"""
GetRateBasedRule(args) = waf_regional("GetRateBasedRule", args)

"""
    UpdateRegexPatternSet()

Inserts or deletes RegexPatternString objects in a RegexPatternSet. For each RegexPatternString object, you specify the following values:    Whether to insert or delete the RegexPatternString.   The regular expression pattern that you want to insert or delete. For more information, see RegexPatternSet.     For example, you can create a RegexPatternString such as B[a@]dB[o0]t. AWS WAF will match this RegexPatternString to:   BadBot   BadB0t   B@dBot   B@dB0t   To create and configure a RegexPatternSet, perform the following steps:   Create a RegexPatternSet. For more information, see CreateRegexPatternSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRegexPatternSet request.   Submit an UpdateRegexPatternSet request to specify the regular expression pattern that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "RegexPatternSetId": "The RegexPatternSetId of the RegexPatternSet that you want to update. RegexPatternSetId is returned by CreateRegexPatternSet and by ListRegexPatternSets.",
  "Updates": "An array of RegexPatternSetUpdate objects that you want to insert into or delete from a RegexPatternSet.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
UpdateRegexPatternSet(args) = waf_regional("UpdateRegexPatternSet", args)

"""
    CreateGeoMatchSet()

Creates an GeoMatchSet, which you use to specify which web requests you want to allow or block based on the country that the requests originate from. For example, if you're receiving a lot of requests from one or more countries and you want to block the requests, you can create an GeoMatchSet that contains those countries and then configure AWS WAF to block the requests.  To create and configure a GeoMatchSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateGeoMatchSet request.   Submit a CreateGeoMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateGeoMatchSet request.   Submit an UpdateGeoMatchSetSet request to specify the countries that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description of the GeoMatchSet. You can't change Name after you create the GeoMatchSet."
}
"""
CreateGeoMatchSet(args) = waf_regional("CreateGeoMatchSet", args)

"""
    ListRules()

Returns an array of RuleSummary objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more Rules than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of Rules. For the second and subsequent ListRules requests, specify the value of NextMarker from the previous response to get information about another batch of Rules.",
  "Limit": "Specifies the number of Rules that you want AWS WAF to return for this request. If you have more Rules than the number that you specify for Limit, the response includes a NextMarker value that you can use to get another batch of Rules."
}
"""
ListRules() = waf_regional("ListRules")
ListRules(args) = waf_regional("ListRules", args)

"""
    UntagResource()



Required Parameters
{
  "ResourceARN": "",
  "TagKeys": ""
}
"""
UntagResource(args) = waf_regional("UntagResource", args)

"""
    DeleteRegexPatternSet()

Permanently deletes a RegexPatternSet. You can't delete a RegexPatternSet if it's still used in any RegexMatchSet or if the RegexPatternSet is not empty. 

Required Parameters
{
  "RegexPatternSetId": "The RegexPatternSetId of the RegexPatternSet that you want to delete. RegexPatternSetId is returned by CreateRegexPatternSet and by ListRegexPatternSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
DeleteRegexPatternSet(args) = waf_regional("DeleteRegexPatternSet", args)

"""
    UpdateRateBasedRule()

Inserts or deletes Predicate objects in a rule and updates the RateLimit in the rule.  Each Predicate object identifies a predicate, such as a ByteMatchSet or an IPSet, that specifies the web requests that you want to block or count. The RateLimit specifies the number of requests every five minutes that triggers the rule. If you add more than one predicate to a RateBasedRule, a request must match all the predicates and exceed the RateLimit to be counted or blocked. For example, suppose you add the following to a RateBasedRule:   An IPSet that matches the IP address 192.0.2.44/32    A ByteMatchSet that matches BadBot in the User-Agent header   Further, you specify a RateLimit of 15,000. You then add the RateBasedRule to a WebACL and specify that you want to block requests that satisfy the rule. For a request to be blocked, it must come from the IP address 192.0.2.44 and the User-Agent header in the request must contain the value BadBot. Further, requests that match these two conditions much be received at a rate of more than 15,000 every five minutes. If the rate drops below this limit, AWS WAF no longer blocks the requests. As a second example, suppose you want to limit requests to a particular page on your site. To do this, you could add the following to a RateBasedRule:   A ByteMatchSet with FieldToMatch of URI    A PositionalConstraint of STARTS_WITH    A TargetString of login    Further, you specify a RateLimit of 15,000. By adding this RateBasedRule to a WebACL, you could limit requests to your login page without affecting the rest of your site.

Required Parameters
{
  "Updates": "An array of RuleUpdate objects that you want to insert into or delete from a RateBasedRule. ",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "RateLimit": "The maximum number of requests, which have an identical value in the field specified by the RateKey, allowed in a five-minute period. If the number of requests exceeds the RateLimit and the other predicates specified in the rule are also met, AWS WAF triggers the action that is specified for this rule.",
  "RuleId": "The RuleId of the RateBasedRule that you want to update. RuleId is returned by CreateRateBasedRule and by ListRateBasedRules."
}
"""
UpdateRateBasedRule(args) = waf_regional("UpdateRateBasedRule", args)

"""
    DeleteRegexMatchSet()

Permanently deletes a RegexMatchSet. You can't delete a RegexMatchSet if it's still used in any Rules or if it still includes any RegexMatchTuples objects (any filters). If you just want to remove a RegexMatchSet from a Rule, use UpdateRule. To permanently delete a RegexMatchSet, perform the following steps:   Update the RegexMatchSet to remove filters, if any. For more information, see UpdateRegexMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteRegexMatchSet request.   Submit a DeleteRegexMatchSet request.  

Required Parameters
{
  "RegexMatchSetId": "The RegexMatchSetId of the RegexMatchSet that you want to delete. RegexMatchSetId is returned by CreateRegexMatchSet and by ListRegexMatchSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
DeleteRegexMatchSet(args) = waf_regional("DeleteRegexMatchSet", args)

"""
    GetByteMatchSet()

Returns the ByteMatchSet specified by ByteMatchSetId.

Required Parameters
{
  "ByteMatchSetId": "The ByteMatchSetId of the ByteMatchSet that you want to get. ByteMatchSetId is returned by CreateByteMatchSet and by ListByteMatchSets."
}
"""
GetByteMatchSet(args) = waf_regional("GetByteMatchSet", args)

"""
    DeleteRule()

Permanently deletes a Rule. You can't delete a Rule if it's still used in any WebACL objects or if it still includes any predicates, such as ByteMatchSet objects. If you just want to remove a Rule from a WebACL, use UpdateWebACL. To permanently delete a Rule from AWS WAF, perform the following steps:   Update the Rule to remove predicates, if any. For more information, see UpdateRule.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteRule request.   Submit a DeleteRule request.  

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "RuleId": "The RuleId of the Rule that you want to delete. RuleId is returned by CreateRule and by ListRules."
}
"""
DeleteRule(args) = waf_regional("DeleteRule", args)

"""
    GetIPSet()

Returns the IPSet that is specified by IPSetId.

Required Parameters
{
  "IPSetId": "The IPSetId of the IPSet that you want to get. IPSetId is returned by CreateIPSet and by ListIPSets."
}
"""
GetIPSet(args) = waf_regional("GetIPSet", args)

"""
    ListRegexPatternSets()

Returns an array of RegexPatternSetSummary objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more RegexPatternSet objects than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of RegexPatternSet objects. For the second and subsequent ListRegexPatternSets requests, specify the value of NextMarker from the previous response to get information about another batch of RegexPatternSet objects.",
  "Limit": "Specifies the number of RegexPatternSet objects that you want AWS WAF to return for this request. If you have more RegexPatternSet objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of RegexPatternSet objects."
}
"""
ListRegexPatternSets() = waf_regional("ListRegexPatternSets")
ListRegexPatternSets(args) = waf_regional("ListRegexPatternSets", args)

"""
    ListResourcesForWebACL()

Returns an array of resources associated with the specified web ACL.

Required Parameters
{
  "WebACLId": "The unique identifier (ID) of the web ACL for which to list the associated resources."
}

Optional Parameters
{
  "ResourceType": "The type of resource to list, either an application load balancer or Amazon API Gateway."
}
"""
ListResourcesForWebACL(args) = waf_regional("ListResourcesForWebACL", args)

"""
    DeleteRuleGroup()

Permanently deletes a RuleGroup. You can't delete a RuleGroup if it's still used in any WebACL objects or if it still includes any rules. If you just want to remove a RuleGroup from a WebACL, use UpdateWebACL. To permanently delete a RuleGroup from AWS WAF, perform the following steps:   Update the RuleGroup to remove rules, if any. For more information, see UpdateRuleGroup.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteRuleGroup request.   Submit a DeleteRuleGroup request.  

Required Parameters
{
  "RuleGroupId": "The RuleGroupId of the RuleGroup that you want to delete. RuleGroupId is returned by CreateRuleGroup and by ListRuleGroups.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
DeleteRuleGroup(args) = waf_regional("DeleteRuleGroup", args)

"""
    ListTagsForResource()



Required Parameters
{
  "ResourceARN": ""
}

Optional Parameters
{
  "NextMarker": "",
  "Limit": ""
}
"""
ListTagsForResource(args) = waf_regional("ListTagsForResource", args)

"""
    UpdateWebACL()

Inserts or deletes ActivatedRule objects in a WebACL. Each Rule identifies web requests that you want to allow, block, or count. When you update a WebACL, you specify the following values:   A default action for the WebACL, either ALLOW or BLOCK. AWS WAF performs the default action if a request doesn't match the criteria in any of the Rules in a WebACL.   The Rules that you want to add or delete. If you want to replace one Rule with another, you delete the existing Rule and add the new one.   For each Rule, whether you want AWS WAF to allow requests, block requests, or count requests that match the conditions in the Rule.   The order in which you want AWS WAF to evaluate the Rules in a WebACL. If you add more than one Rule to a WebACL, AWS WAF evaluates each request against the Rules in order based on the value of Priority. (The Rule that has the lowest value for Priority is evaluated first.) When a web request matches all the predicates (such as ByteMatchSets and IPSets) in a Rule, AWS WAF immediately takes the corresponding action, allow or block, and doesn't evaluate the request against the remaining Rules in the WebACL, if any.    To create and configure a WebACL, perform the following steps:   Create and update the predicates that you want to include in Rules. For more information, see CreateByteMatchSet, UpdateByteMatchSet, CreateIPSet, UpdateIPSet, CreateSqlInjectionMatchSet, and UpdateSqlInjectionMatchSet.   Create and update the Rules that you want to include in the WebACL. For more information, see CreateRule and UpdateRule.   Create a WebACL. See CreateWebACL.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateWebACL request.   Submit an UpdateWebACL request to specify the Rules that you want to include in the WebACL, to specify the default action, and to associate the WebACL with a CloudFront distribution.  The ActivatedRule can be a rule group. If you specify a rule group as your ActivatedRule, you can exclude specific rules from that rule group. If you already have a rule group associated with a web ACL and want to submit an UpdateWebACL request to exclude certain rules from that rule group, you must first remove the rule group from the web ACL, the re-insert it again, specifying the excluded rules. For details, see ActivatedRule ExcludedRules.    Be aware that if you try to add a RATE_BASED rule to a web ACL without setting the rule type when first creating the rule, the UpdateWebACL request will fail because the request tries to add a REGULAR rule (the default rule type) with the specified ID, which does not exist.  For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "WebACLId": "The WebACLId of the WebACL that you want to update. WebACLId is returned by CreateWebACL and by ListWebACLs."
}

Optional Parameters
{
  "Updates": "An array of updates to make to the WebACL. An array of WebACLUpdate objects that you want to insert into or delete from a WebACL. For more information, see the applicable data types:    WebACLUpdate: Contains Action and ActivatedRule     ActivatedRule: Contains Action, OverrideAction, Priority, RuleId, and Type. ActivatedRule|OverrideAction applies only when updating or adding a RuleGroup to a WebACL. In this case, you do not use ActivatedRule|Action. For all other update requests, ActivatedRule|Action is used instead of ActivatedRule|OverrideAction.     WafAction: Contains Type   ",
  "DefaultAction": "A default action for the web ACL, either ALLOW or BLOCK. AWS WAF performs the default action if a request doesn't match the criteria in any of the rules in a web ACL."
}
"""
UpdateWebACL(args) = waf_regional("UpdateWebACL", args)

"""
    GetGeoMatchSet()

Returns the GeoMatchSet that is specified by GeoMatchSetId.

Required Parameters
{
  "GeoMatchSetId": "The GeoMatchSetId of the GeoMatchSet that you want to get. GeoMatchSetId is returned by CreateGeoMatchSet and by ListGeoMatchSets."
}
"""
GetGeoMatchSet(args) = waf_regional("GetGeoMatchSet", args)

"""
    CreateXssMatchSet()

Creates an XssMatchSet, which you use to allow, block, or count requests that contain cross-site scripting attacks in the specified part of web requests. AWS WAF searches for character sequences that are likely to be malicious strings. To create and configure an XssMatchSet, perform the following steps:   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a CreateXssMatchSet request.   Submit a CreateXssMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateXssMatchSet request.   Submit an UpdateXssMatchSet request to specify the parts of web requests in which you want to allow, block, or count cross-site scripting attacks.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "Name": "A friendly name or description for the XssMatchSet that you're creating. You can't change Name after you create the XssMatchSet."
}
"""
CreateXssMatchSet(args) = waf_regional("CreateXssMatchSet", args)

"""
    GetLoggingConfiguration()

Returns the LoggingConfiguration for the specified web ACL.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the web ACL for which you want to get the LoggingConfiguration."
}
"""
GetLoggingConfiguration(args) = waf_regional("GetLoggingConfiguration", args)

"""
    DeleteLoggingConfiguration()

Permanently deletes the LoggingConfiguration from the specified web ACL.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the web ACL from which you want to delete the LoggingConfiguration."
}
"""
DeleteLoggingConfiguration(args) = waf_regional("DeleteLoggingConfiguration", args)

"""
    UpdateIPSet()

Inserts or deletes IPSetDescriptor objects in an IPSet. For each IPSetDescriptor object, you specify the following values:    Whether to insert or delete the object from the array. If you want to change an IPSetDescriptor object, you delete the existing object and add a new one.   The IP address version, IPv4 or IPv6.    The IP address in CIDR notation, for example, 192.0.2.0/24 (for the range of IP addresses from 192.0.2.0 to 192.0.2.255) or 192.0.2.44/32 (for the individual IP address 192.0.2.44).    AWS WAF supports IPv4 address ranges: /8 and any range between /16 through /32. AWS WAF supports IPv6 address ranges: /24, /32, /48, /56, /64, and /128. For more information about CIDR notation, see the Wikipedia entry Classless Inter-Domain Routing. IPv6 addresses can be represented using any of the following formats:   1111:0000:0000:0000:0000:0000:0000:0111/128   1111:0:0:0:0:0:0:0111/128   1111::0111/128   1111::111/128   You use an IPSet to specify which web requests you want to allow or block based on the IP addresses that the requests originated from. For example, if you're receiving a lot of requests from one or a small number of IP addresses and you want to block the requests, you can create an IPSet that specifies those IP addresses, and then configure AWS WAF to block the requests.  To create and configure an IPSet, perform the following steps:   Submit a CreateIPSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateIPSet request.   Submit an UpdateIPSet request to specify the IP addresses that you want AWS WAF to watch for.   When you update an IPSet, you specify the IP addresses that you want to add and/or the IP addresses that you want to delete. If you want to change an IP address, you delete the existing IP address and add the new one. You can insert a maximum of 1000 addresses in a single request. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "Updates": "An array of IPSetUpdate objects that you want to insert into or delete from an IPSet. For more information, see the applicable data types:    IPSetUpdate: Contains Action and IPSetDescriptor     IPSetDescriptor: Contains Type and Value    You can insert a maximum of 1000 addresses in a single request.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "IPSetId": "The IPSetId of the IPSet that you want to update. IPSetId is returned by CreateIPSet and by ListIPSets."
}
"""
UpdateIPSet(args) = waf_regional("UpdateIPSet", args)

"""
    ListRateBasedRules()

Returns an array of RuleSummary objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more Rules than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of Rules. For the second and subsequent ListRateBasedRules requests, specify the value of NextMarker from the previous response to get information about another batch of Rules.",
  "Limit": "Specifies the number of Rules that you want AWS WAF to return for this request. If you have more Rules than the number that you specify for Limit, the response includes a NextMarker value that you can use to get another batch of Rules."
}
"""
ListRateBasedRules() = waf_regional("ListRateBasedRules")
ListRateBasedRules(args) = waf_regional("ListRateBasedRules", args)

"""
    DeleteRateBasedRule()

Permanently deletes a RateBasedRule. You can't delete a rule if it's still used in any WebACL objects or if it still includes any predicates, such as ByteMatchSet objects. If you just want to remove a rule from a WebACL, use UpdateWebACL. To permanently delete a RateBasedRule from AWS WAF, perform the following steps:   Update the RateBasedRule to remove predicates, if any. For more information, see UpdateRateBasedRule.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteRateBasedRule request.   Submit a DeleteRateBasedRule request.  

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "RuleId": "The RuleId of the RateBasedRule that you want to delete. RuleId is returned by CreateRateBasedRule and by ListRateBasedRules."
}
"""
DeleteRateBasedRule(args) = waf_regional("DeleteRateBasedRule", args)

"""
    PutPermissionPolicy()

Attaches a IAM policy to the specified resource. The only supported use for this action is to share a RuleGroup across accounts. The PutPermissionPolicy is subject to the following restrictions:   You can attach only one policy with each PutPermissionPolicy request.   The policy must include an Effect, Action and Principal.     Effect must specify Allow.   The Action in the policy must be waf:UpdateWebACL, waf-regional:UpdateWebACL, waf:GetRuleGroup and waf-regional:GetRuleGroup . Any extra or wildcard actions in the policy will be rejected.   The policy cannot include a Resource parameter.   The ARN in the request must be a valid WAF RuleGroup ARN and the RuleGroup must exist in the same region.   The user making the request must be the owner of the RuleGroup.   Your policy must be composed using IAM Policy version 2012-10-17.   For more information, see IAM Policies.  An example of a valid policy parameter is shown in the Examples section below.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the RuleGroup to which you want to attach the policy.",
  "Policy": "The policy to attach to the specified RuleGroup."
}
"""
PutPermissionPolicy(args) = waf_regional("PutPermissionPolicy", args)

"""
    PutLoggingConfiguration()

Associates a LoggingConfiguration with a specified web ACL. You can access information about all traffic that AWS WAF inspects using the following steps:   Create an Amazon Kinesis Data Firehose.  Create the data firehose with a PUT source and in the region that you are operating. However, if you are capturing logs for Amazon CloudFront, always create the firehose in US East (N. Virginia).   Do not create the data firehose using a Kinesis stream as your source.    Associate that firehose to your web ACL using a PutLoggingConfiguration request.   When you successfully enable logging using a PutLoggingConfiguration request, AWS WAF will create a service linked role with the necessary permissions to write logs to the Amazon Kinesis Data Firehose. For more information, see Logging Web ACL Traffic Information in the AWS WAF Developer Guide.

Required Parameters
{
  "LoggingConfiguration": "The Amazon Kinesis Data Firehose that contains the inspected traffic information, the redacted fields details, and the Amazon Resource Name (ARN) of the web ACL to monitor.  When specifying Type in RedactedFields, you must use one of the following values: URI, QUERY_STRING, HEADER, or METHOD. "
}
"""
PutLoggingConfiguration(args) = waf_regional("PutLoggingConfiguration", args)

"""
    UpdateGeoMatchSet()

Inserts or deletes GeoMatchConstraint objects in an GeoMatchSet. For each GeoMatchConstraint object, you specify the following values:    Whether to insert or delete the object from the array. If you want to change an GeoMatchConstraint object, you delete the existing object and add a new one.   The Type. The only valid value for Type is Country.   The Value, which is a two character code for the country to add to the GeoMatchConstraint object. Valid codes are listed in GeoMatchConstraint Value.   To create and configure an GeoMatchSet, perform the following steps:   Submit a CreateGeoMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateGeoMatchSet request.   Submit an UpdateGeoMatchSet request to specify the country that you want AWS WAF to watch for.   When you update an GeoMatchSet, you specify the country that you want to add and/or the country that you want to delete. If you want to change a country, you delete the existing country and add the new one. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "Updates": "An array of GeoMatchSetUpdate objects that you want to insert into or delete from an GeoMatchSet. For more information, see the applicable data types:    GeoMatchSetUpdate: Contains Action and GeoMatchConstraint     GeoMatchConstraint: Contains Type and Value  You can have only one Type and Value per GeoMatchConstraint. To add multiple countries, include multiple GeoMatchSetUpdate objects in your request.  ",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "GeoMatchSetId": "The GeoMatchSetId of the GeoMatchSet that you want to update. GeoMatchSetId is returned by CreateGeoMatchSet and by ListGeoMatchSets."
}
"""
UpdateGeoMatchSet(args) = waf_regional("UpdateGeoMatchSet", args)

"""
    ListRegexMatchSets()

Returns an array of RegexMatchSetSummary objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more RegexMatchSet objects than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of ByteMatchSets. For the second and subsequent ListRegexMatchSets requests, specify the value of NextMarker from the previous response to get information about another batch of RegexMatchSet objects.",
  "Limit": "Specifies the number of RegexMatchSet objects that you want AWS WAF to return for this request. If you have more RegexMatchSet objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of RegexMatchSet objects."
}
"""
ListRegexMatchSets() = waf_regional("ListRegexMatchSets")
ListRegexMatchSets(args) = waf_regional("ListRegexMatchSets", args)

"""
    DeleteGeoMatchSet()

Permanently deletes a GeoMatchSet. You can't delete a GeoMatchSet if it's still used in any Rules or if it still includes any countries. If you just want to remove a GeoMatchSet from a Rule, use UpdateRule. To permanently delete a GeoMatchSet from AWS WAF, perform the following steps:   Update the GeoMatchSet to remove any countries. For more information, see UpdateGeoMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteGeoMatchSet request.   Submit a DeleteGeoMatchSet request.  

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "GeoMatchSetId": "The GeoMatchSetID of the GeoMatchSet that you want to delete. GeoMatchSetId is returned by CreateGeoMatchSet and by ListGeoMatchSets."
}
"""
DeleteGeoMatchSet(args) = waf_regional("DeleteGeoMatchSet", args)

"""
    ListSizeConstraintSets()

Returns an array of SizeConstraintSetSummary objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more SizeConstraintSets than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of SizeConstraintSets. For the second and subsequent ListSizeConstraintSets requests, specify the value of NextMarker from the previous response to get information about another batch of SizeConstraintSets.",
  "Limit": "Specifies the number of SizeConstraintSet objects that you want AWS WAF to return for this request. If you have more SizeConstraintSets objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of SizeConstraintSet objects."
}
"""
ListSizeConstraintSets() = waf_regional("ListSizeConstraintSets")
ListSizeConstraintSets(args) = waf_regional("ListSizeConstraintSets", args)

"""
    ListWebACLs()

Returns an array of WebACLSummary objects in the response.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more WebACL objects than the number that you specify for Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of WebACL objects. For the second and subsequent ListWebACLs requests, specify the value of NextMarker from the previous response to get information about another batch of WebACL objects.",
  "Limit": "Specifies the number of WebACL objects that you want AWS WAF to return for this request. If you have more WebACL objects than the number that you specify for Limit, the response includes a NextMarker value that you can use to get another batch of WebACL objects."
}
"""
ListWebACLs() = waf_regional("ListWebACLs")
ListWebACLs(args) = waf_regional("ListWebACLs", args)

"""
    ListLoggingConfigurations()

Returns an array of LoggingConfiguration objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more LoggingConfigurations than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of LoggingConfigurations. For the second and subsequent ListLoggingConfigurations requests, specify the value of NextMarker from the previous response to get information about another batch of ListLoggingConfigurations.",
  "Limit": "Specifies the number of LoggingConfigurations that you want AWS WAF to return for this request. If you have more LoggingConfigurations than the number that you specify for Limit, the response includes a NextMarker value that you can use to get another batch of LoggingConfigurations."
}
"""
ListLoggingConfigurations() = waf_regional("ListLoggingConfigurations")
ListLoggingConfigurations(args) = waf_regional("ListLoggingConfigurations", args)

"""
    AssociateWebACL()

Associates a web ACL with a resource, either an application load balancer or Amazon API Gateway stage.

Required Parameters
{
  "ResourceArn": "The ARN (Amazon Resource Name) of the resource to be protected, either an application load balancer or Amazon API Gateway stage.  The ARN should be in one of the following formats:   For an Application Load Balancer: arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/load-balancer-name/load-balancer-id     For an Amazon API Gateway stage: arn:aws:apigateway:region::/restapis/api-id/stages/stage-name    ",
  "WebACLId": "A unique identifier (ID) for the web ACL. "
}
"""
AssociateWebACL(args) = waf_regional("AssociateWebACL", args)

"""
    DeleteWebACL()

Permanently deletes a WebACL. You can't delete a WebACL if it still contains any Rules. To delete a WebACL, perform the following steps:   Update the WebACL to remove Rules, if any. For more information, see UpdateWebACL.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteWebACL request.   Submit a DeleteWebACL request.  

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "WebACLId": "The WebACLId of the WebACL that you want to delete. WebACLId is returned by CreateWebACL and by ListWebACLs."
}
"""
DeleteWebACL(args) = waf_regional("DeleteWebACL", args)

"""
    DisassociateWebACL()

Removes a web ACL from the specified resource, either an application load balancer or Amazon API Gateway stage.

Required Parameters
{
  "ResourceArn": "The ARN (Amazon Resource Name) of the resource from which the web ACL is being removed, either an application load balancer or Amazon API Gateway stage. The ARN should be in one of the following formats:   For an Application Load Balancer: arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/load-balancer-name/load-balancer-id     For an Amazon API Gateway stage: arn:aws:apigateway:region::/restapis/api-id/stages/stage-name    "
}
"""
DisassociateWebACL(args) = waf_regional("DisassociateWebACL", args)

"""
    GetRateBasedRuleManagedKeys()

Returns an array of IP addresses currently being blocked by the RateBasedRule that is specified by the RuleId. The maximum number of managed keys that will be blocked is 10,000. If more than 10,000 addresses exceed the rate limit, the 10,000 addresses with the highest rates will be blocked.

Required Parameters
{
  "RuleId": "The RuleId of the RateBasedRule for which you want to get a list of ManagedKeys. RuleId is returned by CreateRateBasedRule and by ListRateBasedRules."
}

Optional Parameters
{
  "NextMarker": "A null value and not currently used. Do not include this in your request."
}
"""
GetRateBasedRuleManagedKeys(args) = waf_regional("GetRateBasedRuleManagedKeys", args)

"""
    GetSqlInjectionMatchSet()

Returns the SqlInjectionMatchSet that is specified by SqlInjectionMatchSetId.

Required Parameters
{
  "SqlInjectionMatchSetId": "The SqlInjectionMatchSetId of the SqlInjectionMatchSet that you want to get. SqlInjectionMatchSetId is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets."
}
"""
GetSqlInjectionMatchSet(args) = waf_regional("GetSqlInjectionMatchSet", args)

"""
    GetSampledRequests()

Gets detailed information about a specified number of requests--a sample--that AWS WAF randomly selects from among the first 5,000 requests that your AWS resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.  GetSampledRequests returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, GetSampledRequests returns an updated time range. This new time range indicates the actual period during which AWS WAF selected the requests in the sample.

Required Parameters
{
  "MaxItems": "The number of requests that you want AWS WAF to return from among the first 5,000 requests that your AWS resource received during the time range. If your resource received fewer requests than the value of MaxItems, GetSampledRequests returns information about all of them. ",
  "WebAclId": "The WebACLId of the WebACL for which you want GetSampledRequests to return a sample of requests.",
  "TimeWindow": "The start date and time and the end date and time of the range for which you want GetSampledRequests to return a sample of requests. Specify the date and time in the following format: \"2016-09-27T14:50Z\". You can specify any time range in the previous three hours.",
  "RuleId": " RuleId is one of three values:   The RuleId of the Rule or the RuleGroupId of the RuleGroup for which you want GetSampledRequests to return a sample of requests.    Default_Action, which causes GetSampledRequests to return a sample of the requests that didn't match any of the rules in the specified WebACL.  "
}
"""
GetSampledRequests(args) = waf_regional("GetSampledRequests", args)

"""
    GetRegexPatternSet()

Returns the RegexPatternSet specified by RegexPatternSetId.

Required Parameters
{
  "RegexPatternSetId": "The RegexPatternSetId of the RegexPatternSet that you want to get. RegexPatternSetId is returned by CreateRegexPatternSet and by ListRegexPatternSets."
}
"""
GetRegexPatternSet(args) = waf_regional("GetRegexPatternSet", args)

"""
    ListActivatedRulesInRuleGroup()

Returns an array of ActivatedRule objects.

Optional Parameters
{
  "RuleGroupId": "The RuleGroupId of the RuleGroup for which you want to get a list of ActivatedRule objects.",
  "NextMarker": "If you specify a value for Limit and you have more ActivatedRules than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of ActivatedRules. For the second and subsequent ListActivatedRulesInRuleGroup requests, specify the value of NextMarker from the previous response to get information about another batch of ActivatedRules.",
  "Limit": "Specifies the number of ActivatedRules that you want AWS WAF to return for this request. If you have more ActivatedRules than the number that you specify for Limit, the response includes a NextMarker value that you can use to get another batch of ActivatedRules."
}
"""
ListActivatedRulesInRuleGroup() = waf_regional("ListActivatedRulesInRuleGroup")
ListActivatedRulesInRuleGroup(args) = waf_regional("ListActivatedRulesInRuleGroup", args)

"""
    GetRule()

Returns the Rule that is specified by the RuleId that you included in the GetRule request.

Required Parameters
{
  "RuleId": "The RuleId of the Rule that you want to get. RuleId is returned by CreateRule and by ListRules."
}
"""
GetRule(args) = waf_regional("GetRule", args)

"""
    ListXssMatchSets()

Returns an array of XssMatchSet objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more XssMatchSet objects than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of XssMatchSets. For the second and subsequent ListXssMatchSets requests, specify the value of NextMarker from the previous response to get information about another batch of XssMatchSets.",
  "Limit": "Specifies the number of XssMatchSet objects that you want AWS WAF to return for this request. If you have more XssMatchSet objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of Rules."
}
"""
ListXssMatchSets() = waf_regional("ListXssMatchSets")
ListXssMatchSets(args) = waf_regional("ListXssMatchSets", args)

"""
    UpdateXssMatchSet()

Inserts or deletes XssMatchTuple objects (filters) in an XssMatchSet. For each XssMatchTuple object, you specify the following values:    Action: Whether to insert the object into or delete the object from the array. To change an XssMatchTuple, you delete the existing object and add a new one.    FieldToMatch: The part of web requests that you want AWS WAF to inspect and, if you want AWS WAF to inspect a header or custom query parameter, the name of the header or parameter.    TextTransformation: Which text transformation, if any, to perform on the web request before inspecting the request for cross-site scripting attacks. You can only specify a single type of TextTransformation.   You use XssMatchSet objects to specify which CloudFront requests that you want to allow, block, or count. For example, if you're receiving requests that contain cross-site scripting attacks in the request body and you want to block the requests, you can create an XssMatchSet with the applicable settings, and then configure AWS WAF to block the requests.  To create and configure an XssMatchSet, perform the following steps:   Submit a CreateXssMatchSet request.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateIPSet request.   Submit an UpdateXssMatchSet request to specify the parts of web requests that you want AWS WAF to inspect for cross-site scripting attacks.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "Updates": "An array of XssMatchSetUpdate objects that you want to insert into or delete from an XssMatchSet. For more information, see the applicable data types:    XssMatchSetUpdate: Contains Action and XssMatchTuple     XssMatchTuple: Contains FieldToMatch and TextTransformation     FieldToMatch: Contains Data and Type   ",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "XssMatchSetId": "The XssMatchSetId of the XssMatchSet that you want to update. XssMatchSetId is returned by CreateXssMatchSet and by ListXssMatchSets."
}
"""
UpdateXssMatchSet(args) = waf_regional("UpdateXssMatchSet", args)

"""
    ListSqlInjectionMatchSets()

Returns an array of SqlInjectionMatchSet objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more SqlInjectionMatchSet objects than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of SqlInjectionMatchSets. For the second and subsequent ListSqlInjectionMatchSets requests, specify the value of NextMarker from the previous response to get information about another batch of SqlInjectionMatchSets.",
  "Limit": "Specifies the number of SqlInjectionMatchSet objects that you want AWS WAF to return for this request. If you have more SqlInjectionMatchSet objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of Rules."
}
"""
ListSqlInjectionMatchSets() = waf_regional("ListSqlInjectionMatchSets")
ListSqlInjectionMatchSets(args) = waf_regional("ListSqlInjectionMatchSets", args)

"""
    GetRegexMatchSet()

Returns the RegexMatchSet specified by RegexMatchSetId.

Required Parameters
{
  "RegexMatchSetId": "The RegexMatchSetId of the RegexMatchSet that you want to get. RegexMatchSetId is returned by CreateRegexMatchSet and by ListRegexMatchSets."
}
"""
GetRegexMatchSet(args) = waf_regional("GetRegexMatchSet", args)

"""
    UpdateByteMatchSet()

Inserts or deletes ByteMatchTuple objects (filters) in a ByteMatchSet. For each ByteMatchTuple object, you specify the following values:    Whether to insert or delete the object from the array. If you want to change a ByteMatchSetUpdate object, you delete the existing object and add a new one.   The part of a web request that you want AWS WAF to inspect, such as a query string or the value of the User-Agent header.    The bytes (typically a string that corresponds with ASCII characters) that you want AWS WAF to look for. For more information, including how you specify the values for the AWS WAF API and the AWS CLI or SDKs, see TargetString in the ByteMatchTuple data type.    Where to look, such as at the beginning or the end of a query string.   Whether to perform any conversions on the request, such as converting it to lowercase, before inspecting it for the specified string.   For example, you can add a ByteMatchSetUpdate object that matches web requests in which User-Agent headers contain the string BadBot. You can then configure AWS WAF to block those requests. To create and configure a ByteMatchSet, perform the following steps:   Create a ByteMatchSet. For more information, see CreateByteMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateByteMatchSet request.   Submit an UpdateByteMatchSet request to specify the part of the request that you want AWS WAF to inspect (for example, the header or the URI) and the value that you want AWS WAF to watch for.   For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "ByteMatchSetId": "The ByteMatchSetId of the ByteMatchSet that you want to update. ByteMatchSetId is returned by CreateByteMatchSet and by ListByteMatchSets.",
  "Updates": "An array of ByteMatchSetUpdate objects that you want to insert into or delete from a ByteMatchSet. For more information, see the applicable data types:    ByteMatchSetUpdate: Contains Action and ByteMatchTuple     ByteMatchTuple: Contains FieldToMatch, PositionalConstraint, TargetString, and TextTransformation     FieldToMatch: Contains Data and Type   ",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
UpdateByteMatchSet(args) = waf_regional("UpdateByteMatchSet", args)

"""
    UpdateRuleGroup()

Inserts or deletes ActivatedRule objects in a RuleGroup. You can only insert REGULAR rules into a rule group. You can have a maximum of ten rules per rule group. To create and configure a RuleGroup, perform the following steps:   Create and update the Rules that you want to include in the RuleGroup. See CreateRule.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRuleGroup request.   Submit an UpdateRuleGroup request to add Rules to the RuleGroup.   Create and update a WebACL that contains the RuleGroup. See CreateWebACL.   If you want to replace one Rule with another, you delete the existing one and add the new one. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "RuleGroupId": "The RuleGroupId of the RuleGroup that you want to update. RuleGroupId is returned by CreateRuleGroup and by ListRuleGroups.",
  "Updates": "An array of RuleGroupUpdate objects that you want to insert into or delete from a RuleGroup. You can only insert REGULAR rules into a rule group.  ActivatedRule|OverrideAction applies only when updating or adding a RuleGroup to a WebACL. In this case you do not use ActivatedRule|Action. For all other update requests, ActivatedRule|Action is used instead of ActivatedRule|OverrideAction.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
UpdateRuleGroup(args) = waf_regional("UpdateRuleGroup", args)

"""
    DeleteIPSet()

Permanently deletes an IPSet. You can't delete an IPSet if it's still used in any Rules or if it still includes any IP addresses. If you just want to remove an IPSet from a Rule, use UpdateRule. To permanently delete an IPSet from AWS WAF, perform the following steps:   Update the IPSet to remove IP address ranges, if any. For more information, see UpdateIPSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteIPSet request.   Submit a DeleteIPSet request.  

Required Parameters
{
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "IPSetId": "The IPSetId of the IPSet that you want to delete. IPSetId is returned by CreateIPSet and by ListIPSets."
}
"""
DeleteIPSet(args) = waf_regional("DeleteIPSet", args)

"""
    DeleteSqlInjectionMatchSet()

Permanently deletes a SqlInjectionMatchSet. You can't delete a SqlInjectionMatchSet if it's still used in any Rules or if it still contains any SqlInjectionMatchTuple objects. If you just want to remove a SqlInjectionMatchSet from a Rule, use UpdateRule. To permanently delete a SqlInjectionMatchSet from AWS WAF, perform the following steps:   Update the SqlInjectionMatchSet to remove filters, if any. For more information, see UpdateSqlInjectionMatchSet.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of a DeleteSqlInjectionMatchSet request.   Submit a DeleteSqlInjectionMatchSet request.  

Required Parameters
{
  "SqlInjectionMatchSetId": "The SqlInjectionMatchSetId of the SqlInjectionMatchSet that you want to delete. SqlInjectionMatchSetId is returned by CreateSqlInjectionMatchSet and by ListSqlInjectionMatchSets.",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken."
}
"""
DeleteSqlInjectionMatchSet(args) = waf_regional("DeleteSqlInjectionMatchSet", args)

"""
    ListByteMatchSets()

Returns an array of ByteMatchSetSummary objects.

Optional Parameters
{
  "NextMarker": "If you specify a value for Limit and you have more ByteMatchSets than the value of Limit, AWS WAF returns a NextMarker value in the response that allows you to list another group of ByteMatchSets. For the second and subsequent ListByteMatchSets requests, specify the value of NextMarker from the previous response to get information about another batch of ByteMatchSets.",
  "Limit": "Specifies the number of ByteMatchSet objects that you want AWS WAF to return for this request. If you have more ByteMatchSets objects than the number you specify for Limit, the response includes a NextMarker value that you can use to get another batch of ByteMatchSet objects."
}
"""
ListByteMatchSets() = waf_regional("ListByteMatchSets")
ListByteMatchSets(args) = waf_regional("ListByteMatchSets", args)

"""
    GetXssMatchSet()

Returns the XssMatchSet that is specified by XssMatchSetId.

Required Parameters
{
  "XssMatchSetId": "The XssMatchSetId of the XssMatchSet that you want to get. XssMatchSetId is returned by CreateXssMatchSet and by ListXssMatchSets."
}
"""
GetXssMatchSet(args) = waf_regional("GetXssMatchSet", args)

"""
    UpdateRule()

Inserts or deletes Predicate objects in a Rule. Each Predicate object identifies a predicate, such as a ByteMatchSet or an IPSet, that specifies the web requests that you want to allow, block, or count. If you add more than one predicate to a Rule, a request must match all of the specifications to be allowed, blocked, or counted. For example, suppose that you add the following to a Rule:    A ByteMatchSet that matches the value BadBot in the User-Agent header   An IPSet that matches the IP address 192.0.2.44    You then add the Rule to a WebACL and specify that you want to block requests that satisfy the Rule. For a request to be blocked, the User-Agent header in the request must contain the value BadBot and the request must originate from the IP address 192.0.2.44. To create and configure a Rule, perform the following steps:   Create and update the predicates that you want to include in the Rule.   Create the Rule. See CreateRule.   Use GetChangeToken to get the change token that you provide in the ChangeToken parameter of an UpdateRule request.   Submit an UpdateRule request to add predicates to the Rule.   Create and update a WebACL that contains the Rule. See CreateWebACL.   If you want to replace one ByteMatchSet or IPSet with another, you delete the existing one and add the new one. For more information about how to use the AWS WAF API to allow or block HTTP requests, see the AWS WAF Developer Guide.

Required Parameters
{
  "Updates": "An array of RuleUpdate objects that you want to insert into or delete from a Rule. For more information, see the applicable data types:    RuleUpdate: Contains Action and Predicate     Predicate: Contains DataId, Negated, and Type     FieldToMatch: Contains Data and Type   ",
  "ChangeToken": "The value returned by the most recent call to GetChangeToken.",
  "RuleId": "The RuleId of the Rule that you want to update. RuleId is returned by CreateRule and by ListRules."
}
"""
UpdateRule(args) = waf_regional("UpdateRule", args)
