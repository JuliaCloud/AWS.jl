# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: snowball
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "device_configuration" => "DeviceConfiguration",
    "snowball_capacity_preference" => "SnowballCapacityPreference",
    "remote_management" => "RemoteManagement",
    "next_token" => "NextToken",
    "long_term_pricing_id" => "LongTermPricingId",
    "role_arn" => "RoleARN",
    "is_long_term_pricing_auto_renew" => "IsLongTermPricingAutoRenew",
    "forwarding_address_id" => "ForwardingAddressId",
    "description" => "Description",
    "max_results" => "MaxResults",
    "address_id" => "AddressId",
    "shipping_option" => "ShippingOption",
    "replacement_job" => "ReplacementJob",
    "kms_key_arn" => "KmsKeyARN",
    "notification" => "Notification",
    "on_device_service_configuration" => "OnDeviceServiceConfiguration",
    "resources" => "Resources",
    "cluster_id" => "ClusterId",
    "tax_documents" => "TaxDocuments",
    "snowball_type" => "SnowballType",
    "job_type" => "JobType",
)

"""
    cancel_cluster(cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Cancels a cluster job. You can only cancel a cluster job while it's in the AwaitingQuorum
status. You'll have at least an hour after creating a cluster job to cancel it.

# Arguments
- `cluster_id`: The 39-character ID for the cluster that you want to cancel, for example
  CID123e4567-e89b-12d3-a456-426655440000.

"""
function cancel_cluster(
    ClusterId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "CancelCluster",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ClusterId" => ClusterId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    cancel_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Cancels the specified job. You can only cancel a job before its JobState value changes to
PreparingAppliance. Requesting the ListJobs or DescribeJob action returns a job's JobState
as part of the response element data returned.

# Arguments
- `job_id`: The 39-character job ID for the job that you want to cancel, for example
  JID123e4567-e89b-12d3-a456-426655440000.

"""
function cancel_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "CancelJob",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_address(address; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an address for a Snow device to be shipped to. In most regions, addresses are
validated at the time of creation. The address you provide must be located within the
serviceable area of your region. If the address is invalid or unsupported, then an
exception is thrown.

# Arguments
- `address`: The address that you want the Snow device shipped to.

"""
function create_address(
    Address; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "CreateAddress",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Address" => Address), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_cluster(address_id, job_type, resources, role_arn, shipping_option, snowball_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates an empty cluster. Each cluster supports five nodes. You use the CreateJob action
separately to create the jobs for each of these nodes. The cluster does not ship until
these five node jobs have been created.

# Arguments
- `address_id`: The ID for the address that you want the cluster shipped to.
- `job_type`: The type of job for this cluster. Currently, the only job type supported for
  clusters is LOCAL_USE. For more information, see
  \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow
  Family Devices and Capacity) in the Snowcone User Guide or
  \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\"
  (Snow Family Devices and Capacity) in the Snowcone User Guide.
- `resources`: The resources associated with the cluster job. These resources include
  Amazon S3 buckets and optional AWS Lambda functions written in the Python language.
- `role_arn`: The RoleARN that you want to associate with this cluster. RoleArn values are
  created by using the CreateRole API action in AWS Identity and Access Management (IAM).
- `shipping_option`: The shipping speed for each node in this cluster. This speed doesn't
  dictate how soon you'll get each Snowball Edge device, rather it represents how quickly
  each device moves to its destination while in transit. Regional shipping speeds are as
  follows:    In Australia, you have access to express shipping. Typically, Snow devices
  shipped express are delivered in about a day.   In the European Union (EU), you have access
  to express shipping. Typically, Snow devices shipped express are delivered in about a day.
  In addition, most countries in the EU have access to standard shipping, which typically
  takes less than a week, one way.   In India, Snow devices are delivered in one to seven
  days.   In the United States of America (US), you have access to one-day shipping and
  two-day shipping.     In Australia, you have access to express shipping. Typically, devices
  shipped express are delivered in about a day.   In the European Union (EU), you have access
  to express shipping. Typically, Snow devices shipped express are delivered in about a day.
  In addition, most countries in the EU have access to standard shipping, which typically
  takes less than a week, one way.   In India, Snow devices are delivered in one to seven
  days.   In the US, you have access to one-day shipping and two-day shipping.
- `snowball_type`: The type of AWS Snow Family device to use for this cluster.   For
  cluster jobs, AWS Snow Family currently supports only the EDGE device type.  For more
  information, see
  \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow
  Family Devices and Capacity) in the Snowcone User Guide or
  \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\"
  (Snow Family Devices and Capacity) in the Snowcone User Guide.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"description"`: An optional description of this specific cluster, for example
  Environmental Data Cluster-01.
- `"forwarding_address_id"`: The forwarding address ID for a cluster. This field is not
  supported in most regions.
- `"kms_key_arn"`: The KmsKeyARN value that you want to associate with this cluster.
  KmsKeyARN values are created by using the CreateKey API action in AWS Key Management
  Service (AWS KMS).
- `"notification"`: The Amazon Simple Notification Service (Amazon SNS) notification
  settings for this cluster.
- `"on_device_service_configuration"`: Specifies the service or services on the Snow Family
  device that your transferred data will be exported from or imported into. AWS Snow Family
  supports Amazon S3 and NFS (Network File System).
- `"remote_management"`: Allows you to securely operate and manage Snow devices in a
  cluster remotely from outside of your internal network. When set to INSTALLED_AUTOSTART,
  remote management will automatically be available when the device arrives at your location.
  Otherwise, you need to use the Snowball Client to manage the device.
- `"tax_documents"`: The tax documents required in your AWS Region.
"""
function create_cluster(
    AddressId,
    JobType,
    Resources,
    RoleARN,
    ShippingOption,
    SnowballType;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "CreateCluster",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AddressId" => AddressId,
                    "JobType" => JobType,
                    "Resources" => Resources,
                    "RoleARN" => RoleARN,
                    "ShippingOption" => ShippingOption,
                    "SnowballType" => SnowballType,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_job(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a job to import or export data between Amazon S3 and your on-premises data center.
Your AWS account must have the right trust policies and permissions in place to create a
job for a Snow device. If you're creating a job for a node in a cluster, you only need to
provide the clusterId value; the other job attributes are inherited from the cluster.
Only the Snowball; Edge device type is supported when ordering clustered jobs. The device
capacity is optional. Availability of device types differ by AWS Region. For more
information about Region availability, see AWS Regional Services.    AWS Snow Family device
types and their capacities.    Snow Family device type: SNC1_SSD    Capacity: T14
Description: Snowcone       Snow Family device type: SNC1_HDD    Capacity: T8
Description: Snowcone       Device type: EDGE_S    Capacity: T98   Description: Snowball
Edge Storage Optimized for data transfer only       Device type: EDGE_CG    Capacity: T42
Description: Snowball Edge Compute Optimized with GPU      Device type: EDGE_C    Capacity:
T42   Description: Snowball Edge Compute Optimized without GPU      Device type: EDGE
Capacity: T100   Description: Snowball Edge Storage Optimized with EC2 Compute      Device
type: STANDARD    Capacity: T50   Description: Original Snowball device  This device is
only available in the Ningxia, Beijing, and Singapore AWS Regions.        Device type:
STANDARD    Capacity: T80   Description: Original Snowball device  This device is only
available in the Ningxia, Beijing, and Singapore AWS Regions.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"address_id"`: The ID for the address that you want the Snow device shipped to.
- `"cluster_id"`: The ID of a cluster. If you're creating a job for a node in a cluster,
  you need to provide only this clusterId value. The other job attributes are inherited from
  the cluster.
