include("../AWSServices.jl")
using .AWSServices: eks

"""
    CreateCluster()

Creates an Amazon EKS control plane.  The Amazon EKS control plane consists of control plane instances that run the Kubernetes software, such as etcd and the API server. The control plane runs in an account managed by AWS, and the Kubernetes API is exposed via the Amazon EKS API server endpoint. Each Amazon EKS cluster control plane is single-tenant and unique and runs on its own set of Amazon EC2 instances. The cluster control plane is provisioned across multiple Availability Zones and fronted by an Elastic Load Balancing Network Load Balancer. Amazon EKS also provisions elastic network interfaces in your VPC subnets to provide connectivity from the control plane instances to the worker nodes (for example, to support kubectl exec, logs, and proxy data flows). Amazon EKS worker nodes run in your AWS account and connect to your cluster's control plane via the Kubernetes API server endpoint and a certificate file that is created for your cluster. You can use the endpointPublicAccess and endpointPrivateAccess parameters to enable or disable public and private access to your cluster's Kubernetes API server endpoint. By default, public access is enabled, and private access is disabled. For more information, see Amazon EKS Cluster Endpoint Access Control in the  Amazon EKS User Guide .  You can use the logging parameter to enable or disable exporting the Kubernetes control plane logs for your cluster to CloudWatch Logs. By default, cluster control plane logs aren't exported to CloudWatch Logs. For more information, see Amazon EKS Cluster Control Plane Logs in the  Amazon EKS User Guide .  CloudWatch Logs ingestion, archive storage, and data scanning rates apply to exported control plane logs. For more information, see Amazon CloudWatch Pricing.  Cluster creation typically takes between 10 and 15 minutes. After you create an Amazon EKS cluster, you must configure your Kubernetes tooling to communicate with the API server and launch worker nodes into your cluster. For more information, see Managing Cluster Authentication and Launching Amazon EKS Worker Nodes in the Amazon EKS User Guide.

Required Parameters
{
  "roleArn": "The Amazon Resource Name (ARN) of the IAM role that provides permissions for Amazon EKS to make calls to other AWS API operations on your behalf. For more information, see Amazon EKS Service IAM Role in the  Amazon EKS User Guide .",
  "name": "The unique name to give to your cluster.",
  "resourcesVpcConfig": "The VPC configuration used by the cluster control plane. Amazon EKS VPC resources have specific requirements to work properly with Kubernetes. For more information, see Cluster VPC Considerations and Cluster Security Group Considerations in the Amazon EKS User Guide. You must specify at least two subnets. You can specify up to five security groups, but we recommend that you use a dedicated security group for your cluster control plane."
}

Optional Parameters
{
  "logging": "Enable or disable exporting the Kubernetes control plane logs for your cluster to CloudWatch Logs. By default, cluster control plane logs aren't exported to CloudWatch Logs. For more information, see Amazon EKS Cluster Control Plane Logs in the  Amazon EKS User Guide .  CloudWatch Logs ingestion, archive storage, and data scanning rates apply to exported control plane logs. For more information, see Amazon CloudWatch Pricing. ",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "encryptionConfig": "The encryption configuration for the cluster.",
  "tags": "The metadata to apply to the cluster to assist with categorization and organization. Each tag consists of a key and an optional value, both of which you define.",
  "version": "The desired Kubernetes version for your cluster. If you don't specify a value here, the latest version available in Amazon EKS is used."
}
"""
CreateCluster(args) = eks("POST", "/clusters", args)

"""
    DeleteNodegroup()

Deletes an Amazon EKS node group for a cluster.

Required Parameters
{
  "nodegroupName": "The name of the node group to delete.",
  "clusterName": "The name of the Amazon EKS cluster that is associated with your node group."
}
"""
DeleteNodegroup(args) = eks("DELETE", "/clusters/{name}/node-groups/{nodegroupName}", args)

"""
    ListTagsForResource()

List the tags for an Amazon EKS resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. Currently, the supported resources are Amazon EKS clusters and managed node groups."
}
"""
ListTagsForResource(args) = eks("GET", "/tags/{resourceArn}", args)

"""
    ListUpdates()

Lists the updates associated with an Amazon EKS cluster or managed node group in your AWS account, in the specified Region.

Required Parameters
{
  "name": "The name of the Amazon EKS cluster to list updates for."
}

Optional Parameters
{
  "nodegroupName": "The name of the Amazon EKS managed node group to list updates for.",
  "maxResults": "The maximum number of update results returned by ListUpdates in paginated output. When you use this parameter, ListUpdates returns only maxResults results in a single page along with a nextToken response element. You can see the remaining results of the initial request by sending another ListUpdates request with the returned nextToken value. This value can be between 1 and 100. If you don't use this parameter, ListUpdates returns up to 100 results and a nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated ListUpdates request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value."
}
"""
ListUpdates(args) = eks("GET", "/clusters/{name}/updates", args)

