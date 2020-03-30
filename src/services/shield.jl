include("../AWSServices.jl")
using .AWSServices: shield

"""
    DescribeSubscription()

Provides details about the AWS Shield Advanced subscription for an account.
"""
DescribeSubscription() = shield("DescribeSubscription")
DescribeSubscription(args) = shield("DescribeSubscription", args)

"""
    AssociateDRTRole()

Authorizes the DDoS Response team (DRT), using the specified role, to access your AWS account to assist with DDoS attack mitigation during potential attacks. This enables the DRT to inspect your AWS WAF configuration and create or update AWS WAF rules and web ACLs. You can associate only one RoleArn with your subscription. If you submit an AssociateDRTRole request for an account that already has an associated role, the new RoleArn will replace the existing RoleArn.  Prior to making the AssociateDRTRole request, you must attach the AWSShieldDRTAccessPolicy managed policy to the role you will specify in the request. For more information see Attaching and Detaching IAM Policies. The role must also trust the service principal  drt.shield.amazonaws.com. For more information, see IAM JSON Policy Elements: Principal. The DRT will have access only to your AWS WAF and Shield resources. By submitting this request, you authorize the DRT to inspect your AWS WAF and Shield configuration and create and update AWS WAF rules and web ACLs on your behalf. The DRT takes these actions only if explicitly authorized by you. You must have the iam:PassRole permission to make an AssociateDRTRole request. For more information, see Granting a User Permissions to Pass a Role to an AWS Service.  To use the services of the DRT and make an AssociateDRTRole request, you must be subscribed to the Business Support plan or the Enterprise Support plan.

Required Parameters
{
  "RoleArn": "The Amazon Resource Name (ARN) of the role the DRT will use to access your AWS account. Prior to making the AssociateDRTRole request, you must attach the AWSShieldDRTAccessPolicy managed policy to this role. For more information see Attaching and Detaching IAM Policies."
}
"""
AssociateDRTRole(args) = shield("AssociateDRTRole", args)

"""
    CreateSubscription()

Activates AWS Shield Advanced for an account. As part of this request you can specify EmergencySettings that automaticaly grant the DDoS response team (DRT) needed permissions to assist you during a suspected DDoS attack. For more information see Authorize the DDoS Response Team to Create Rules and Web ACLs on Your Behalf. To use the services of the DRT, you must be subscribed to the Business Support plan or the Enterprise Support plan. When you initally create a subscription, your subscription is set to be automatically renewed at the end of the existing subscription period. You can change this by submitting an UpdateSubscription request. 
"""
CreateSubscription() = shield("CreateSubscription")
CreateSubscription(args) = shield("CreateSubscription", args)

"""
    DescribeEmergencyContactSettings()

Lists the email addresses that the DRT can use to contact you during a suspected attack.
"""
DescribeEmergencyContactSettings() = shield("DescribeEmergencyContactSettings")
DescribeEmergencyContactSettings(args) = shield("DescribeEmergencyContactSettings", args)

"""
    DescribeDRTAccess()

Returns the current role and list of Amazon S3 log buckets used by the DDoS Response team (DRT) to access your AWS account while assisting with attack mitigation.
"""
DescribeDRTAccess() = shield("DescribeDRTAccess")
DescribeDRTAccess(args) = shield("DescribeDRTAccess", args)

"""
    UpdateSubscription()

Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.

Optional Parameters
{
  "AutoRenew": "When you initally create a subscription, AutoRenew is set to ENABLED. If ENABLED, the subscription will be automatically renewed at the end of the existing subscription period. You can change this by submitting an UpdateSubscription request. If the UpdateSubscription request does not included a value for AutoRenew, the existing value for AutoRenew remains unchanged."
}
"""
UpdateSubscription() = shield("UpdateSubscription")
UpdateSubscription(args) = shield("UpdateSubscription", args)

"""
    UpdateEmergencyContactSettings()

Updates the details of the list of email addresses that the DRT can use to contact you during a suspected attack.

Optional Parameters
{
  "EmergencyContactList": "A list of email addresses that the DRT can use to contact you during a suspected attack."
}
"""
UpdateEmergencyContactSettings() = shield("UpdateEmergencyContactSettings")
UpdateEmergencyContactSettings(args) = shield("UpdateEmergencyContactSettings", args)