- `"description"`: Defines an optional description of this specific job, for example
  Important Photos 2016-08-11.
- `"device_configuration"`: Defines the device configuration for an AWS Snowcone job. For
  more information, see
  \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow
  Family Devices and Capacity) in the Snowcone User Guide or
  \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\"
  (Snow Family Devices and Capacity) in the Snowcone User Guide.
- `"forwarding_address_id"`: The forwarding address ID for a job. This field is not
  supported in most Regions.
- `"job_type"`: Defines the type of job that you're creating.
- `"kms_key_arn"`: The KmsKeyARN that you want to associate with this job. KmsKeyARNs are
  created using the CreateKey AWS Key Management Service (KMS) API action.
- `"long_term_pricing_id"`: The ID of the long-term pricing type for the device.
- `"notification"`: Defines the Amazon Simple Notification Service (Amazon SNS)
  notification settings for this job.
- `"on_device_service_configuration"`: Specifies the service or services on the Snow Family
  device that your transferred data will be exported from or imported into. AWS Snow Family
  supports Amazon S3 and NFS (Network File System).
- `"remote_management"`: Allows you to securely operate and manage Snowcone devices
  remotely from outside of your internal network. When set to INSTALLED_AUTOSTART, remote
  management will automatically be available when the device arrives at your location.
  Otherwise, you need to use the Snowball Client to manage the device.
