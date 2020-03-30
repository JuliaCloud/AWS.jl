include("../AWSServices.jl")
using .AWSServices: cloudsearch

"""
    UpdateServiceAccessPolicies()

Configures the access rules that control access to the domain's document and search endpoints. For more information, see  Configuring Access for an Amazon CloudSearch Domain.

Required Parameters
{
  "DomainName": "",
  "AccessPolicies": "The access rules you want to configure. These rules replace any existing rules. "
}
"""
UpdateServiceAccessPolicies(args) = cloudsearch("UpdateServiceAccessPolicies", args)

"""
    UpdateAvailabilityOptions()

Configures the availability options for a domain. Enabling the Multi-AZ option expands an Amazon CloudSearch domain to an additional Availability Zone in the same Region to increase fault tolerance in the event of a service disruption. Changes to the Multi-AZ option can take about half an hour to become active. For more information, see Configuring Availability Options in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "",
  "MultiAZ": "You expand an existing search domain to a second Availability Zone by setting the Multi-AZ option to true. Similarly, you can turn off the Multi-AZ option to downgrade the domain to a single Availability Zone by setting the Multi-AZ option to false. "
}
"""
UpdateAvailabilityOptions(args) = cloudsearch("UpdateAvailabilityOptions", args)

"""
    DescribeDomains()

Gets information about the search domains owned by this account. Can be limited to specific domains. Shows all domains by default. To get the number of searchable documents in a domain, use the console or submit a matchall request to your domain's search endpoint: q=matchall&amp;amp;q.parser=structured&amp;amp;size=0. For more information, see Getting Information about a Search Domain in the Amazon CloudSearch Developer Guide.

Optional Parameters
{
  "DomainNames": "The names of the domains you want to include in the response."
}
"""
DescribeDomains() = cloudsearch("DescribeDomains")
DescribeDomains(args) = cloudsearch("DescribeDomains", args)

"""
    DefineSuggester()

Configures a suggester for a domain. A suggester enables you to display possible matches before users finish typing their queries. When you configure a suggester, you must specify the name of the text field you want to search for possible matches and a unique name for the suggester. For more information, see Getting Search Suggestions in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "",
  "Suggester": ""
}
"""
DefineSuggester(args) = cloudsearch("DefineSuggester", args)

"""
    DescribeAvailabilityOptions()

Gets the availability options configured for a domain. By default, shows the configuration with any pending changes. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see Configuring Availability Options in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "The name of the domain you want to describe."
}

Optional Parameters
{
  "Deployed": "Whether to display the deployed configuration (true) or include any pending changes (false). Defaults to false."
}
"""
DescribeAvailabilityOptions(args) = cloudsearch("DescribeAvailabilityOptions", args)

"""
    DescribeServiceAccessPolicies()

Gets information about the access policies that control access to the domain's document and search endpoints. By default, shows the configuration with any pending changes. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see Configuring Access for a Search Domain in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "The name of the domain you want to describe."
}

Optional Parameters
{
  "Deployed": "Whether to display the deployed configuration (true) or include any pending changes (false). Defaults to false."
}
"""
DescribeServiceAccessPolicies(args) = cloudsearch("DescribeServiceAccessPolicies", args)

"""
    DescribeAnalysisSchemes()

Gets the analysis schemes configured for a domain. An analysis scheme defines language-specific text processing options for a text field. Can be limited to specific analysis schemes by name. By default, shows all analysis schemes and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see Configuring Analysis Schemes in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "The name of the domain you want to describe."
}

Optional Parameters
{
  "AnalysisSchemeNames": "The analysis schemes you want to describe.",
  "Deployed": "Whether to display the deployed configuration (true) or include any pending changes (false). Defaults to false."
}
"""
DescribeAnalysisSchemes(args) = cloudsearch("DescribeAnalysisSchemes", args)