"""
    DescribeAttack()

Describes the details of a DDoS attack. 

Required Parameters
{
  "AttackId": "The unique identifier (ID) for the attack that to be described."
}
"""
DescribeAttack(args) = shield("DescribeAttack", args)

"""
    ListProtections()

Lists all Protection objects for the account.

Optional Parameters
{
  "MaxResults": "The maximum number of Protection objects to be returned. If this is left blank the first 20 results will be returned. This is a maximum value; it is possible that AWS WAF will return the results in smaller batches. That is, the number of Protection objects returned could be less than MaxResults, even if there are still more Protection objects yet to return. If there are more Protection objects to return, AWS WAF will always also return a NextToken.",
  "NextToken": "The ListProtectionsRequest.NextToken value from a previous call to ListProtections. Pass null if this is the first call."
}
"""
ListProtections() = shield("ListProtections")
ListProtections(args) = shield("ListProtections", args)

"""
    DeleteProtection()

Deletes an AWS Shield Advanced Protection.

Required Parameters
{
  "ProtectionId": "The unique identifier (ID) for the Protection object to be deleted."
}
"""
DeleteProtection(args) = shield("DeleteProtection", args)

"""
    DeleteSubscription()

Removes AWS Shield Advanced from an account. AWS Shield Advanced requires a 1-year subscription commitment. You cannot delete a subscription prior to the completion of that commitment. 
"""
DeleteSubscription() = shield("DeleteSubscription")
DeleteSubscription(args) = shield("DeleteSubscription", args)

"""
    AssociateHealthCheck()

Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your AWS resource to improve responsiveness and accuracy in attack detection and mitigation.  You define the health check in Route 53 and then associate it with your Shield Advanced protection. For more information, see Shield Advanced Health-Based Detection in the AWS WAF and AWS Shield Developer Guide. 

Required Parameters
{
  "ProtectionId": "The unique identifier (ID) for the Protection object to add the health check association to. ",
  "HealthCheckArn": "The Amazon Resource Name (ARN) of the health check to associate with the protection."
}
"""
AssociateHealthCheck(args) = shield("AssociateHealthCheck", args)

"""
    DisassociateDRTRole()

Removes the DDoS Response team's (DRT) access to your AWS account. To make a DisassociateDRTRole request, you must be subscribed to the Business Support plan or the Enterprise Support plan. However, if you are not subscribed to one of these support plans, but had been previously and had granted the DRT access to your account, you can submit a DisassociateDRTRole request to remove this access.
"""
DisassociateDRTRole() = shield("DisassociateDRTRole")
DisassociateDRTRole(args) = shield("DisassociateDRTRole", args)

"""
    DisassociateHealthCheck()

Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your AWS resource to improve responsiveness and accuracy in attack detection and mitigation.  You define the health check in Route 53 and then associate or disassociate it with your Shield Advanced protection. For more information, see Shield Advanced Health-Based Detection in the AWS WAF and AWS Shield Developer Guide. 

Required Parameters
{
  "ProtectionId": "The unique identifier (ID) for the Protection object to remove the health check association from. ",
  "HealthCheckArn": "The Amazon Resource Name (ARN) of the health check that is associated with the protection."
}
"""
DisassociateHealthCheck(args) = shield("DisassociateHealthCheck", args)