"""
    DeleteFargateProfile()

Deletes an AWS Fargate profile. When you delete a Fargate profile, any pods running on Fargate that were created with the profile are deleted. If those pods match another Fargate profile, then they are scheduled on Fargate with that profile. If they no longer match any Fargate profiles, then they are not scheduled on Fargate and they may remain in a pending state. Only one Fargate profile in a cluster can be in the DELETING status at a time. You must wait for a Fargate profile to finish deleting before you can delete any other profiles in that cluster.

Required Parameters
{
  "fargateProfileName": "The name of the Fargate profile to delete.",
  "clusterName": "The name of the Amazon EKS cluster associated with the Fargate profile to delete."
}
"""
DeleteFargateProfile(args) = eks("DELETE", "/clusters/{name}/fargate-profiles/{fargateProfileName}", args)

"""
    DescribeFargateProfile()

Returns descriptive information about an AWS Fargate profile.

Required Parameters
{
  "fargateProfileName": "The name of the Fargate profile to describe.",
  "clusterName": "The name of the Amazon EKS cluster associated with the Fargate profile."
}
"""
DescribeFargateProfile(args) = eks("GET", "/clusters/{name}/fargate-profiles/{fargateProfileName}", args)

"""
    ListFargateProfiles()

Lists the AWS Fargate profiles associated with the specified cluster in your AWS account in the specified Region.

Required Parameters
{
  "clusterName": "The name of the Amazon EKS cluster that you would like to listFargate profiles in."
}

Optional Parameters
{
  "maxResults": "The maximum number of Fargate profile results returned by ListFargateProfiles in paginated output. When you use this parameter, ListFargateProfiles returns only maxResults results in a single page along with a nextToken response element. You can see the remaining results of the initial request by sending another ListFargateProfiles request with the returned nextToken value. This value can be between 1 and 100. If you don't use this parameter, ListFargateProfiles returns up to 100 results and a nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated ListFargateProfiles request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value."
}
"""
ListFargateProfiles(args) = eks("GET", "/clusters/{name}/fargate-profiles", args)

"""
    TagResource()

Associates the specified tags to a resource with the specified resourceArn. If existing tags on a resource are not specified in the request parameters, they are not changed. When a resource is deleted, the tags associated with that resource are deleted as well. Tags that you create for Amazon EKS resources do not propagate to any other resources associated with the cluster. For example, if you tag a cluster with this operation, that tag does not automatically propagate to the subnets and worker nodes associated with the cluster.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource to which to add tags. Currently, the supported resources are Amazon EKS clusters and managed node groups.",
  "tags": "The tags to add to the resource. A tag is an array of key-value pairs."
}
"""
TagResource(args) = eks("POST", "/tags/{resourceArn}", args)

"""
    UntagResource()

Deletes specified tags from a resource.

Required Parameters
{
  "resourceArn": "The Amazon Resource Name (ARN) of the resource from which to delete tags. Currently, the supported resources are Amazon EKS clusters and managed node groups.",
  "tagKeys": "The keys of the tags to be removed."
}
"""
UntagResource(args) = eks("DELETE", "/tags/{resourceArn}", args)

"""
    UpdateNodegroupVersion()

Updates the Kubernetes version or AMI version of an Amazon EKS managed node group. You can update to the latest available AMI version of a node group's current Kubernetes version by not specifying a Kubernetes version in the request. You can update to the latest AMI version of your cluster's current Kubernetes version by specifying your cluster's Kubernetes version in the request. For more information, see Amazon EKS-Optimized Linux AMI Versions in the Amazon EKS User Guide. You cannot roll back a node group to an earlier Kubernetes version or AMI version. When a node in a managed node group is terminated due to a scaling action or update, the pods in that node are drained first. Amazon EKS attempts to drain the nodes gracefully and will fail if it is unable to do so. You can force the update if Amazon EKS is unable to drain the nodes as a result of a pod disruption budget issue.

Required Parameters
{
  "nodegroupName": "The name of the managed node group to update.",
  "clusterName": "The name of the Amazon EKS cluster that is associated with the managed node group to update."
}

Optional Parameters
{
  "releaseVersion": "The AMI version of the Amazon EKS-optimized AMI to use for the update. By default, the latest available AMI version for the node group's Kubernetes version is used. For more information, see Amazon EKS-Optimized Linux AMI Versions  in the Amazon EKS User Guide.",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "force": "Force the update if the existing node group's pods are unable to be drained due to a pod disruption budget issue. If an update fails because pods could not be drained, you can force the update after it fails to terminate the old node whether or not any pods are running on the node.",
  "version": "The Kubernetes version to update to. If no version is specified, then the Kubernetes version of the node group does not change. You can specify the Kubernetes version of the cluster to update the node group to the latest AMI version of the cluster's Kubernetes version."
}
"""
UpdateNodegroupVersion(args) = eks("POST", "/clusters/{name}/node-groups/{nodegroupName}/update-version", args)

