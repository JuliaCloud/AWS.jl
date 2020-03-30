include("../AWSServices.jl")
using .AWSServices: datasync

"""
    ListLocations()

Returns a lists of source and destination locations. If you have more locations than are returned in a response (that is, the response returns only a truncated list of your agents), the response contains a token that you can specify in your next request to fetch the next page of locations.

Optional Parameters
{
  "MaxResults": "The maximum number of locations to return.",
  "NextToken": "An opaque string that indicates the position at which to begin the next list of locations."
}
"""
ListLocations() = datasync("ListLocations")
ListLocations(args) = datasync("ListLocations", args)

"""
    ListTagsForResource()

Returns all the tags associated with a specified resources. 

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource whose tags to list."
}

Optional Parameters
{
  "MaxResults": "The maximum number of locations to return.",
  "NextToken": "An opaque string that indicates the position at which to begin the next list of locations."
}
"""
ListTagsForResource(args) = datasync("ListTagsForResource", args)

"""
    CreateLocationEfs()

Creates an endpoint for an Amazon EFS file system.

Required Parameters
{
  "EfsFilesystemArn": "The Amazon Resource Name (ARN) for the Amazon EFS file system.",
  "Ec2Config": "The subnet and security group that the Amazon EFS file system uses. The security group that you provide needs to be able to communicate with the security group on the mount target in the subnet specified. The exact relationship between security group M (of the mount target) and security group S (which you provide for DataSync to use at this stage) is as follows:     Security group M (which you associate with the mount target) must allow inbound access for the Transmission Control Protocol (TCP) on the NFS port (2049) from security group S. You can enable inbound connections either by IP address (CIDR range) or security group.    Security group S (provided to DataSync to access EFS) should have a rule that enables outbound connections to the NFS port on one of the file system’s mount targets. You can enable outbound connections either by IP address (CIDR range) or security group. For information about security groups and mount targets, see Security Groups for Amazon EC2 Instances and Mount Targets in the Amazon EFS User Guide.   "
}

Optional Parameters
{
  "Subdirectory": "A subdirectory in the location’s path. This subdirectory in the EFS file system is used to read data from the EFS source location or write data to the EFS destination. By default, AWS DataSync uses the root directory.   Subdirectory must be specified with forward slashes. For example /path/to/folder. ",
  "Tags": "The key-value pair that represents a tag that you want to add to the resource. The value can be an empty string. This value helps you manage, filter, and search for your resources. We recommend that you create a name tag for your location."
}
"""
CreateLocationEfs(args) = datasync("CreateLocationEfs", args)

"""
    DescribeTask()

Returns metadata about a task.

Required Parameters
{
  "TaskArn": "The Amazon Resource Name (ARN) of the task to describe."
}
"""
DescribeTask(args) = datasync("DescribeTask", args)

"""
    UpdateTask()

Updates the metadata associated with a task.

Required Parameters
{
  "TaskArn": "The Amazon Resource Name (ARN) of the resource name of the task to update."
}

Optional Parameters
{
  "Excludes": "A list of filter rules that determines which files to exclude from a task. The list should contain a single filter string that consists of the patterns to exclude. The patterns are delimited by \"|\" (that is, a pipe), for example: \"/folder1|/folder2\"   ",
  "Schedule": "Specifies a schedule used to periodically transfer files from a source to a destination location. You can configure your task to execute hourly, daily, weekly or on specific days of the week. You control when in the day or hour you want the task to execute. The time you specify is UTC time. For more information, see task-scheduling.",
  "CloudWatchLogGroupArn": "The Amazon Resource Name (ARN) of the resource name of the CloudWatch LogGroup.",
  "Options": "",
  "Name": "The name of the task to update."
}
"""
UpdateTask(args) = datasync("UpdateTask", args)

"""
    UpdateAgent()

Updates the name of an agent.

Required Parameters
{
  "AgentArn": "The Amazon Resource Name (ARN) of the agent to update."
}

Optional Parameters
{
  "Name": "The name that you want to use to configure the agent."
}
"""
UpdateAgent(args) = datasync("UpdateAgent", args)

"""
    ListTasks()

Returns a list of all the tasks.

Optional Parameters
{
  "MaxResults": "The maximum number of tasks to return.",
  "NextToken": "An opaque string that indicates the position at which to begin the next list of tasks."
}
"""
ListTasks() = datasync("ListTasks")
ListTasks(args) = datasync("ListTasks", args)

