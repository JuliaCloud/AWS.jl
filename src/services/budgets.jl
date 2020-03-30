include("../AWSServices.jl")
using .AWSServices: budgets

"""
    DescribeSubscribersForNotification()

Lists the subscribers that are associated with a notification.

Required Parameters
{
  "AccountId": "The accountId that is associated with the budget whose subscribers you want descriptions of.",
  "BudgetName": "The name of the budget whose subscribers you want descriptions of.",
  "Notification": "The notification whose subscribers you want to list."
}

Optional Parameters
{
  "MaxResults": "An optional integer that represents how many entries a paginated response contains. The maximum is 100.",
  "NextToken": "The pagination token that you include in your request to indicate the next set of results that you want to retrieve."
}
"""
DescribeSubscribersForNotification(args) = budgets("DescribeSubscribersForNotification", args)

"""
    DeleteBudget()

Deletes a budget. You can delete your budget at any time.  Deleting a budget also deletes the notifications and subscribers that are associated with that budget. 

Required Parameters
{
  "AccountId": "The accountId that is associated with the budget that you want to delete.",
  "BudgetName": "The name of the budget that you want to delete."
}
"""
DeleteBudget(args) = budgets("DeleteBudget", args)

"""
    DescribeBudgets()

Lists the budgets that are associated with an account.  The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the Examples section.  

Required Parameters
{
  "AccountId": "The accountId that is associated with the budgets that you want descriptions of."
}

Optional Parameters
{
  "MaxResults": "An optional integer that represents how many entries a paginated response contains. The maximum is 100.",
  "NextToken": "The pagination token that you include in your request to indicate the next set of results that you want to retrieve."
}
"""
DescribeBudgets(args) = budgets("DescribeBudgets", args)

"""
    CreateBudget()

Creates a budget and, if included, notifications and subscribers.   Only one of BudgetLimit or PlannedBudgetLimits can be present in the syntax at one time. Use the syntax that matches your case. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the Examples section.  

Required Parameters
{
  "Budget": "The budget object that you want to create.",
  "AccountId": "The accountId that is associated with the budget."
}

Optional Parameters
{
  "NotificationsWithSubscribers": "A notification that you want to associate with a budget. A budget can have up to five notifications, and each notification can have one SNS subscriber and up to 10 email subscribers. If you include notifications and subscribers in your CreateBudget call, AWS creates the notifications and subscribers for you."
}
"""
CreateBudget(args) = budgets("CreateBudget", args)

"""
    DeleteSubscriber()

Deletes a subscriber.  Deleting the last subscriber to a notification also deletes the notification. 

Required Parameters
{
  "Subscriber": "The subscriber that you want to delete.",
  "AccountId": "The accountId that is associated with the budget whose subscriber you want to delete.",
  "BudgetName": "The name of the budget whose subscriber you want to delete.",
  "Notification": "The notification whose subscriber you want to delete."
}
"""
DeleteSubscriber(args) = budgets("DeleteSubscriber", args)

"""
    UpdateNotification()

Updates a notification.

Required Parameters
{
  "OldNotification": "The previous notification that is associated with a budget.",
  "NewNotification": "The updated notification to be associated with a budget.",
  "AccountId": "The accountId that is associated with the budget whose notification you want to update.",
  "BudgetName": "The name of the budget whose notification you want to update."
}
"""
UpdateNotification(args) = budgets("UpdateNotification", args)

"""
    CreateNotification()

Creates a notification. You must create the budget before you create the associated notification.

Required Parameters
{
  "Subscribers": "A list of subscribers that you want to associate with the notification. Each notification can have one SNS subscriber and up to 10 email subscribers.",
  "AccountId": "The accountId that is associated with the budget that you want to create a notification for.",
  "BudgetName": "The name of the budget that you want AWS to notify you about. Budget names must be unique within an account.",
  "Notification": "The notification that you want to create."
}
"""
CreateNotification(args) = budgets("CreateNotification", args)

"""
    CreateSubscriber()

Creates a subscriber. You must create the associated budget and notification before you create the subscriber.

Required Parameters
{
  "Subscriber": "The subscriber that you want to associate with a budget notification.",
  "AccountId": "The accountId that is associated with the budget that you want to create a subscriber for.",
  "BudgetName": "The name of the budget that you want to subscribe to. Budget names must be unique within an account.",
  "Notification": "The notification that you want to create a subscriber for."
}
"""
CreateSubscriber(args) = budgets("CreateSubscriber", args)

"""
    DescribeBudget()

Describes a budget.  The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the Examples section.  

Required Parameters
{
  "AccountId": "The accountId that is associated with the budget that you want a description of.",
  "BudgetName": "The name of the budget that you want a description of."
}
"""
DescribeBudget(args) = budgets("DescribeBudget", args)

"""
    UpdateBudget()

Updates a budget. You can change every part of a budget except for the budgetName and the calculatedSpend. When you modify a budget, the calculatedSpend drops to zero until AWS has new usage data to use for forecasting.  Only one of BudgetLimit or PlannedBudgetLimits can be present in the syntax at one time. Use the syntax that matches your case. The Request Syntax section shows the BudgetLimit syntax. For PlannedBudgetLimits, see the Examples section.  

Required Parameters
{
  "NewBudget": "The budget that you want to update your budget to.",
  "AccountId": "The accountId that is associated with the budget that you want to update."
}
"""
UpdateBudget(args) = budgets("UpdateBudget", args)

"""
    DescribeBudgetPerformanceHistory()

Describes the history for DAILY, MONTHLY, and QUARTERLY budgets. Budget history isn't available for ANNUAL budgets.

Required Parameters
{
  "AccountId": "",
  "BudgetName": ""
}

Optional Parameters
{
  "MaxResults": "",
  "NextToken": "",
  "TimePeriod": "Retrieves how often the budget went into an ALARM state for the specified time period."
}
"""
DescribeBudgetPerformanceHistory(args) = budgets("DescribeBudgetPerformanceHistory", args)

"""
    DescribeNotificationsForBudget()

Lists the notifications that are associated with a budget.

Required Parameters
{
  "AccountId": "The accountId that is associated with the budget whose notifications you want descriptions of.",
  "BudgetName": "The name of the budget whose notifications you want descriptions of."
}

Optional Parameters
{
  "MaxResults": "An optional integer that represents how many entries a paginated response contains. The maximum is 100.",
  "NextToken": "The pagination token that you include in your request to indicate the next set of results that you want to retrieve."
}
"""
DescribeNotificationsForBudget(args) = budgets("DescribeNotificationsForBudget", args)

"""
    UpdateSubscriber()

Updates a subscriber.

Required Parameters
{
  "AccountId": "The accountId that is associated with the budget whose subscriber you want to update.",
  "OldSubscriber": "The previous subscriber that is associated with a budget notification.",
  "BudgetName": "The name of the budget whose subscriber you want to update.",
  "Notification": "The notification whose subscriber you want to update.",
  "NewSubscriber": "The updated subscriber that is associated with a budget notification."
}
"""
UpdateSubscriber(args) = budgets("UpdateSubscriber", args)

"""
    DeleteNotification()

Deletes a notification.  Deleting a notification also deletes the subscribers that are associated with the notification. 

Required Parameters
{
  "AccountId": "The accountId that is associated with the budget whose notification you want to delete.",
  "BudgetName": "The name of the budget whose notification you want to delete.",
  "Notification": "The notification that you want to delete."
}
"""
DeleteNotification(args) = budgets("DeleteNotification", args)
