# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: dax

using Compat
using UUIDs
"""
    CreateCluster()

Creates a DAX cluster. All nodes in the cluster run the same DAX caching software.

# Required Parameters
- `ClusterName`: The cluster identifier. This parameter is stored as a lowercase string.  Constraints:    A name must contain from 1 to 20 alphanumeric characters or hyphens.   The first character must be a letter.   A name cannot end with a hyphen or contain two consecutive hyphens.  
- `IamRoleArn`: A valid Amazon Resource Name (ARN) that identifies an IAM role. At runtime, DAX will assume this role and use the role's permissions to access DynamoDB on your behalf.
- `NodeType`: The compute and memory capacity of the nodes in the cluster.
- `ReplicationFactor`: The number of nodes in the DAX cluster. A replication factor of 1 will create a single-node cluster, without any read replicas. For additional fault tolerance, you can create a multiple node cluster with one or more read replicas. To do this, set ReplicationFactor to a number between 3 (one primary and two read replicas) and 10 (one primary and nine read replicas). If the AvailabilityZones parameter is provided, its length must equal the ReplicationFactor.  AWS recommends that you have at least two read replicas per cluster. 

# Optional Parameters
- `AvailabilityZones`: The Availability Zones (AZs) in which the cluster nodes will reside after the cluster has been created or updated. If provided, the length of this list must equal the ReplicationFactor parameter. If you omit this parameter, DAX will spread the nodes across Availability Zones for the highest availability.
- `Description`: A description of the cluster.
- `NotificationTopicArn`: The Amazon Resource Name (ARN) of the Amazon SNS topic to which notifications will be sent.  The Amazon SNS topic owner must be same as the DAX cluster owner. 
- `ParameterGroupName`: The parameter group to be associated with the DAX cluster.
- `PreferredMaintenanceWindow`: Specifies the weekly time range during which maintenance on the DAX cluster is performed. It is specified as a range in the format ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Valid values for ddd are:    sun     mon     tue     wed     thu     fri     sat    Example: sun:05:00-sun:09:00   If you don't specify a preferred maintenance window when you create or modify a cache cluster, DAX assigns a 60-minute maintenance window on a randomly selected day of the week. 
- `SSESpecification`: Represents the settings used to enable server-side encryption on the cluster.
- `SecurityGroupIds`: A list of security group IDs to be assigned to each node in the DAX cluster. (Each of the security group ID is system-generated.) If this parameter is not specified, DAX assigns the default VPC security group to each node.
- `SubnetGroupName`: The name of the subnet group to be used for the replication group.  DAX clusters can only run in an Amazon VPC environment. All of the subnets that you specify in a subnet group must exist in the same VPC. 
- `Tags`: A set of tags to associate with the DAX cluster. 
"""

CreateCluster(ClusterName, IamRoleArn, NodeType, ReplicationFactor; aws_config::AWSConfig=global_aws_config()) = dax("CreateCluster", Dict{String, Any}("ClusterName"=>ClusterName, "IamRoleArn"=>IamRoleArn, "NodeType"=>NodeType, "ReplicationFactor"=>ReplicationFactor); aws_config=aws_config)
CreateCluster(ClusterName, IamRoleArn, NodeType, ReplicationFactor, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("CreateCluster", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterName"=>ClusterName, "IamRoleArn"=>IamRoleArn, "NodeType"=>NodeType, "ReplicationFactor"=>ReplicationFactor), args)); aws_config=aws_config)

"""
    CreateParameterGroup()

Creates a new parameter group. A parameter group is a collection of parameters that you apply to all of the nodes in a DAX cluster.

# Required Parameters
- `ParameterGroupName`: The name of the parameter group to apply to all of the clusters in this replication group.

# Optional Parameters
- `Description`: A description of the parameter group.
"""

CreateParameterGroup(ParameterGroupName; aws_config::AWSConfig=global_aws_config()) = dax("CreateParameterGroup", Dict{String, Any}("ParameterGroupName"=>ParameterGroupName); aws_config=aws_config)
CreateParameterGroup(ParameterGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("CreateParameterGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ParameterGroupName"=>ParameterGroupName), args)); aws_config=aws_config)