"""
    DeleteLocation()

Deletes the configuration of a location used by AWS DataSync. 

Required Parameters
{
  "LocationArn": "The Amazon Resource Name (ARN) of the location to delete."
}
"""
DeleteLocation(args) = datasync("DeleteLocation", args)

"""
    CreateAgent()

Activates an AWS DataSync agent that you have deployed on your host. The activation process associates your agent with your account. In the activation process, you specify information such as the AWS Region that you want to activate the agent in. You activate the agent in the AWS Region where your target locations (in Amazon S3 or Amazon EFS) reside. Your tasks are created in this AWS Region. You can activate the agent in a VPC (Virtual private Cloud) or provide the agent access to a VPC endpoint so you can run tasks without going over the public Internet. You can use an agent for more than one location. If a task uses multiple agents, all of them need to have status AVAILABLE for the task to run. If you use multiple agents for a source location, the status of all the agents must be AVAILABLE for the task to run.  Agents are automatically updated by AWS on a regular basis, using a mechanism that ensures minimal interruption to your tasks. 

Required Parameters
{
  "ActivationKey": "Your agent activation key. You can get the activation key either by sending an HTTP GET request with redirects that enable you to get the agent IP address (port 80). Alternatively, you can get it from the AWS DataSync console. The redirect URL returned in the response provides you the activation key for your agent in the query string parameter activationKey. It might also include other activation-related parameters; however, these are merely defaults. The arguments you pass to this API call determine the actual configuration of your agent. For more information, see Activating an Agent in the AWS DataSync User Guide. "
}

Optional Parameters
{
  "SecurityGroupArns": "The ARNs of the security groups used to protect your data transfer task subnets. See CreateAgentRequest SubnetArns.",
  "AgentName": "The name you configured for your agent. This value is a text reference that is used to identify the agent in the console.",
  "Tags": "The key-value pair that represents the tag that you want to associate with the agent. The value can be an empty string. This value helps you manage, filter, and search for your agents.  Valid characters for key and value are letters, spaces, and numbers representable in UTF-8 format, and the following special characters: + - = . _ : / @.  ",
  "SubnetArns": "The Amazon Resource Names (ARNs) of the subnets in which DataSync will create elastic network interfaces for each data transfer task. The agent that runs a task must be private. When you start a task that is associated with an agent created in a VPC, or one that has access to an IP address in a VPC, then the task is also private. In this case, DataSync creates four network interfaces for each task in your subnet. For a data transfer to work, the agent must be able to route to all these four network interfaces.",
  "VpcEndpointId": "The ID of the VPC (Virtual Private Cloud) endpoint that the agent has access to. This is the client-side VPC endpoint, also called a PrivateLink. If you don't have a PrivateLink VPC endpoint, see Creating a VPC Endpoint Service Configuration in the AWS VPC User Guide. VPC endpoint ID looks like this: vpce-01234d5aff67890e1."
}
"""
CreateAgent(args) = datasync("CreateAgent", args)

"""
    CreateLocationSmb()

Defines a file system on an Server Message Block (SMB) server that can be read from or written to.

Required Parameters
{
  "Password": "The password of the user who can mount the share, has the permissions to access files and folders in the SMB share.",
  "Subdirectory": "The subdirectory in the SMB file system that is used to read data from the SMB source location or write data to the SMB destination. The SMB path should be a path that's exported by the SMB server, or a subdirectory of that path. The path should be such that it can be mounted by other SMB clients in your network.   Subdirectory must be specified with forward slashes. For example /path/to/folder.  To transfer all the data in the folder you specified, DataSync needs to have permissions to mount the SMB share, as well as to access all the data in that share. To ensure this, either ensure that the user/password specified belongs to the user who can mount the share, and who has the appropriate permissions for all of the files and directories that you want DataSync to access, or use credentials of a member of the Backup Operators group to mount the share. Doing either enables the agent to access the data. For the agent to access directories, you must additionally enable all execute access.",
  "User": "The user who can mount the share, has the permissions to access files and folders in the SMB share.",
  "ServerHostname": "The name of the SMB server. This value is the IP address or Domain Name Service (DNS) name of the SMB server. An agent that is installed on-premises uses this hostname to mount the SMB server in a network.  This name must either be DNS-compliant or must be an IP version 4 (IPv4) address. ",
  "AgentArns": "The Amazon Resource Names (ARNs) of agents to use for a Simple Message Block (SMB) location. "
}

Optional Parameters
{
  "MountOptions": "The mount options used by DataSync to access the SMB server.",
  "Tags": "The key-value pair that represents the tag that you want to add to the location. The value can be an empty string. We recommend using tags to name your resources.",
  "Domain": "The name of the Windows domain that the SMB server belongs to."
}
"""
CreateLocationSmb(args) = datasync("CreateLocationSmb", args)