- `"resources"`: Defines the Amazon S3 buckets associated with this job. With IMPORT jobs,
  you specify the bucket or buckets that your transferred data will be imported into. With
  EXPORT jobs, you specify the bucket or buckets that your transferred data will be exported
  from. Optionally, you can also specify a KeyRange value. If you choose to export a range,
  you define the length of the range by providing either an inclusive BeginMarker value, an
  inclusive EndMarker value, or both. Ranges are UTF-8 binary sorted.
- `"role_arn"`: The RoleARN that you want to associate with this job. RoleArns are created
  using the CreateRole AWS Identity and Access Management (IAM) API action.
- `"shipping_option"`: The shipping speed for this job. This speed doesn't dictate how soon
  you'll get the Snow device, rather it represents how quickly the Snow device moves to its
  destination while in transit. Regional shipping speeds are as follows:   In Australia, you
  have access to express shipping. Typically, Snow devices shipped express are delivered in
  about a day.   In the European Union (EU), you have access to express shipping. Typically,
  Snow devices shipped express are delivered in about a day. In addition, most countries in
  the EU have access to standard shipping, which typically takes less than a week, one way.
  In India, Snow devices are delivered in one to seven days.   In the US, you have access to
  one-day shipping and two-day shipping.
- `"snowball_capacity_preference"`: If your job is being created in one of the US regions,
  you have the option of specifying what size Snow device you'd like for this job. In all
  other regions, Snowballs come with 80 TB in storage capacity. For more information, see
  \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow
  Family Devices and Capacity) in the Snowcone User Guide or
  \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\"
  (Snow Family Devices and Capacity) in the Snowcone User Guide.
- `"snowball_type"`: The type of AWS Snow Family device to use for this job.   For cluster
  jobs, AWS Snow Family currently supports only the EDGE device type.  The type of AWS Snow
  device to use for this job. Currently, the only supported device type for cluster jobs is
  EDGE. For more information, see Snowball Edge Device Options in the Snowball Edge Developer
  Guide. For more information, see
  \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow
  Family Devices and Capacity) in the Snowcone User Guide or
  \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\"
  (Snow Family Devices and Capacity) in the Snowcone User Guide.