"""
    CreateSubnetGroup()

Creates a new subnet group.

# Required Parameters
- `SubnetGroupName`: A name for the subnet group. This value is stored as a lowercase string. 
- `SubnetIds`: A list of VPC subnet IDs for the subnet group.

# Optional Parameters
- `Description`: A description for the subnet group
"""

CreateSubnetGroup(SubnetGroupName, SubnetIds; aws_config::AWSConfig=global_aws_config()) = dax("CreateSubnetGroup", Dict{String, Any}("SubnetGroupName"=>SubnetGroupName, "SubnetIds"=>SubnetIds); aws_config=aws_config)
CreateSubnetGroup(SubnetGroupName, SubnetIds, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("CreateSubnetGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SubnetGroupName"=>SubnetGroupName, "SubnetIds"=>SubnetIds), args)); aws_config=aws_config)

"""
    DecreaseReplicationFactor()

Removes one or more nodes from a DAX cluster.  You cannot use DecreaseReplicationFactor to remove the last node in a DAX cluster. If you need to do this, use DeleteCluster instead. 

# Required Parameters
- `ClusterName`: The name of the DAX cluster from which you want to remove nodes.
- `NewReplicationFactor`: The new number of nodes for the DAX cluster.

# Optional Parameters
- `AvailabilityZones`: The Availability Zone(s) from which to remove nodes.
- `NodeIdsToRemove`: The unique identifiers of the nodes to be removed from the cluster.
"""

DecreaseReplicationFactor(ClusterName, NewReplicationFactor; aws_config::AWSConfig=global_aws_config()) = dax("DecreaseReplicationFactor", Dict{String, Any}("ClusterName"=>ClusterName, "NewReplicationFactor"=>NewReplicationFactor); aws_config=aws_config)
DecreaseReplicationFactor(ClusterName, NewReplicationFactor, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DecreaseReplicationFactor", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterName"=>ClusterName, "NewReplicationFactor"=>NewReplicationFactor), args)); aws_config=aws_config)

"""
    DeleteCluster()

Deletes a previously provisioned DAX cluster. DeleteCluster deletes all associated nodes, node endpoints and the DAX cluster itself. When you receive a successful response from this action, DAX immediately begins deleting the cluster; you cannot cancel or revert this action.

# Required Parameters
- `ClusterName`: The name of the cluster to be deleted.

"""

DeleteCluster(ClusterName; aws_config::AWSConfig=global_aws_config()) = dax("DeleteCluster", Dict{String, Any}("ClusterName"=>ClusterName); aws_config=aws_config)
DeleteCluster(ClusterName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DeleteCluster", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterName"=>ClusterName), args)); aws_config=aws_config)

"""
    DeleteParameterGroup()

Deletes the specified parameter group. You cannot delete a parameter group if it is associated with any DAX clusters.

# Required Parameters
- `ParameterGroupName`: The name of the parameter group to delete.

"""