"""
    DescribeLocationFsxWindows()

Returns metadata, such as the path information about an Amazon FSx for Windows location.

Required Parameters
{
  "LocationArn": "The Amazon Resource Name (ARN) of the FSx for Windows location to describe."
}
"""
DescribeLocationFsxWindows(args) = datasync("DescribeLocationFsxWindows", args)

"""
    DescribeLocationEfs()

Returns metadata, such as the path information about an Amazon EFS location.

Required Parameters
{
  "LocationArn": "The Amazon Resource Name (ARN) of the EFS location to describe."
}
"""
DescribeLocationEfs(args) = datasync("DescribeLocationEfs", args)

"""
    DescribeLocationNfs()

Returns metadata, such as the path information, about a NFS location.

Required Parameters
{
  "LocationArn": "The Amazon resource Name (ARN) of the NFS location to describe."
}
"""
DescribeLocationNfs(args) = datasync("DescribeLocationNfs", args)

"""
    ListAgents()

Returns a list of agents owned by an AWS account in the AWS Region specified in the request. The returned list is ordered by agent Amazon Resource Name (ARN). By default, this operation returns a maximum of 100 agents. This operation supports pagination that enables you to optionally reduce the number of agents returned in a response. If you have more agents than are returned in a response (that is, the response returns only a truncated list of your agents), the response contains a marker that you can specify in your next request to fetch the next page of agents.

Optional Parameters
{
  "MaxResults": "The maximum number of agents to list.",
  "NextToken": "An opaque string that indicates the position at which to begin the next list of agents."
}
"""
ListAgents() = datasync("ListAgents")
ListAgents(args) = datasync("ListAgents", args)

"""
    DescribeAgent()

Returns metadata such as the name, the network interfaces, and the status (that is, whether the agent is running or not) for an agent. To specify which agent to describe, use the Amazon Resource Name (ARN) of the agent in your request. 

Required Parameters
{
  "AgentArn": "The Amazon Resource Name (ARN) of the agent to describe."
}
"""
DescribeAgent(args) = datasync("DescribeAgent", args)

"""
    TagResource()

Applies a key-value pair to an AWS resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource to apply the tag to.",
  "Tags": "The tags to apply."
}
"""
TagResource(args) = datasync("TagResource", args)

"""
    UntagResource()

Removes a tag from an AWS resource.

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the resource to remove the tag from.",
  "Keys": "The keys in the key-value pair in the tag to remove."
}
"""
UntagResource(args) = datasync("UntagResource", args)

"""
    DescribeTaskExecution()

Returns detailed metadata about a task that is being executed.

Required Parameters
{
  "TaskExecutionArn": "The Amazon Resource Name (ARN) of the task that is being executed."
}
"""
DescribeTaskExecution(args) = datasync("DescribeTaskExecution", args)

"""
    CreateLocationNfs()

Defines a file system on a Network File System (NFS) server that can be read from or written to

Required Parameters
{
  "OnPremConfig": "Contains a list of Amazon Resource Names (ARNs) of agents that are used to connect to an NFS server.",
  "Subdirectory": "The subdirectory in the NFS file system that is used to read data from the NFS source location or write data to the NFS destination. The NFS path should be a path that's exported by the NFS server, or a subdirectory of that path. The path should be such that it can be mounted by other NFS clients in your network.  To see all the paths exported by your NFS server. run \"showmount -e nfs-server-name\" from an NFS client that has access to your server. You can specify any directory that appears in the results, and any subdirectory of that directory. Ensure that the NFS export is accessible without Kerberos authentication.  To transfer all the data in the folder you specified, DataSync needs to have permissions to read all the data. To ensure this, either configure the NFS export with no_root_squash, or ensure that the permissions for all of the files that you want DataSync allow read access for all users. Doing either enables the agent to read the files. For the agent to access directories, you must additionally enable all execute access. For information about NFS export configuration, see 18.7. The /etc/exports Configuration File in the Red Hat Enterprise Linux documentation.",
  "ServerHostname": "The name of the NFS server. This value is the IP address or Domain Name Service (DNS) name of the NFS server. An agent that is installed on-premises uses this host name to mount the NFS server in a network.   This name must either be DNS-compliant or must be an IP version 4 (IPv4) address. "
}

Optional Parameters
{
  "MountOptions": "The NFS mount options that DataSync can use to mount your NFS share.",
  "Tags": "The key-value pair that represents the tag that you want to add to the location. The value can be an empty string. We recommend using tags to name your resources."
}
"""
CreateLocationNfs(args) = datasync("CreateLocationNfs", args)

