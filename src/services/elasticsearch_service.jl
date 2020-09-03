# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: elasticsearch_service
using AWS.Compat
using AWS.UUIDs
"""
    AcceptInboundCrossClusterSearchConnection()

Allows the destination domain owner to accept an inbound cross-cluster search connection request.

# Required Parameters
- `ConnectionId`: The id of the inbound connection that you want to accept.

"""

accept_inbound_cross_cluster_search_connection(ConnectionId; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("PUT", "/2015-01-01/es/ccs/inboundConnection/$(ConnectionId)/accept"; aws_config=aws_config)
accept_inbound_cross_cluster_search_connection(ConnectionId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("PUT", "/2015-01-01/es/ccs/inboundConnection/$(ConnectionId)/accept", args; aws_config=aws_config)

"""
    AddTags()

Attaches tags to an existing Elasticsearch domain. Tags are a set of case-sensitive key value pairs. An Elasticsearch domain may have up to 10 tags. See  Tagging Amazon Elasticsearch Service Domains for more information.

# Required Parameters
- `ARN`:  Specify the ARN for which you want to add the tags.
- `TagList`:  List of Tag that need to be added for the Elasticsearch domain. 

"""

add_tags(ARN, TagList; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/tags", Dict{String, Any}("ARN"=>ARN, "TagList"=>TagList); aws_config=aws_config)
add_tags(ARN, TagList, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/tags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ARN"=>ARN, "TagList"=>TagList), args)); aws_config=aws_config)

"""
    AssociatePackage()

Associates a package with an Amazon ES domain.

# Required Parameters
- `DomainName`: Name of the domain that you want to associate the package with.
- `PackageID`: Internal ID of the package that you want to associate with a domain. Use DescribePackages to find this value.

"""

associate_package(DomainName, PackageID; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages/associate/$(PackageID)/$(DomainName)"; aws_config=aws_config)
associate_package(DomainName, PackageID, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages/associate/$(PackageID)/$(DomainName)", args; aws_config=aws_config)

"""
    CancelElasticsearchServiceSoftwareUpdate()

Cancels a scheduled service software update for an Amazon ES domain. You can only perform this operation before the AutomatedUpdateDate and when the UpdateStatus is in the PENDING_UPDATE state.

# Required Parameters
- `DomainName`: The name of the domain that you want to stop the latest service software update on.

"""

cancel_elasticsearch_service_software_update(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/serviceSoftwareUpdate/cancel", Dict{String, Any}("DomainName"=>DomainName); aws_config=aws_config)
cancel_elasticsearch_service_software_update(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/serviceSoftwareUpdate/cancel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName), args)); aws_config=aws_config)

"""
    CreateElasticsearchDomain()

Creates a new Elasticsearch domain. For more information, see Creating Elasticsearch Domains in the Amazon Elasticsearch Service Developer Guide.

# Required Parameters
- `DomainName`: The name of the Elasticsearch domain that you are creating. Domain names are unique across the domains owned by an account within an AWS region. Domain names must start with a lowercase letter and can contain the following characters: a-z (lowercase), 0-9, and - (hyphen).

# Optional Parameters
- `AccessPolicies`:  IAM access policy as a JSON-formatted string.
- `AdvancedOptions`:  Option to allow references to indices in an HTTP request body. Must be false when configuring access to individual sub-resources. By default, the value is true. See Configuration Advanced Options for more information.
- `AdvancedSecurityOptions`: Specifies advanced security options.
- `CognitoOptions`: Options to specify the Cognito user and identity pools for Kibana authentication. For more information, see Amazon Cognito Authentication for Kibana.
- `DomainEndpointOptions`: Options to specify configuration that will be applied to the domain endpoint.
- `EBSOptions`: Options to enable, disable and specify the type and size of EBS storage volumes. 
- `ElasticsearchClusterConfig`: Configuration options for an Elasticsearch domain. Specifies the instance type and number of instances in the domain cluster. 
- `ElasticsearchVersion`: String of format X.Y to specify version for the Elasticsearch domain eg. \"1.5\" or \"2.3\". For more information, see Creating Elasticsearch Domains in the Amazon Elasticsearch Service Developer Guide.
- `EncryptionAtRestOptions`: Specifies the Encryption At Rest Options.
- `LogPublishingOptions`: Map of LogType and LogPublishingOption, each containing options to publish a given type of Elasticsearch log.
- `NodeToNodeEncryptionOptions`: Specifies the NodeToNodeEncryptionOptions.
- `SnapshotOptions`: Option to set time, in UTC format, of the daily automated snapshot. Default value is 0 hours. 
- `VPCOptions`: Options to specify the subnets and security groups for VPC endpoint. For more information, see Creating a VPC in VPC Endpoints for Amazon Elasticsearch Service Domains
"""

create_elasticsearch_domain(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/domain", Dict{String, Any}("DomainName"=>DomainName); aws_config=aws_config)
create_elasticsearch_domain(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/domain", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName), args)); aws_config=aws_config)

"""
    CreateOutboundCrossClusterSearchConnection()

Creates a new cross-cluster search connection from a source domain to a destination domain.

# Required Parameters
- `ConnectionAlias`: Specifies the connection alias that will be used by the customer for this connection.
- `DestinationDomainInfo`: Specifies the DomainInformation for the destination Elasticsearch domain.
- `SourceDomainInfo`: Specifies the DomainInformation for the source Elasticsearch domain.

"""

create_outbound_cross_cluster_search_connection(ConnectionAlias, DestinationDomainInfo, SourceDomainInfo; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/ccs/outboundConnection", Dict{String, Any}("ConnectionAlias"=>ConnectionAlias, "DestinationDomainInfo"=>DestinationDomainInfo, "SourceDomainInfo"=>SourceDomainInfo); aws_config=aws_config)
create_outbound_cross_cluster_search_connection(ConnectionAlias, DestinationDomainInfo, SourceDomainInfo, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/ccs/outboundConnection", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ConnectionAlias"=>ConnectionAlias, "DestinationDomainInfo"=>DestinationDomainInfo, "SourceDomainInfo"=>SourceDomainInfo), args)); aws_config=aws_config)

"""
    CreatePackage()

Create a package for use with Amazon ES domains.

# Required Parameters
- `PackageName`: Unique identifier for the package.
- `PackageSource`: The customer S3 location PackageSource for importing the package.
- `PackageType`: Type of package. Currently supports only TXT-DICTIONARY.

# Optional Parameters
- `PackageDescription`: Description of the package.
"""

create_package(PackageName, PackageSource, PackageType; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages", Dict{String, Any}("PackageName"=>PackageName, "PackageSource"=>PackageSource, "PackageType"=>PackageType); aws_config=aws_config)
create_package(PackageName, PackageSource, PackageType, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("PackageName"=>PackageName, "PackageSource"=>PackageSource, "PackageType"=>PackageType), args)); aws_config=aws_config)

"""
    DeleteElasticsearchDomain()

Permanently deletes the specified Elasticsearch domain and all of its data. Once a domain is deleted, it cannot be recovered.

# Required Parameters
- `DomainName`: The name of the Elasticsearch domain that you want to permanently delete.

"""

delete_elasticsearch_domain(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/domain/$(DomainName)"; aws_config=aws_config)
delete_elasticsearch_domain(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/domain/$(DomainName)", args; aws_config=aws_config)

"""
    DeleteElasticsearchServiceRole()

Deletes the service-linked role that Elasticsearch Service uses to manage and maintain VPC domains. Role deletion will fail if any existing VPC domains use the role. You must delete any such Elasticsearch domains before deleting the role. See Deleting Elasticsearch Service Role in VPC Endpoints for Amazon Elasticsearch Service Domains.

"""

delete_elasticsearch_service_role(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/role"; aws_config=aws_config)
delete_elasticsearch_service_role(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/role", args; aws_config=aws_config)

"""
    DeleteInboundCrossClusterSearchConnection()

Allows the destination domain owner to delete an existing inbound cross-cluster search connection.

# Required Parameters
- `ConnectionId`: The id of the inbound connection that you want to permanently delete.

"""

delete_inbound_cross_cluster_search_connection(ConnectionId; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/ccs/inboundConnection/$(ConnectionId)"; aws_config=aws_config)
delete_inbound_cross_cluster_search_connection(ConnectionId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/ccs/inboundConnection/$(ConnectionId)", args; aws_config=aws_config)

"""
    DeleteOutboundCrossClusterSearchConnection()

Allows the source domain owner to delete an existing outbound cross-cluster search connection.

# Required Parameters
- `ConnectionId`: The id of the outbound connection that you want to permanently delete.

"""

delete_outbound_cross_cluster_search_connection(ConnectionId; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/ccs/outboundConnection/$(ConnectionId)"; aws_config=aws_config)
delete_outbound_cross_cluster_search_connection(ConnectionId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/es/ccs/outboundConnection/$(ConnectionId)", args; aws_config=aws_config)

"""
    DeletePackage()

Delete the package.

# Required Parameters
- `PackageID`: Internal ID of the package that you want to delete. Use DescribePackages to find this value.

"""

delete_package(PackageID; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/packages/$(PackageID)"; aws_config=aws_config)
delete_package(PackageID, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("DELETE", "/2015-01-01/packages/$(PackageID)", args; aws_config=aws_config)

"""
    DescribeElasticsearchDomain()

Returns domain configuration information about the specified Elasticsearch domain, including the domain ID, domain endpoint, and domain ARN.

# Required Parameters
- `DomainName`: The name of the Elasticsearch domain for which you want information.

"""

describe_elasticsearch_domain(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/domain/$(DomainName)"; aws_config=aws_config)
describe_elasticsearch_domain(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/domain/$(DomainName)", args; aws_config=aws_config)

"""
    DescribeElasticsearchDomainConfig()

Provides cluster configuration information about the specified Elasticsearch domain, such as the state, creation date, update version, and update date for cluster options.

# Required Parameters
- `DomainName`: The Elasticsearch domain that you want to get information about.

"""

describe_elasticsearch_domain_config(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/domain/$(DomainName)/config"; aws_config=aws_config)
describe_elasticsearch_domain_config(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/domain/$(DomainName)/config", args; aws_config=aws_config)

"""
    DescribeElasticsearchDomains()

Returns domain configuration information about the specified Elasticsearch domains, including the domain ID, domain endpoint, and domain ARN.

# Required Parameters
- `DomainNames`: The Elasticsearch domains for which you want information.

"""

describe_elasticsearch_domains(DomainNames; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/domain-info", Dict{String, Any}("DomainNames"=>DomainNames); aws_config=aws_config)
describe_elasticsearch_domains(DomainNames, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/domain-info", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainNames"=>DomainNames), args)); aws_config=aws_config)

"""
    DescribeElasticsearchInstanceTypeLimits()

 Describe Elasticsearch Limits for a given InstanceType and ElasticsearchVersion. When modifying existing Domain, specify the  DomainName  to know what Limits are supported for modifying. 

# Required Parameters
- `ElasticsearchVersion`:  Version of Elasticsearch for which  Limits  are needed. 
- `InstanceType`:  The instance type for an Elasticsearch cluster for which Elasticsearch  Limits  are needed. 

# Optional Parameters
- `domainName`:  DomainName represents the name of the Domain that we are trying to modify. This should be present only if we are querying for Elasticsearch  Limits  for existing domain. 
"""

describe_elasticsearch_instance_type_limits(ElasticsearchVersion, InstanceType; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/instanceTypeLimits/$(ElasticsearchVersion)/$(InstanceType)"; aws_config=aws_config)
describe_elasticsearch_instance_type_limits(ElasticsearchVersion, InstanceType, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/instanceTypeLimits/$(ElasticsearchVersion)/$(InstanceType)", args; aws_config=aws_config)

"""
    DescribeInboundCrossClusterSearchConnections()

Lists all the inbound cross-cluster search connections for a destination domain.

# Optional Parameters
- `Filters`:  A list of filters used to match properties for inbound cross-cluster search connection. Available Filter names for this operation are:  cross-cluster-search-connection-id source-domain-info.domain-name source-domain-info.owner-id source-domain-info.region destination-domain-info.domain-name  
- `MaxResults`: Set this value to limit the number of results returned. If not specified, defaults to 100.
- `NextToken`:  NextToken is sent in case the earlier API call results contain the NextToken. It is used for pagination.
"""

describe_inbound_cross_cluster_search_connections(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/ccs/inboundConnection/search"; aws_config=aws_config)
describe_inbound_cross_cluster_search_connections(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/ccs/inboundConnection/search", args; aws_config=aws_config)

"""
    DescribeOutboundCrossClusterSearchConnections()

Lists all the outbound cross-cluster search connections for a source domain.

# Optional Parameters
- `Filters`:  A list of filters used to match properties for outbound cross-cluster search connection. Available Filter names for this operation are:  cross-cluster-search-connection-id destination-domain-info.domain-name destination-domain-info.owner-id destination-domain-info.region source-domain-info.domain-name  
- `MaxResults`: Set this value to limit the number of results returned. If not specified, defaults to 100.
- `NextToken`:  NextToken is sent in case the earlier API call results contain the NextToken. It is used for pagination.
"""

describe_outbound_cross_cluster_search_connections(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/ccs/outboundConnection/search"; aws_config=aws_config)
describe_outbound_cross_cluster_search_connections(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/ccs/outboundConnection/search", args; aws_config=aws_config)

"""
    DescribePackages()

Describes all packages available to Amazon ES. Includes options for filtering, limiting the number of results, and pagination.

# Optional Parameters
- `Filters`: Only returns packages that match the DescribePackagesFilterList values.
- `MaxResults`: Limits results to a maximum number of packages.
- `NextToken`: Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If provided, returns results for the next page.
"""

describe_packages(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages/describe"; aws_config=aws_config)
describe_packages(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages/describe", args; aws_config=aws_config)

"""
    DescribeReservedElasticsearchInstanceOfferings()

Lists available reserved Elasticsearch instance offerings.

# Optional Parameters
- `maxResults`: Set this value to limit the number of results returned. If not specified, defaults to 100.
- `nextToken`: NextToken should be sent in case if earlier API call produced result containing NextToken. It is used for pagination.
- `offeringId`: The offering identifier filter value. Use this parameter to show only the available offering that matches the specified reservation identifier.
"""

describe_reserved_elasticsearch_instance_offerings(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/reservedInstanceOfferings"; aws_config=aws_config)
describe_reserved_elasticsearch_instance_offerings(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/reservedInstanceOfferings", args; aws_config=aws_config)

"""
    DescribeReservedElasticsearchInstances()

Returns information about reserved Elasticsearch instances for this account.

# Optional Parameters
- `maxResults`: Set this value to limit the number of results returned. If not specified, defaults to 100.
- `nextToken`: NextToken should be sent in case if earlier API call produced result containing NextToken. It is used for pagination.
- `reservationId`: The reserved instance identifier filter value. Use this parameter to show only the reservation that matches the specified reserved Elasticsearch instance ID.
"""

describe_reserved_elasticsearch_instances(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/reservedInstances"; aws_config=aws_config)
describe_reserved_elasticsearch_instances(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/reservedInstances", args; aws_config=aws_config)

"""
    DissociatePackage()

Dissociates a package from the Amazon ES domain.

# Required Parameters
- `DomainName`: Name of the domain that you want to associate the package with.
- `PackageID`: Internal ID of the package that you want to associate with a domain. Use DescribePackages to find this value.

"""

dissociate_package(DomainName, PackageID; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages/dissociate/$(PackageID)/$(DomainName)"; aws_config=aws_config)
dissociate_package(DomainName, PackageID, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/packages/dissociate/$(PackageID)/$(DomainName)", args; aws_config=aws_config)

"""
    GetCompatibleElasticsearchVersions()

 Returns a list of upgrade compatible Elastisearch versions. You can optionally pass a  DomainName  to get all upgrade compatible Elasticsearch versions for that specific domain. 

# Optional Parameters
- `domainName`: 
"""

get_compatible_elasticsearch_versions(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/compatibleVersions"; aws_config=aws_config)
get_compatible_elasticsearch_versions(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/compatibleVersions", args; aws_config=aws_config)

"""
    GetUpgradeHistory()

Retrieves the complete history of the last 10 upgrades that were performed on the domain.

# Required Parameters
- `DomainName`: 

# Optional Parameters
- `maxResults`: 
- `nextToken`: 
"""

get_upgrade_history(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/upgradeDomain/$(DomainName)/history"; aws_config=aws_config)
get_upgrade_history(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/upgradeDomain/$(DomainName)/history", args; aws_config=aws_config)

"""
    GetUpgradeStatus()

Retrieves the latest status of the last upgrade or upgrade eligibility check that was performed on the domain.

# Required Parameters
- `DomainName`: 

"""

get_upgrade_status(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/upgradeDomain/$(DomainName)/status"; aws_config=aws_config)
get_upgrade_status(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/upgradeDomain/$(DomainName)/status", args; aws_config=aws_config)

"""
    ListDomainNames()

Returns the name of all Elasticsearch domains owned by the current user's account. 

"""

list_domain_names(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/domain"; aws_config=aws_config)
list_domain_names(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/domain", args; aws_config=aws_config)

"""
    ListDomainsForPackage()

Lists all Amazon ES domains associated with the package.

# Required Parameters
- `PackageID`: The package for which to list domains.

# Optional Parameters
- `maxResults`: Limits results to a maximum number of domains.
- `nextToken`: Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If provided, returns results for the next page.
"""

list_domains_for_package(PackageID; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/packages/$(PackageID)/domains"; aws_config=aws_config)
list_domains_for_package(PackageID, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/packages/$(PackageID)/domains", args; aws_config=aws_config)

"""
    ListElasticsearchInstanceTypes()

List all Elasticsearch instance types that are supported for given ElasticsearchVersion

# Required Parameters
- `ElasticsearchVersion`: Version of Elasticsearch for which list of supported elasticsearch instance types are needed. 

# Optional Parameters
- `domainName`: DomainName represents the name of the Domain that we are trying to modify. This should be present only if we are querying for list of available Elasticsearch instance types when modifying existing domain. 
- `maxResults`:  Set this value to limit the number of results returned. Value provided must be greater than 30 else it wont be honored. 
- `nextToken`: NextToken should be sent in case if earlier API call produced result containing NextToken. It is used for pagination. 
"""

list_elasticsearch_instance_types(ElasticsearchVersion; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/instanceTypes/$(ElasticsearchVersion)"; aws_config=aws_config)
list_elasticsearch_instance_types(ElasticsearchVersion, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/instanceTypes/$(ElasticsearchVersion)", args; aws_config=aws_config)

"""
    ListElasticsearchVersions()

List all supported Elasticsearch versions

# Optional Parameters
- `maxResults`:  Set this value to limit the number of results returned. Value provided must be greater than 10 else it wont be honored. 
- `nextToken`: 
"""

list_elasticsearch_versions(; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/versions"; aws_config=aws_config)
list_elasticsearch_versions(args::AbstractDict{String, Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/es/versions", args; aws_config=aws_config)

"""
    ListPackagesForDomain()

Lists all packages associated with the Amazon ES domain.

# Required Parameters
- `DomainName`: The name of the domain for which you want to list associated packages.

# Optional Parameters
- `maxResults`: Limits results to a maximum number of packages.
- `nextToken`: Used for pagination. Only necessary if a previous API call includes a non-null NextToken value. If provided, returns results for the next page.
"""

list_packages_for_domain(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/domain/$(DomainName)/packages"; aws_config=aws_config)
list_packages_for_domain(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/domain/$(DomainName)/packages", args; aws_config=aws_config)

"""
    ListTags()

Returns all tags for the given Elasticsearch domain.

# Required Parameters
- `arn`:  Specify the ARN for the Elasticsearch domain to which the tags are attached that you want to view.

"""

list_tags(arn; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/tags/", Dict{String, Any}("arn"=>arn); aws_config=aws_config)
list_tags(arn, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("GET", "/2015-01-01/tags/", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("arn"=>arn), args)); aws_config=aws_config)

"""
    PurchaseReservedElasticsearchInstanceOffering()

Allows you to purchase reserved Elasticsearch instances.

# Required Parameters
- `ReservationName`: A customer-specified identifier to track this reservation.
- `ReservedElasticsearchInstanceOfferingId`: The ID of the reserved Elasticsearch instance offering to purchase.

# Optional Parameters
- `InstanceCount`: The number of Elasticsearch instances to reserve.
"""

purchase_reserved_elasticsearch_instance_offering(ReservationName, ReservedElasticsearchInstanceOfferingId; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/purchaseReservedInstanceOffering", Dict{String, Any}("ReservationName"=>ReservationName, "ReservedElasticsearchInstanceOfferingId"=>ReservedElasticsearchInstanceOfferingId); aws_config=aws_config)
purchase_reserved_elasticsearch_instance_offering(ReservationName, ReservedElasticsearchInstanceOfferingId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/purchaseReservedInstanceOffering", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ReservationName"=>ReservationName, "ReservedElasticsearchInstanceOfferingId"=>ReservedElasticsearchInstanceOfferingId), args)); aws_config=aws_config)

"""
    RejectInboundCrossClusterSearchConnection()

Allows the destination domain owner to reject an inbound cross-cluster search connection request.

# Required Parameters
- `ConnectionId`: The id of the inbound connection that you want to reject.

"""

reject_inbound_cross_cluster_search_connection(ConnectionId; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("PUT", "/2015-01-01/es/ccs/inboundConnection/$(ConnectionId)/reject"; aws_config=aws_config)
reject_inbound_cross_cluster_search_connection(ConnectionId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("PUT", "/2015-01-01/es/ccs/inboundConnection/$(ConnectionId)/reject", args; aws_config=aws_config)

"""
    RemoveTags()

Removes the specified set of tags from the specified Elasticsearch domain.

# Required Parameters
- `ARN`: Specifies the ARN for the Elasticsearch domain from which you want to delete the specified tags.
- `TagKeys`: Specifies the TagKey list which you want to remove from the Elasticsearch domain.

"""

remove_tags(ARN, TagKeys; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/tags-removal", Dict{String, Any}("ARN"=>ARN, "TagKeys"=>TagKeys); aws_config=aws_config)
remove_tags(ARN, TagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/tags-removal", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ARN"=>ARN, "TagKeys"=>TagKeys), args)); aws_config=aws_config)

"""
    StartElasticsearchServiceSoftwareUpdate()

Schedules a service software update for an Amazon ES domain.

# Required Parameters
- `DomainName`: The name of the domain that you want to update to the latest service software.

"""

start_elasticsearch_service_software_update(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/serviceSoftwareUpdate/start", Dict{String, Any}("DomainName"=>DomainName); aws_config=aws_config)
start_elasticsearch_service_software_update(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/serviceSoftwareUpdate/start", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName), args)); aws_config=aws_config)

"""
    UpdateElasticsearchDomainConfig()

Modifies the cluster configuration of the specified Elasticsearch domain, setting as setting the instance type and the number of instances. 

# Required Parameters
- `DomainName`: The name of the Elasticsearch domain that you are updating. 

# Optional Parameters
- `AccessPolicies`: IAM access policy as a JSON-formatted string.
- `AdvancedOptions`: Modifies the advanced option to allow references to indices in an HTTP request body. Must be false when configuring access to individual sub-resources. By default, the value is true. See Configuration Advanced Options for more information.
- `AdvancedSecurityOptions`: Specifies advanced security options.
- `CognitoOptions`: Options to specify the Cognito user and identity pools for Kibana authentication. For more information, see Amazon Cognito Authentication for Kibana.
- `DomainEndpointOptions`: Options to specify configuration that will be applied to the domain endpoint.
- `EBSOptions`: Specify the type and size of the EBS volume that you want to use. 
- `ElasticsearchClusterConfig`: The type and number of instances to instantiate for the domain cluster.
- `LogPublishingOptions`: Map of LogType and LogPublishingOption, each containing options to publish a given type of Elasticsearch log.
- `SnapshotOptions`: Option to set the time, in UTC format, for the daily automated snapshot. Default value is 0 hours. 
- `VPCOptions`: Options to specify the subnets and security groups for VPC endpoint. For more information, see Creating a VPC in VPC Endpoints for Amazon Elasticsearch Service Domains
"""

update_elasticsearch_domain_config(DomainName; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/domain/$(DomainName)/config"; aws_config=aws_config)
update_elasticsearch_domain_config(DomainName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/domain/$(DomainName)/config", args; aws_config=aws_config)

"""
    UpgradeElasticsearchDomain()

Allows you to either upgrade your domain or perform an Upgrade eligibility check to a compatible Elasticsearch version.

# Required Parameters
- `DomainName`: 
- `TargetVersion`: The version of Elasticsearch that you intend to upgrade the domain to.

# Optional Parameters
- `PerformCheckOnly`:  This flag, when set to True, indicates that an Upgrade Eligibility Check needs to be performed. This will not actually perform the Upgrade. 
"""

upgrade_elasticsearch_domain(DomainName, TargetVersion; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/upgradeDomain", Dict{String, Any}("DomainName"=>DomainName, "TargetVersion"=>TargetVersion); aws_config=aws_config)
upgrade_elasticsearch_domain(DomainName, TargetVersion, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = elasticsearch_service("POST", "/2015-01-01/es/upgradeDomain", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DomainName"=>DomainName, "TargetVersion"=>TargetVersion), args)); aws_config=aws_config)