"""
    DefineIndexField()

Configures an IndexField for the search domain. Used to create new fields and modify existing ones. You must specify the name of the domain you are configuring and an index field configuration. The index field configuration specifies a unique name, the index field type, and the options you want to configure for the field. The options you can specify depend on the IndexFieldType. If the field exists, the new configuration replaces the old one. For more information, see Configuring Index Fields in the Amazon CloudSearch Developer Guide. 

Required Parameters
{
  "DomainName": "",
  "IndexField": "The index field and field options you want to configure. "
}
"""
DefineIndexField(args) = cloudsearch("DefineIndexField", args)

"""
    DefineAnalysisScheme()

Configures an analysis scheme that can be applied to a text or text-array field to define language-specific text processing options. For more information, see Configuring Analysis Schemes in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "AnalysisScheme": "",
  "DomainName": ""
}
"""
DefineAnalysisScheme(args) = cloudsearch("DefineAnalysisScheme", args)

"""
    DefineExpression()

Configures an Expression for the search domain. Used to create new expressions and modify existing ones. If the expression exists, the new configuration replaces the old one. For more information, see Configuring Expressions in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "",
  "Expression": ""
}
"""
DefineExpression(args) = cloudsearch("DefineExpression", args)

"""
    DeleteExpression()

Removes an Expression from the search domain. For more information, see Configuring Expressions in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "",
  "ExpressionName": "The name of the Expression to delete."
}
"""
DeleteExpression(args) = cloudsearch("DeleteExpression", args)

"""
    DescribeExpressions()

Gets the expressions configured for the search domain. Can be limited to specific expressions by name. By default, shows all expressions and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see Configuring Expressions in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "The name of the domain you want to describe."
}

Optional Parameters
{
  "Deployed": "Whether to display the deployed configuration (true) or include any pending changes (false). Defaults to false.",
  "ExpressionNames": "Limits the DescribeExpressions response to the specified expressions. If not specified, all expressions are shown."
}
"""
DescribeExpressions(args) = cloudsearch("DescribeExpressions", args)

"""
    DescribeIndexFields()

Gets information about the index fields configured for the search domain. Can be limited to specific fields by name. By default, shows all fields and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see Getting Domain Information in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "The name of the domain you want to describe."
}

Optional Parameters
{
  "Deployed": "Whether to display the deployed configuration (true) or include any pending changes (false). Defaults to false.",
  "FieldNames": "A list of the index fields you want to describe. If not specified, information is returned for all configured index fields."
}
"""
DescribeIndexFields(args) = cloudsearch("DescribeIndexFields", args)

"""
    DeleteSuggester()

Deletes a suggester. For more information, see Getting Search Suggestions in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "",
  "SuggesterName": "Specifies the name of the suggester you want to delete."
}
"""
DeleteSuggester(args) = cloudsearch("DeleteSuggester", args)

"""
    DeleteIndexField()

Removes an IndexField from the search domain. For more information, see Configuring Index Fields in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "",
  "IndexFieldName": "The name of the index field your want to remove from the domain's indexing options."
}
"""
DeleteIndexField(args) = cloudsearch("DeleteIndexField", args)

"""
    DescribeSuggesters()

Gets the suggesters configured for a domain. A suggester enables you to display possible matches before users finish typing their queries. Can be limited to specific suggesters by name. By default, shows all suggesters and includes any pending changes to the configuration. Set the Deployed option to true to show the active configuration and exclude pending changes. For more information, see Getting Search Suggestions in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "The name of the domain you want to describe."
}

Optional Parameters
{
  "SuggesterNames": "The suggesters you want to describe.",
  "Deployed": "Whether to display the deployed configuration (true) or include any pending changes (false). Defaults to false."
}
"""
DescribeSuggesters(args) = cloudsearch("DescribeSuggesters", args)