"""
    CreateTask()

Creates a task. A task is a set of two locations (source and destination) and a set of Options that you use to control the behavior of a task. If you don't specify Options when you create a task, AWS DataSync populates them with service defaults. When you create a task, it first enters the CREATING state. During CREATING AWS DataSync attempts to mount the on-premises Network File System (NFS) location. The task transitions to the AVAILABLE state without waiting for the AWS location to become mounted. If required, AWS DataSync mounts the AWS location before each task execution. If an agent that is associated with a source (NFS) location goes offline, the task transitions to the UNAVAILABLE status. If the status of the task remains in the CREATING status for more than a few minutes, it means that your agent might be having trouble mounting the source NFS file system. Check the task's ErrorCode and ErrorDetail. Mount issues are often caused by either a misconfigured firewall or a mistyped NFS server host name.

Required Parameters
{
  "SourceLocationArn": "The Amazon Resource Name (ARN) of the source location for the task.",
  "DestinationLocationArn": "The Amazon Resource Name (ARN) of an AWS storage resource's location. "
}

Optional Parameters
{
  "Excludes": "A list of filter rules that determines which files to exclude from a task. The list should contain a single filter string that consists of the patterns to exclude. The patterns are delimited by \"|\" (that is, a pipe), for example, \"/folder1|/folder2\"   ",
  "Schedule": "Specifies a schedule used to periodically transfer files from a source to a destination location. The schedule should be specified in UTC time. For more information, see task-scheduling.",
  "Tags": "The key-value pair that represents the tag that you want to add to the resource. The value can be an empty string. ",
  "CloudWatchLogGroupArn": "The Amazon Resource Name (ARN) of the Amazon CloudWatch log group that is used to monitor and log events in the task.  For more information on these groups, see Working with Log Groups and Log Streams in the Amazon CloudWatch User Guide.  For more information about how to use CloudWatch Logs with DataSync, see Monitoring Your Task in the AWS DataSync User Guide. ",
  "Options": "The set of configuration options that control the behavior of a single execution of the task that occurs when you call StartTaskExecution. You can configure these options to preserve metadata such as user ID (UID) and group ID (GID), file permissions, data integrity verification, and so on. For each individual task execution, you can override these options by specifying the OverrideOptions before starting a the task execution. For more information, see the operation. ",
  "Name": "The name of a task. This value is a text reference that is used to identify the task in the console. "
}
"""
CreateTask(args) = datasync("CreateTask", args)

"""
    DeleteAgent()

Deletes an agent. To specify which agent to delete, use the Amazon Resource Name (ARN) of the agent in your request. The operation disassociates the agent from your AWS account. However, it doesn't delete the agent virtual machine (VM) from your on-premises environment.

Required Parameters
{
  "AgentArn": "The Amazon Resource Name (ARN) of the agent to delete. Use the ListAgents operation to return a list of agents for your account and AWS Region."
}
"""
DeleteAgent(args) = datasync("DeleteAgent", args)

"""
    DescribeLocationS3()

Returns metadata, such as bucket name, about an Amazon S3 bucket location.

Required Parameters
{
  "LocationArn": "The Amazon Resource Name (ARN) of the Amazon S3 bucket location to describe."
}
"""
DescribeLocationS3(args) = datasync("DescribeLocationS3", args)