"""
    UpdateClusterVersion()

Updates an Amazon EKS cluster to the specified Kubernetes version. Your cluster continues to function during the update. The response output includes an update ID that you can use to track the status of your cluster update with the DescribeUpdate API operation. Cluster updates are asynchronous, and they should finish within a few minutes. During an update, the cluster status moves to UPDATING (this status transition is eventually consistent). When the update is complete (either Failed or Successful), the cluster status moves to Active. If your cluster has managed node groups attached to it, all of your node groups’ Kubernetes versions must match the cluster’s Kubernetes version in order to update the cluster to a new Kubernetes version.

Required Parameters
{
  "name": "The name of the Amazon EKS cluster to update.",
  "version": "The desired Kubernetes version following a successful update."
}

Optional Parameters
{
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request."
}
"""
UpdateClusterVersion(args) = eks("POST", "/clusters/{name}/updates", args)

"""
    CreateNodegroup()

Creates a managed worker node group for an Amazon EKS cluster. You can only create a node group for your cluster that is equal to the current Kubernetes version for the cluster. All node groups are created with the latest AMI release version for the respective minor Kubernetes version of the cluster. An Amazon EKS managed node group is an Amazon EC2 Auto Scaling group and associated Amazon EC2 instances that are managed by AWS for an Amazon EKS cluster. Each node group uses a version of the Amazon EKS-optimized Amazon Linux 2 AMI. For more information, see Managed Node Groups in the Amazon EKS User Guide. 

Required Parameters
{
  "subnets": "The subnets to use for the Auto Scaling group that is created for your node group. These subnets must have the tag key kubernetes.io/cluster/CLUSTER_NAME with a value of shared, where CLUSTER_NAME is replaced with the name of your cluster.",
  "nodegroupName": "The unique name to give your node group.",
  "clusterName": "The name of the cluster to create the node group in.",
  "nodeRole": "The Amazon Resource Name (ARN) of the IAM role to associate with your node group. The Amazon EKS worker node kubelet daemon makes calls to AWS APIs on your behalf. Worker nodes receive permissions for these API calls through an IAM instance profile and associated policies. Before you can launch worker nodes and register them into a cluster, you must create an IAM role for those worker nodes to use when they are launched. For more information, see Amazon EKS Worker Node IAM Role in the  Amazon EKS User Guide ."
}

Optional Parameters
{
  "remoteAccess": "The remote access (SSH) configuration to use with your node group.",
  "instanceTypes": "The instance type to use for your node group. Currently, you can specify a single instance type for a node group. The default value for this parameter is t3.medium. If you choose a GPU instance type, be sure to specify the AL2_x86_64_GPU with the amiType parameter.",
  "releaseVersion": "The AMI version of the Amazon EKS-optimized AMI to use with your node group. By default, the latest available AMI version for the node group's current Kubernetes version is used. For more information, see Amazon EKS-Optimized Linux AMI Versions in the Amazon EKS User Guide.",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "labels": "The Kubernetes labels to be applied to the nodes in the node group when they are created.",
  "scalingConfig": "The scaling configuration details for the Auto Scaling group that is created for your node group.",
  "amiType": "The AMI type for your node group. GPU instance types should use the AL2_x86_64_GPU AMI type, which uses the Amazon EKS-optimized Linux AMI with GPU support. Non-GPU instances should use the AL2_x86_64 AMI type, which uses the Amazon EKS-optimized Linux AMI.",
  "version": "The Kubernetes version to use for your managed nodes. By default, the Kubernetes version of the cluster is used, and this is the only accepted specified value.",
  "tags": "The metadata to apply to the node group to assist with categorization and organization. Each tag consists of a key and an optional value, both of which you define. Node group tags do not propagate to any other resources associated with the node group, such as the Amazon EC2 instances or subnets.",
  "diskSize": "The root device disk size (in GiB) for your node group instances. The default disk size is 20 GiB."
}
"""
CreateNodegroup(args) = eks("POST", "/clusters/{name}/node-groups", args)