- `"tax_documents"`: The tax documents required in your AWS Region.
"""
function create_job(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "CreateJob", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    create_long_term_pricing(long_term_pricing_type; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a job with the long-term usage option for a device. The long-term usage is a 1-year
or 3-year long-term pricing type for the device. You are billed upfront, and AWS provides
discounts for long-term pricing.

# Arguments
- `long_term_pricing_type`: The type of long-term pricing option you want for the device,
  either 1-year or 3-year long-term pricing.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"is_long_term_pricing_auto_renew"`: Specifies whether the current long-term pricing type
  for the device should be renewed.
- `"snowball_type"`: The type of AWS Snow Family device to use for the long-term pricing
  job.
"""
function create_long_term_pricing(
    LongTermPricingType; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "CreateLongTermPricing",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("LongTermPricingType" => LongTermPricingType),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_return_shipping_label(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a shipping label that will be used to return the Snow device to AWS.

# Arguments
- `job_id`: The ID for a job that you want to create the return shipping label for; for
  example, JID123e4567-e89b-12d3-a456-426655440000.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"shipping_option"`: The shipping speed for a particular job. This speed doesn't dictate
  how soon the device is returned to AWS. This speed represents how quickly it moves to its
  destination while in transit. Regional shipping speeds are as follows:
"""
function create_return_shipping_label(
    JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "CreateReturnShippingLabel",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_address(address_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Takes an AddressId and returns specific details about that address in the form of an
Address object.

# Arguments
- `address_id`: The automatically generated ID for a specific address.

"""
function describe_address(
    AddressId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "DescribeAddress",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("AddressId" => AddressId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_addresses(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a specified number of ADDRESS objects. Calling this API in one of the US regions
will return addresses from the list of all addresses associated with this account in all US
regions.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The number of ADDRESS objects to return.
- `"next_token"`: HTTP requests are stateless. To identify what object comes \"next\" in
  the list of ADDRESS objects, you have the option of specifying a value for NextToken as the
  starting point for your list of returned addresses.
"""
function describe_addresses(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "DescribeAddresses", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    describe_cluster(cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a specific cluster including shipping information, cluster
status, and other important metadata.

# Arguments
- `cluster_id`: The automatically generated ID for a cluster.

"""
function describe_cluster(
    ClusterId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "DescribeCluster",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ClusterId" => ClusterId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about a specific job including shipping information, job status, and
other important metadata.

# Arguments
- `job_id`: The automatically generated ID for a job, for example
  JID123e4567-e89b-12d3-a456-426655440000.

"""
function describe_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "DescribeJob",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_return_shipping_label(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Information on the shipping label of a Snow device that is being returned to AWS.

# Arguments
- `job_id`: The automatically generated ID for a job, for example
  JID123e4567-e89b-12d3-a456-426655440000.

"""
function describe_return_shipping_label(
    JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "DescribeReturnShippingLabel",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_job_manifest(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns a link to an Amazon S3 presigned URL for the manifest file associated with the
specified JobId value. You can access the manifest file for up to 60 minutes after this
request has been made. To access the manifest file after 60 minutes have passed, you'll
have to make another call to the GetJobManifest action. The manifest is an encrypted file
that you can download after your job enters the WithCustomer status. The manifest is
decrypted by using the UnlockCode code value, when you pass both values to the Snow device
through the Snowball client when the client is started for the first time. As a best
practice, we recommend that you don't save a copy of an UnlockCode value in the same
location as the manifest file for that job. Saving these separately helps prevent
unauthorized parties from gaining access to the Snow device associated with that job. The
credentials of a given job, including its manifest file and unlock code, expire 360 days
after the job is created.

# Arguments
- `job_id`: The ID for a job that you want to get the manifest file for, for example
  JID123e4567-e89b-12d3-a456-426655440000.

"""
function get_job_manifest(
    JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "GetJobManifest",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_job_unlock_code(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the UnlockCode code value for the specified job. A particular UnlockCode value can
be accessed for up to 360 days after the associated job has been created. The UnlockCode
value is a 29-character code with 25 alphanumeric characters and 4 hyphens. This code is
used to decrypt the manifest file when it is passed along with the manifest to the Snow
device through the Snowball client when the client is started for the first time. As a best
practice, we recommend that you don't save a copy of the UnlockCode in the same location as
the manifest file for that job. Saving these separately helps prevent unauthorized parties
from gaining access to the Snow device associated with that job.

# Arguments
- `job_id`: The ID for the job that you want to get the UnlockCode value for, for example
  JID123e4567-e89b-12d3-a456-426655440000.

"""
function get_job_unlock_code(
    JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "GetJobUnlockCode",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_snowball_usage(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the Snow Family service limit for your account, and also the
number of Snow devices your account has in use. The default service limit for the number of
Snow devices that you can have at one time is 1. If you want to increase your service
limit, contact AWS Support.

"""
function get_snowball_usage(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "GetSnowballUsage", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    get_software_updates(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns an Amazon S3 presigned URL for an update file associated with a specified JobId.

# Arguments
- `job_id`: The ID for a job that you want to get the software update file for, for example
  JID123e4567-e89b-12d3-a456-426655440000.

"""
function get_software_updates(
    JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "GetSoftwareUpdates",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_cluster_jobs(cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns an array of JobListEntry objects of the specified length. Each JobListEntry object
is for a job in the specified cluster and contains a job's state, a job's ID, and other
information.

# Arguments
- `cluster_id`: The 39-character ID for the cluster that you want to list, for example
  CID123e4567-e89b-12d3-a456-426655440000.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The number of JobListEntry objects to return.
- `"next_token"`: HTTP requests are stateless. To identify what object comes \"next\" in
  the list of JobListEntry objects, you have the option of specifying NextToken as the
  starting point for your returned list.
"""
function list_cluster_jobs(
    ClusterId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "ListClusterJobs",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ClusterId" => ClusterId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_clusters(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns an array of ClusterListEntry objects of the specified length. Each ClusterListEntry
object contains a cluster's state, a cluster's ID, and other important status information.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The number of ClusterListEntry objects to return.
- `"next_token"`: HTTP requests are stateless. To identify what object comes \"next\" in
  the list of ClusterListEntry objects, you have the option of specifying NextToken as the
  starting point for your returned list.
"""
function list_clusters(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "ListClusters", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_compatible_images(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

This action returns a list of the different Amazon EC2 Amazon Machine Images (AMIs) that
are owned by your AWS account that would be supported for use on a Snow device. Currently,
supported AMIs are based on the CentOS 7 (x86_64) - with Updates HVM, Ubuntu Server 14.04
LTS (HVM), and Ubuntu 16.04 LTS - Xenial (HVM) images, available on the AWS Marketplace.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of results for the list of compatible images.
  Currently, a Snowball Edge device can store 10 AMIs.
- `"next_token"`: HTTP requests are stateless. To identify what object comes \"next\" in
  the list of compatible images, you can specify a value for NextToken as the starting point
  for your list of returned images.
"""
function list_compatible_images(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "ListCompatibleImages",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns an array of JobListEntry objects of the specified length. Each JobListEntry object
contains a job's state, a job's ID, and a value that indicates whether the job is a job
part, in the case of export jobs. Calling this API action in one of the US regions will
return jobs from the list of all jobs associated with this account in all US regions.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The number of JobListEntry objects to return.
- `"next_token"`: HTTP requests are stateless. To identify what object comes \"next\" in
  the list of JobListEntry objects, you have the option of specifying NextToken as the
  starting point for your returned list.
"""
function list_jobs(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "ListJobs", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_long_term_pricing(; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Lists all long-term pricing types.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The maximum number of ListLongTermPricing objects to return.
- `"next_token"`: Because HTTP requests are stateless, this is the starting point for your
  next list of ListLongTermPricing to return.
"""
function list_long_term_pricing(;
    aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "ListLongTermPricing",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_cluster(cluster_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

While a cluster's ClusterState value is in the AwaitingQuorum state, you can update some of
the information associated with a cluster. Once the cluster changes to a different job
state, usually 60 minutes after the cluster being created, this action is no longer
available.

# Arguments
- `cluster_id`: The cluster ID of the cluster that you want to update, for example
  CID123e4567-e89b-12d3-a456-426655440000.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"address_id"`: The ID of the updated Address object.
- `"description"`: The updated description of this cluster.
- `"forwarding_address_id"`: The updated ID for the forwarding address for a cluster. This
  field is not supported in most regions.
- `"notification"`: The new or updated Notification object.
- `"on_device_service_configuration"`: Specifies the service or services on the Snow Family
  device that your transferred data will be exported from or imported into. AWS Snow Family
  supports Amazon S3 and NFS (Network File System).
- `"resources"`: The updated arrays of JobResource objects that can include updated
  S3Resource objects or LambdaResource objects.
- `"role_arn"`: The new role Amazon Resource Name (ARN) that you want to associate with
  this cluster. To create a role ARN, use the CreateRole API action in AWS Identity and
  Access Management (IAM).
- `"shipping_option"`: The updated shipping option value of this cluster's ShippingDetails
  object.
"""
function update_cluster(
    ClusterId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "UpdateCluster",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ClusterId" => ClusterId), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_job(job_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

While a job's JobState value is New, you can update some of the information associated with
a job. Once the job changes to a different job state, usually within 60 minutes of the job
being created, this action is no longer available.

# Arguments
- `job_id`: The job ID of the job that you want to update, for example
  JID123e4567-e89b-12d3-a456-426655440000.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"address_id"`: The ID of the updated Address object.
- `"description"`: The updated description of this job's JobMetadata object.
- `"forwarding_address_id"`: The updated ID for the forwarding address for a job. This
  field is not supported in most regions.
- `"notification"`: The new or updated Notification object.
- `"on_device_service_configuration"`: Specifies the service or services on the Snow Family
  device that your transferred data will be exported from or imported into. AWS Snow Family
  supports Amazon S3 and NFS (Network File System).
- `"resources"`: The updated JobResource object, or the updated JobResource object.
- `"role_arn"`: The new role Amazon Resource Name (ARN) that you want to associate with
  this job. To create a role ARN, use the CreateRoleAWS Identity and Access Management (IAM)
  API action.
- `"shipping_option"`: The updated shipping option value of this job's ShippingDetails
  object.
- `"snowball_capacity_preference"`: The updated SnowballCapacityPreference of this job's
  JobMetadata object. The 50 TB Snowballs are only available in the US regions. For more
  information, see
  \"https://docs.aws.amazon.com/snowball/latest/snowcone-guide/snow-device-types.html\" (Snow
  Family Devices and Capacity) in the Snowcone User Guide or
  \"https://docs.aws.amazon.com/snowball/latest/developer-guide/snow-device-types.html\"
  (Snow Family Devices and Capacity) in the Snowcone User Guide.
"""
function update_job(JobId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "UpdateJob",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_job_shipment_state(job_id, shipment_state; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the state when a shipment state changes to a different state.

# Arguments
- `job_id`: The job ID of the job whose shipment date you want to update, for example
  JID123e4567-e89b-12d3-a456-426655440000.
- `shipment_state`: The state of a device when it is being shipped.  Set to RECEIVED when
  the device arrives at your location. Set to RETURNED when you have returned the device to
  AWS.

"""
function update_job_shipment_state(
    JobId, ShipmentState; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "UpdateJobShipmentState",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("JobId" => JobId, "ShipmentState" => ShipmentState),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_long_term_pricing(long_term_pricing_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Updates the long-term pricing type.

# Arguments
- `long_term_pricing_id`: The ID of the long-term pricing type for the device.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"is_long_term_pricing_auto_renew"`: If set to true, specifies that the current long-term
  pricing type for the device should be automatically renewed before the long-term pricing
  contract expires.
- `"replacement_job"`: Specifies that a device that is ordered with long-term pricing
  should be replaced with a new device.
"""
function update_long_term_pricing(
    LongTermPricingId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return snowball(
        "UpdateLongTermPricing",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("LongTermPricingId" => LongTermPricingId), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