"""
    CreateLocationS3()

Creates an endpoint for an Amazon S3 bucket. For AWS DataSync to access a destination S3 bucket, it needs an AWS Identity and Access Management (IAM) role that has the required permissions. You can set up the required permissions by creating an IAM policy that grants the required permissions and attaching the policy to the role. An example of such a policy is shown in the examples section. For more information, see https://docs.aws.amazon.com/datasync/latest/userguide/working-with-locations.html#create-s3-location in the AWS DataSync User Guide. 

Required Parameters
{
  "S3Config": "",
  "S3BucketArn": "The Amazon Resource Name (ARN) of the Amazon S3 bucket."
}

Optional Parameters
{
  "Subdirectory": "A subdirectory in the Amazon S3 bucket. This subdirectory in Amazon S3 is used to read data from the S3 source location or write data to the S3 destination.",
  "Tags": "The key-value pair that represents the tag that you want to add to the location. The value can be an empty string. We recommend using tags to name your resources.",
  "S3StorageClass": "The Amazon S3 storage class that you want to store your files in when this location is used as a task destination. For more information about S3 storage classes, see Amazon S3 Storage Classes in the Amazon Simple Storage Service Developer Guide. Some storage classes have behaviors that can affect your S3 storage cost. For detailed information, see using-storage-classes."
}
"""
CreateLocationS3(args) = datasync("CreateLocationS3", args)

"""
    ListTaskExecutions()

Returns a list of executed tasks.

Optional Parameters
{
  "MaxResults": "The maximum number of executed tasks to list.",
  "NextToken": "An opaque string that indicates the position at which to begin the next list of the executed tasks.",
  "TaskArn": "The Amazon Resource Name (ARN) of the task whose tasks you want to list."
}
"""
ListTaskExecutions() = datasync("ListTaskExecutions")
ListTaskExecutions(args) = datasync("ListTaskExecutions", args)

"""
    CancelTaskExecution()

Cancels execution of a task.  When you cancel a task execution, the transfer of some files are abruptly interrupted. The contents of files that are transferred to the destination might be incomplete or inconsistent with the source files. However, if you start a new task execution on the same task and you allow the task execution to complete, file content on the destination is complete and consistent. This applies to other unexpected failures that interrupt a task execution. In all of these cases, AWS DataSync successfully complete the transfer when you start the next task execution.

Required Parameters
{
  "TaskExecutionArn": "The Amazon Resource Name (ARN) of the task execution to cancel."
}
"""
CancelTaskExecution(args) = datasync("CancelTaskExecution", args)

"""
    DeleteTask()

Deletes a task.

Required Parameters
{
  "TaskArn": "The Amazon Resource Name (ARN) of the task to delete."
}
"""
DeleteTask(args) = datasync("DeleteTask", args)

"""
    DescribeLocationSmb()

Returns metadata, such as the path and user information about a SMB location.

Required Parameters
{
  "LocationArn": "The Amazon resource Name (ARN) of the SMB location to describe."
}
"""
DescribeLocationSmb(args) = datasync("DescribeLocationSmb", args)

"""
    CreateLocationFsxWindows()

Creates an endpoint for an Amazon FSx for Windows file system.

Required Parameters
{
  "Password": "The password of the user who has the permissions to access files and folders in the FSx for Windows file system.",
  "SecurityGroupArns": "The Amazon Resource Names (ARNs) of the security groups that are to use to configure the FSx for Windows file system.",
  "User": "The user who has the permissions to access files and folders in the FSx for Windows file system.",
  "FsxFilesystemArn": "The Amazon Resource Name (ARN) for the FSx for Windows file system."
}

Optional Parameters
{
  "Subdirectory": "A subdirectory in the location’s path. This subdirectory in the Amazon FSx for Windows file system is used to read data from the Amazon FSx for Windows source location or write data to the FSx for Windows destination.",
  "Tags": "The key-value pair that represents a tag that you want to add to the resource. The value can be an empty string. This value helps you manage, filter, and search for your resources. We recommend that you create a name tag for your location.",
  "Domain": "The name of the Windows domain that the FSx for Windows server belongs to."
}
"""
CreateLocationFsxWindows(args) = datasync("CreateLocationFsxWindows", args)

"""
    StartTaskExecution()

Starts a specific invocation of a task. A TaskExecution value represents an individual run of a task. Each task can have at most one TaskExecution at a time.  TaskExecution has the following transition phases: INITIALIZING | PREPARING | TRANSFERRING | VERIFYING | SUCCESS/FAILURE.  For detailed information, see the Task Execution section in the Components and Terminology topic in the AWS DataSync User Guide.

Required Parameters
{
  "TaskArn": "The Amazon Resource Name (ARN) of the task to start."
}

Optional Parameters
{
  "Includes": "A list of filter rules that determines which files to include when running a task. The pattern should contain a single filter string that consists of the patterns to include. The patterns are delimited by \"|\" (that is, a pipe). For example: \"/folder1|/folder2\"   ",
  "OverrideOptions": ""
}
"""
StartTaskExecution(args) = datasync("StartTaskExecution", args)