DeleteParameterGroup(ParameterGroupName; aws_config::AWSConfig=global_aws_config()) = dax("DeleteParameterGroup", Dict{String, Any}("ParameterGroupName"=>ParameterGroupName); aws_config=aws_config)
DeleteParameterGroup(ParameterGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DeleteParameterGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ParameterGroupName"=>ParameterGroupName), args)); aws_config=aws_config)

"""
    DeleteSubnetGroup()

Deletes a subnet group.  You cannot delete a subnet group if it is associated with any DAX clusters. 

# Required Parameters
- `SubnetGroupName`: The name of the subnet group to delete.

"""

DeleteSubnetGroup(SubnetGroupName; aws_config::AWSConfig=global_aws_config()) = dax("DeleteSubnetGroup", Dict{String, Any}("SubnetGroupName"=>SubnetGroupName); aws_config=aws_config)
DeleteSubnetGroup(SubnetGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DeleteSubnetGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SubnetGroupName"=>SubnetGroupName), args)); aws_config=aws_config)

"""
    DescribeClusters()

Returns information about all provisioned DAX clusters if no cluster identifier is specified, or about a specific DAX cluster if a cluster identifier is supplied. If the cluster is in the CREATING state, only cluster level information will be displayed until all of the nodes are successfully provisioned. If the cluster is in the DELETING state, only cluster level information will be displayed. If nodes are currently being added to the DAX cluster, node endpoint information and creation time for the additional nodes will not be displayed until they are completely provisioned. When the DAX cluster state is available, the cluster is ready for use. If nodes are currently being removed from the DAX cluster, no endpoint information for the removed nodes is displayed.

# Optional Parameters
- `ClusterNames`: The names of the DAX clusters being described.
- `MaxResults`: The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. The value for MaxResults must be between 20 and 100.
- `NextToken`: An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults.
"""

DescribeClusters(; aws_config::AWSConfig=global_aws_config()) = dax("DescribeClusters"; aws_config=aws_config)
DescribeClusters(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DescribeClusters", args; aws_config=aws_config)

"""
    DescribeDefaultParameters()

Returns the default system parameter information for the DAX caching software.

# Optional Parameters
- `MaxResults`: The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. The value for MaxResults must be between 20 and 100.
- `NextToken`: An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults.
"""

DescribeDefaultParameters(; aws_config::AWSConfig=global_aws_config()) = dax("DescribeDefaultParameters"; aws_config=aws_config)
DescribeDefaultParameters(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DescribeDefaultParameters", args; aws_config=aws_config)

"""
    DescribeEvents()

Returns events related to DAX clusters and parameter groups. You can obtain events specific to a particular DAX cluster or parameter group by providing the name as a parameter. By default, only the events occurring within the last 24 hours are returned; however, you can retrieve up to 14 days' worth of events if necessary.

# Optional Parameters
- `Duration`: The number of minutes' worth of events to retrieve.
- `EndTime`: The end of the time interval for which to retrieve events, specified in ISO 8601 format.
- `MaxResults`: The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. The value for MaxResults must be between 20 and 100.
- `NextToken`: An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults.
- `SourceName`: The identifier of the event source for which events will be returned. If not specified, then all sources are included in the response.
- `SourceType`: The event source to retrieve events for. If no value is specified, all events are returned.
- `StartTime`: The beginning of the time interval to retrieve events for, specified in ISO 8601 format.
"""

DescribeEvents(; aws_config::AWSConfig=global_aws_config()) = dax("DescribeEvents"; aws_config=aws_config)
DescribeEvents(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DescribeEvents", args; aws_config=aws_config)

"""
    DescribeParameterGroups()

Returns a list of parameter group descriptions. If a parameter group name is specified, the list will contain only the descriptions for that group.

# Optional Parameters
- `MaxResults`: The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. The value for MaxResults must be between 20 and 100.
- `NextToken`: An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults.
- `ParameterGroupNames`: The names of the parameter groups.
"""

DescribeParameterGroups(; aws_config::AWSConfig=global_aws_config()) = dax("DescribeParameterGroups"; aws_config=aws_config)
DescribeParameterGroups(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DescribeParameterGroups", args; aws_config=aws_config)

"""
    DescribeParameters()

Returns the detailed parameter list for a particular parameter group.

# Required Parameters
- `ParameterGroupName`: The name of the parameter group.

# Optional Parameters
- `MaxResults`: The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. The value for MaxResults must be between 20 and 100.
- `NextToken`: An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults.
- `Source`: How the parameter is defined. For example, system denotes a system-defined parameter.
"""

DescribeParameters(ParameterGroupName; aws_config::AWSConfig=global_aws_config()) = dax("DescribeParameters", Dict{String, Any}("ParameterGroupName"=>ParameterGroupName); aws_config=aws_config)
DescribeParameters(ParameterGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DescribeParameters", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ParameterGroupName"=>ParameterGroupName), args)); aws_config=aws_config)

"""
    DescribeSubnetGroups()

Returns a list of subnet group descriptions. If a subnet group name is specified, the list will contain only the description of that group.

# Optional Parameters
- `MaxResults`: The maximum number of results to include in the response. If more results exist than the specified MaxResults value, a token is included in the response so that the remaining results can be retrieved. The value for MaxResults must be between 20 and 100.
- `NextToken`: An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token, up to the value specified by MaxResults.
- `SubnetGroupNames`: The name of the subnet group.
"""

DescribeSubnetGroups(; aws_config::AWSConfig=global_aws_config()) = dax("DescribeSubnetGroups"; aws_config=aws_config)
DescribeSubnetGroups(args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("DescribeSubnetGroups", args; aws_config=aws_config)

"""
    IncreaseReplicationFactor()

Adds one or more nodes to a DAX cluster.

# Required Parameters
- `ClusterName`: The name of the DAX cluster that will receive additional nodes.
- `NewReplicationFactor`: The new number of nodes for the DAX cluster.

# Optional Parameters
- `AvailabilityZones`: The Availability Zones (AZs) in which the cluster nodes will be created. All nodes belonging to the cluster are placed in these Availability Zones. Use this parameter if you want to distribute the nodes across multiple AZs.
"""

IncreaseReplicationFactor(ClusterName, NewReplicationFactor; aws_config::AWSConfig=global_aws_config()) = dax("IncreaseReplicationFactor", Dict{String, Any}("ClusterName"=>ClusterName, "NewReplicationFactor"=>NewReplicationFactor); aws_config=aws_config)
IncreaseReplicationFactor(ClusterName, NewReplicationFactor, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("IncreaseReplicationFactor", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterName"=>ClusterName, "NewReplicationFactor"=>NewReplicationFactor), args)); aws_config=aws_config)

"""
    ListTags()

List all of the tags for a DAX cluster. You can call ListTags up to 10 times per second, per account.

# Required Parameters
- `ResourceName`: The name of the DAX resource to which the tags belong.

# Optional Parameters
- `NextToken`: An optional token returned from a prior request. Use this token for pagination of results from this action. If this parameter is specified, the response includes only results beyond the token.
"""

ListTags(ResourceName; aws_config::AWSConfig=global_aws_config()) = dax("ListTags", Dict{String, Any}("ResourceName"=>ResourceName); aws_config=aws_config)
ListTags(ResourceName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("ListTags", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceName"=>ResourceName), args)); aws_config=aws_config)

"""
    RebootNode()

Reboots a single node of a DAX cluster. The reboot action takes place as soon as possible. During the reboot, the node status is set to REBOOTING.   RebootNode restarts the DAX engine process and does not remove the contents of the cache.  

# Required Parameters
- `ClusterName`: The name of the DAX cluster containing the node to be rebooted.
- `NodeId`: The system-assigned ID of the node to be rebooted.

"""

RebootNode(ClusterName, NodeId; aws_config::AWSConfig=global_aws_config()) = dax("RebootNode", Dict{String, Any}("ClusterName"=>ClusterName, "NodeId"=>NodeId); aws_config=aws_config)
RebootNode(ClusterName, NodeId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("RebootNode", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterName"=>ClusterName, "NodeId"=>NodeId), args)); aws_config=aws_config)

"""
    TagResource()

Associates a set of tags with a DAX resource. You can call TagResource up to 5 times per second, per account. 

# Required Parameters
- `ResourceName`: The name of the DAX resource to which tags should be added.
- `Tags`: The tags to be assigned to the DAX resource. 

"""

TagResource(ResourceName, Tags; aws_config::AWSConfig=global_aws_config()) = dax("TagResource", Dict{String, Any}("ResourceName"=>ResourceName, "Tags"=>Tags); aws_config=aws_config)
TagResource(ResourceName, Tags, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("TagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceName"=>ResourceName, "Tags"=>Tags), args)); aws_config=aws_config)

"""
    UntagResource()

Removes the association of tags from a DAX resource. You can call UntagResource up to 5 times per second, per account. 

# Required Parameters
- `ResourceName`: The name of the DAX resource from which the tags should be removed.
- `TagKeys`: A list of tag keys. If the DAX cluster has any tags with these keys, then the tags are removed from the cluster.

"""

UntagResource(ResourceName, TagKeys; aws_config::AWSConfig=global_aws_config()) = dax("UntagResource", Dict{String, Any}("ResourceName"=>ResourceName, "TagKeys"=>TagKeys); aws_config=aws_config)
UntagResource(ResourceName, TagKeys, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("UntagResource", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ResourceName"=>ResourceName, "TagKeys"=>TagKeys), args)); aws_config=aws_config)

"""
    UpdateCluster()

Modifies the settings for a DAX cluster. You can use this action to change one or more cluster configuration parameters by specifying the parameters and the new values.

# Required Parameters
- `ClusterName`: The name of the DAX cluster to be modified.

# Optional Parameters
- `Description`: A description of the changes being made to the cluster.
- `NotificationTopicArn`: The Amazon Resource Name (ARN) that identifies the topic.
- `NotificationTopicStatus`: The current state of the topic.
- `ParameterGroupName`: The name of a parameter group for this cluster.
- `PreferredMaintenanceWindow`: A range of time when maintenance of DAX cluster software will be performed. For example: sun:01:00-sun:09:00. Cluster maintenance normally takes less than 30 minutes, and is performed automatically within the maintenance window.
- `SecurityGroupIds`: A list of user-specified security group IDs to be assigned to each node in the DAX cluster. If this parameter is not specified, DAX assigns the default VPC security group to each node.
"""

UpdateCluster(ClusterName; aws_config::AWSConfig=global_aws_config()) = dax("UpdateCluster", Dict{String, Any}("ClusterName"=>ClusterName); aws_config=aws_config)
UpdateCluster(ClusterName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("UpdateCluster", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClusterName"=>ClusterName), args)); aws_config=aws_config)

"""
    UpdateParameterGroup()

Modifies the parameters of a parameter group. You can modify up to 20 parameters in a single request by submitting a list parameter name and value pairs.

# Required Parameters
- `ParameterGroupName`: The name of the parameter group.
- `ParameterNameValues`: An array of name-value pairs for the parameters in the group. Each element in the array represents a single parameter.

"""

UpdateParameterGroup(ParameterGroupName, ParameterNameValues; aws_config::AWSConfig=global_aws_config()) = dax("UpdateParameterGroup", Dict{String, Any}("ParameterGroupName"=>ParameterGroupName, "ParameterNameValues"=>ParameterNameValues); aws_config=aws_config)
UpdateParameterGroup(ParameterGroupName, ParameterNameValues, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("UpdateParameterGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ParameterGroupName"=>ParameterGroupName, "ParameterNameValues"=>ParameterNameValues), args)); aws_config=aws_config)

"""
    UpdateSubnetGroup()

Modifies an existing subnet group.

# Required Parameters
- `SubnetGroupName`: The name of the subnet group.

# Optional Parameters
- `Description`: A description of the subnet group.
- `SubnetIds`: A list of subnet IDs in the subnet group.
"""

UpdateSubnetGroup(SubnetGroupName; aws_config::AWSConfig=global_aws_config()) = dax("UpdateSubnetGroup", Dict{String, Any}("SubnetGroupName"=>SubnetGroupName); aws_config=aws_config)
UpdateSubnetGroup(SubnetGroupName, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = dax("UpdateSubnetGroup", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("SubnetGroupName"=>SubnetGroupName), args)); aws_config=aws_config)