"""
    ListNodegroups()

Lists the Amazon EKS managed node groups associated with the specified cluster in your AWS account in the specified Region. Self-managed node groups are not listed.

Required Parameters
{
  "clusterName": "The name of the Amazon EKS cluster that you would like to list node groups in."
}

Optional Parameters
{
  "maxResults": "The maximum number of node group results returned by ListNodegroups in paginated output. When you use this parameter, ListNodegroups returns only maxResults results in a single page along with a nextToken response element. You can see the remaining results of the initial request by sending another ListNodegroups request with the returned nextToken value. This value can be between 1 and 100. If you don't use this parameter, ListNodegroups returns up to 100 results and a nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated ListNodegroups request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value."
}
"""
ListNodegroups(args) = eks("GET", "/clusters/{name}/node-groups", args)

"""
    DescribeNodegroup()

Returns descriptive information about an Amazon EKS node group.

Required Parameters
{
  "nodegroupName": "The name of the node group to describe.",
  "clusterName": "The name of the Amazon EKS cluster associated with the node group."
}
"""
DescribeNodegroup(args) = eks("GET", "/clusters/{name}/node-groups/{nodegroupName}", args)

"""
    DeleteCluster()

Deletes the Amazon EKS cluster control plane. If you have active services in your cluster that are associated with a load balancer, you must delete those services before deleting the cluster so that the load balancers are deleted properly. Otherwise, you can have orphaned resources in your VPC that prevent you from being able to delete the VPC. For more information, see Deleting a Cluster in the Amazon EKS User Guide. If you have managed node groups or Fargate profiles attached to the cluster, you must delete them first. For more information, see DeleteNodegroup and DeleteFargateProfile.

Required Parameters
{
  "name": "The name of the cluster to delete."
}
"""
DeleteCluster(args) = eks("DELETE", "/clusters/{name}", args)

"""
    DescribeCluster()

Returns descriptive information about an Amazon EKS cluster. The API server endpoint and certificate authority data returned by this operation are required for kubelet and kubectl to communicate with your Kubernetes API server. For more information, see Create a kubeconfig for Amazon EKS.  The API server endpoint and certificate authority data aren't available until the cluster reaches the ACTIVE state. 

Required Parameters
{
  "name": "The name of the cluster to describe."
}
"""
DescribeCluster(args) = eks("GET", "/clusters/{name}", args)

"""
    UpdateNodegroupConfig()

Updates an Amazon EKS managed node group configuration. Your node group continues to function during the update. The response output includes an update ID that you can use to track the status of your node group update with the DescribeUpdate API operation. Currently you can update the Kubernetes labels for a node group or the scaling configuration.

Required Parameters
{
  "nodegroupName": "The name of the managed node group to update.",
  "clusterName": "The name of the Amazon EKS cluster that the managed node group resides in."
}

Optional Parameters
{
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "labels": "The Kubernetes labels to be applied to the nodes in the node group after the update.",
  "scalingConfig": "The scaling configuration details for the Auto Scaling group after the update."
}
"""
UpdateNodegroupConfig(args) = eks("POST", "/clusters/{name}/node-groups/{nodegroupName}/update-config", args)

"""
    UpdateClusterConfig()

Updates an Amazon EKS cluster configuration. Your cluster continues to function during the update. The response output includes an update ID that you can use to track the status of your cluster update with the DescribeUpdate API operation. You can use this API operation to enable or disable exporting the Kubernetes control plane logs for your cluster to CloudWatch Logs. By default, cluster control plane logs aren't exported to CloudWatch Logs. For more information, see Amazon EKS Cluster Control Plane Logs in the  Amazon EKS User Guide .  CloudWatch Logs ingestion, archive storage, and data scanning rates apply to exported control plane logs. For more information, see Amazon CloudWatch Pricing.  You can also use this API operation to enable or disable public and private access to your cluster's Kubernetes API server endpoint. By default, public access is enabled, and private access is disabled. For more information, see Amazon EKS Cluster Endpoint Access Control in the  Amazon EKS User Guide .   At this time, you can not update the subnets or security group IDs for an existing cluster.  Cluster updates are asynchronous, and they should finish within a few minutes. During an update, the cluster status moves to UPDATING (this status transition is eventually consistent). When the update is complete (either Failed or Successful), the cluster status moves to Active.

Required Parameters
{
  "name": "The name of the Amazon EKS cluster to update."
}

Optional Parameters
{
  "logging": "Enable or disable exporting the Kubernetes control plane logs for your cluster to CloudWatch Logs. By default, cluster control plane logs aren't exported to CloudWatch Logs. For more information, see Amazon EKS Cluster Control Plane Logs in the  Amazon EKS User Guide .  CloudWatch Logs ingestion, archive storage, and data scanning rates apply to exported control plane logs. For more information, see Amazon CloudWatch Pricing. ",
  "resourcesVpcConfig": "",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request."
}
"""
UpdateClusterConfig(args) = eks("POST", "/clusters/{name}/update-config", args)