"""
    DeleteAnalysisScheme()

Deletes an analysis scheme. For more information, see Configuring Analysis Schemes in the Amazon CloudSearch Developer Guide. 

Required Parameters
{
  "DomainName": "",
  "AnalysisSchemeName": "The name of the analysis scheme you want to delete."
}
"""
DeleteAnalysisScheme(args) = cloudsearch("DeleteAnalysisScheme", args)

"""
    BuildSuggesters()

Indexes the search suggestions. For more information, see Configuring Suggesters in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": ""
}
"""
BuildSuggesters(args) = cloudsearch("BuildSuggesters", args)

"""
    ListDomainNames()

Lists all search domains owned by an account.
"""
ListDomainNames() = cloudsearch("ListDomainNames")
ListDomainNames(args) = cloudsearch("ListDomainNames", args)

"""
    DeleteDomain()

Permanently deletes a search domain and all of its data. Once a domain has been deleted, it cannot be recovered. For more information, see Deleting a Search Domain in the Amazon CloudSearch Developer Guide. 

Required Parameters
{
  "DomainName": "The name of the domain you want to permanently delete."
}
"""
DeleteDomain(args) = cloudsearch("DeleteDomain", args)

"""
    DescribeDomainEndpointOptions()

Returns the domain's endpoint options, specifically whether all requests to the domain must arrive over HTTPS. For more information, see Configuring Domain Endpoint Options in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "A string that represents the name of a domain."
}

Optional Parameters
{
  "Deployed": "Whether to retrieve the latest configuration (which might be in a Processing state) or the current, active configuration. Defaults to false."
}
"""
DescribeDomainEndpointOptions(args) = cloudsearch("DescribeDomainEndpointOptions", args)

"""
    UpdateDomainEndpointOptions()

Updates the domain's endpoint options, specifically whether all requests to the domain must arrive over HTTPS. For more information, see Configuring Domain Endpoint Options in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "A string that represents the name of a domain.",
  "DomainEndpointOptions": "Whether to require that all requests to the domain arrive over HTTPS. We recommend Policy-Min-TLS-1-2-2019-07 for TLSSecurityPolicy. For compatibility with older clients, the default is Policy-Min-TLS-1-0-2019-07. "
}
"""
UpdateDomainEndpointOptions(args) = cloudsearch("UpdateDomainEndpointOptions", args)

"""
    DescribeScalingParameters()

Gets the scaling parameters configured for a domain. A domain's scaling parameters specify the desired search instance type and replication count. For more information, see Configuring Scaling Options in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": ""
}
"""
DescribeScalingParameters(args) = cloudsearch("DescribeScalingParameters", args)

"""
    UpdateScalingParameters()

Configures scaling parameters for a domain. A domain's scaling parameters specify the desired search instance type and replication count. Amazon CloudSearch will still automatically scale your domain based on the volume of data and traffic, but not below the desired instance type and replication count. If the Multi-AZ option is enabled, these values control the resources used per Availability Zone. For more information, see Configuring Scaling Options in the Amazon CloudSearch Developer Guide. 

Required Parameters
{
  "DomainName": "",
  "ScalingParameters": ""
}
"""
UpdateScalingParameters(args) = cloudsearch("UpdateScalingParameters", args)

"""
    CreateDomain()

Creates a new search domain. For more information, see Creating a Search Domain in the Amazon CloudSearch Developer Guide.

Required Parameters
{
  "DomainName": "A name for the domain you are creating. Allowed characters are a-z (lower-case letters), 0-9, and hyphen (-). Domain names must start with a letter or number and be at least 3 and no more than 28 characters long."
}
"""
CreateDomain(args) = cloudsearch("CreateDomain", args)

"""
    IndexDocuments()

Tells the search domain to start indexing its documents using the latest indexing options. This operation must be invoked to activate options whose OptionStatus is RequiresIndexDocuments.

Required Parameters
{
  "DomainName": ""
}
"""
IndexDocuments(args) = cloudsearch("IndexDocuments", args)