"""
    CreateProtection()

Enables AWS Shield Advanced for a specific AWS resource. The resource can be an Amazon CloudFront distribution, Elastic Load Balancing load balancer, AWS Global Accelerator accelerator, Elastic IP Address, or an Amazon Route 53 hosted zone. You can add protection to only a single resource with each CreateProtection request. If you want to add protection to multiple resources at once, use the AWS WAF console. For more information see Getting Started with AWS Shield Advanced and Add AWS Shield Advanced Protection to more AWS Resources.

Required Parameters
{
  "ResourceArn": "The ARN (Amazon Resource Name) of the resource to be protected. The ARN should be in one of the following formats:   For an Application Load Balancer: arn:aws:elasticloadbalancing:region:account-id:loadbalancer/app/load-balancer-name/load-balancer-id     For an Elastic Load Balancer (Classic Load Balancer): arn:aws:elasticloadbalancing:region:account-id:loadbalancer/load-balancer-name     For an AWS CloudFront distribution: arn:aws:cloudfront::account-id:distribution/distribution-id     For an AWS Global Accelerator accelerator: arn:aws:globalaccelerator::account-id:accelerator/accelerator-id     For Amazon Route 53: arn:aws:route53:::hostedzone/hosted-zone-id     For an Elastic IP address: arn:aws:ec2:region:account-id:eip-allocation/allocation-id    ",
  "Name": "Friendly name for the Protection you are creating."
}
"""
CreateProtection(args) = shield("CreateProtection", args)

"""
    AssociateDRTLogBucket()

Authorizes the DDoS Response team (DRT) to access the specified Amazon S3 bucket containing your AWS WAF logs. You can associate up to 10 Amazon S3 buckets with your subscription. To use the services of the DRT and make an AssociateDRTLogBucket request, you must be subscribed to the Business Support plan or the Enterprise Support plan.

Required Parameters
{
  "LogBucket": "The Amazon S3 bucket that contains your AWS WAF logs."
}
"""
AssociateDRTLogBucket(args) = shield("AssociateDRTLogBucket", args)

"""
    ListAttacks()

Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.

Optional Parameters
{
  "StartTime": "The start of the time period for the attacks. This is a timestamp type. The sample request above indicates a number type because the default used by WAF is Unix time in seconds. However any valid timestamp format is allowed. ",
  "MaxResults": "The maximum number of AttackSummary objects to be returned. If this is left blank, the first 20 results will be returned. This is a maximum value; it is possible that AWS WAF will return the results in smaller batches. That is, the number of AttackSummary objects returned could be less than MaxResults, even if there are still more AttackSummary objects yet to return. If there are more AttackSummary objects to return, AWS WAF will always also return a NextToken.",
  "ResourceArns": "The ARN (Amazon Resource Name) of the resource that was attacked. If this is left blank, all applicable resources for this account will be included.",
  "EndTime": "The end of the time period for the attacks. This is a timestamp type. The sample request above indicates a number type because the default used by WAF is Unix time in seconds. However any valid timestamp format is allowed. ",
  "NextToken": "The ListAttacksRequest.NextMarker value from a previous call to ListAttacksRequest. Pass null if this is the first call."
}
"""
ListAttacks() = shield("ListAttacks")
ListAttacks(args) = shield("ListAttacks", args)

"""
    DisassociateDRTLogBucket()

Removes the DDoS Response team's (DRT) access to the specified Amazon S3 bucket containing your AWS WAF logs. To make a DisassociateDRTLogBucket request, you must be subscribed to the Business Support plan or the Enterprise Support plan. However, if you are not subscribed to one of these support plans, but had been previously and had granted the DRT access to your account, you can submit a DisassociateDRTLogBucket request to remove this access.

Required Parameters
{
  "LogBucket": "The Amazon S3 bucket that contains your AWS WAF logs."
}
"""
DisassociateDRTLogBucket(args) = shield("DisassociateDRTLogBucket", args)

"""
    GetSubscriptionState()

Returns the SubscriptionState, either Active or Inactive.
"""
GetSubscriptionState() = shield("GetSubscriptionState")
GetSubscriptionState(args) = shield("GetSubscriptionState", args)

"""
    DescribeProtection()

Lists the details of a Protection object.

Optional Parameters
{
  "ResourceArn": "The ARN (Amazon Resource Name) of the AWS resource for the Protection object that is described. When submitting the DescribeProtection request you must provide either the ResourceArn or the ProtectionID, but not both.",
  "ProtectionId": "The unique identifier (ID) for the Protection object that is described. When submitting the DescribeProtection request you must provide either the ResourceArn or the ProtectionID, but not both."
}
"""
DescribeProtection() = shield("DescribeProtection")
DescribeProtection(args) = shield("DescribeProtection", args)