"""
    CreateFargateProfile()

Creates an AWS Fargate profile for your Amazon EKS cluster. You must have at least one Fargate profile in a cluster to be able to run pods on Fargate. The Fargate profile allows an administrator to declare which pods run on Fargate and specify which pods run on which Fargate profile. This declaration is done through the profile’s selectors. Each profile can have up to five selectors that contain a namespace and labels. A namespace is required for every selector. The label field consists of multiple optional key-value pairs. Pods that match the selectors are scheduled on Fargate. If a to-be-scheduled pod matches any of the selectors in the Fargate profile, then that pod is run on Fargate. When you create a Fargate profile, you must specify a pod execution role to use with the pods that are scheduled with the profile. This role is added to the cluster's Kubernetes Role Based Access Control (RBAC) for authorization so that the kubelet that is running on the Fargate infrastructure can register with your Amazon EKS cluster so that it can appear in your cluster as a node. The pod execution role also provides IAM permissions to the Fargate infrastructure to allow read access to Amazon ECR image repositories. For more information, see Pod Execution Role in the Amazon EKS User Guide. Fargate profiles are immutable. However, you can create a new updated profile to replace an existing profile and then delete the original after the updated profile has finished creating. If any Fargate profiles in a cluster are in the DELETING status, you must wait for that Fargate profile to finish deleting before you can create any other profiles in that cluster. For more information, see AWS Fargate Profile in the Amazon EKS User Guide.

Required Parameters
{
  "fargateProfileName": "The name of the Fargate profile.",
  "clusterName": "The name of the Amazon EKS cluster to apply the Fargate profile to.",
  "podExecutionRoleArn": "The Amazon Resource Name (ARN) of the pod execution role to use for pods that match the selectors in the Fargate profile. The pod execution role allows Fargate infrastructure to register with your cluster as a node, and it provides read access to Amazon ECR image repositories. For more information, see Pod Execution Role in the Amazon EKS User Guide."
}

Optional Parameters
{
  "selectors": "The selectors to match for pods to use this Fargate profile. Each selector must have an associated namespace. Optionally, you can also specify labels for a namespace. You may specify up to five selectors in a Fargate profile.",
  "subnets": "The IDs of subnets to launch your pods into. At this time, pods running on Fargate are not assigned public IP addresses, so only private subnets (with no direct route to an Internet Gateway) are accepted for this parameter.",
  "clientRequestToken": "Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.",
  "tags": "The metadata to apply to the Fargate profile to assist with categorization and organization. Each tag consists of a key and an optional value, both of which you define. Fargate profile tags do not propagate to any other resources associated with the Fargate profile, such as the pods that are scheduled with it."
}
"""
CreateFargateProfile(args) = eks("POST", "/clusters/{name}/fargate-profiles", args)

"""
    DescribeUpdate()

Returns descriptive information about an update against your Amazon EKS cluster or associated managed node group. When the status of the update is Succeeded, the update is complete. If an update fails, the status is Failed, and an error detail explains the reason for the failure.

Required Parameters
{
  "name": "The name of the Amazon EKS cluster associated with the update.",
  "updateId": "The ID of the update to describe."
}

Optional Parameters
{
  "nodegroupName": "The name of the Amazon EKS node group associated with the update."
}
"""
DescribeUpdate(args) = eks("GET", "/clusters/{name}/updates/{updateId}", args)

"""
    ListClusters()

Lists the Amazon EKS clusters in your AWS account in the specified Region.

Optional Parameters
{
  "maxResults": "The maximum number of cluster results returned by ListClusters in paginated output. When you use this parameter, ListClusters returns only maxResults results in a single page along with a nextToken response element. You can see the remaining results of the initial request by sending another ListClusters request with the returned nextToken value. This value can be between 1 and 100. If you don't use this parameter, ListClusters returns up to 100 results and a nextToken value if applicable.",
  "nextToken": "The nextToken value returned from a previous paginated ListClusters request where maxResults was used and the results exceeded the value of that parameter. Pagination continues from the end of the previous results that returned the nextToken value.  This token should be treated as an opaque identifier that is used only to retrieve the next items in a list and not for other programmatic purposes. "
}
"""
ListClusters() = eks("GET", "/clusters")
ListClusters(args) = eks("GET", "/clusters", args)
