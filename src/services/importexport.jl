# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: importexport

using Compat
using UUIDs
"""
    CancelJob()

This operation cancels a specified job. Only the job owner can cancel it. The operation fails if the job has already started or is complete.

# Required Parameters
- `JobId`: 

# Optional Parameters
- `APIVersion`: 
"""
CancelJob(JobId; aws::AWSConfig=AWSConfig()) = importexport("CancelJob", Dict{String, Any}("JobId"=>JobId); aws=aws)
CancelJob(JobId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = importexport("CancelJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), args)); aws=aws)

"""
    CreateJob()

This operation initiates the process of scheduling an upload or download of your data. You include in the request a manifest that describes the data transfer specifics. The response to the request includes a job ID, which you can use in other operations, a signature that you use to identify your storage device, and the address where you should ship your storage device.

# Required Parameters
- `JobType`: 
- `Manifest`: 
- `ValidateOnly`: 

# Optional Parameters
- `APIVersion`: 
- `ManifestAddendum`: 
"""
CreateJob(JobType, Manifest, ValidateOnly; aws::AWSConfig=AWSConfig()) = importexport("CreateJob", Dict{String, Any}("JobType"=>JobType, "Manifest"=>Manifest, "ValidateOnly"=>ValidateOnly); aws=aws)
CreateJob(JobType, Manifest, ValidateOnly, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = importexport("CreateJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobType"=>JobType, "Manifest"=>Manifest, "ValidateOnly"=>ValidateOnly), args)); aws=aws)

"""
    GetShippingLabel()

This operation generates a pre-paid UPS shipping label that you will use to ship your device to AWS for processing.

# Required Parameters
- `jobIds`: 

# Optional Parameters
- `APIVersion`: 
- `city`: 
- `company`: 
- `country`: 
- `name`: 
- `phoneNumber`: 
- `postalCode`: 
- `stateOrProvince`: 
- `street1`: 
- `street2`: 
- `street3`: 
"""
GetShippingLabel(jobIds; aws::AWSConfig=AWSConfig()) = importexport("GetShippingLabel", Dict{String, Any}("jobIds"=>jobIds); aws=aws)
GetShippingLabel(jobIds, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = importexport("GetShippingLabel", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("jobIds"=>jobIds), args)); aws=aws)

"""
    GetStatus()

This operation returns information about a job, including where the job is in the processing pipeline, the status of the results, and the signature value associated with the job. You can only return information about jobs you own.

# Required Parameters
- `JobId`: 

# Optional Parameters
- `APIVersion`: 
"""
GetStatus(JobId; aws::AWSConfig=AWSConfig()) = importexport("GetStatus", Dict{String, Any}("JobId"=>JobId); aws=aws)
GetStatus(JobId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = importexport("GetStatus", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId), args)); aws=aws)

"""
    ListJobs()

This operation returns the jobs associated with the requester. AWS Import/Export lists the jobs in reverse chronological order based on the date of creation. For example if Job Test1 was created 2009Dec30 and Test2 was created 2010Feb05, the ListJobs operation would return Test2 followed by Test1.

# Optional Parameters
- `APIVersion`: 
- `Marker`: 
- `MaxJobs`: 
"""
ListJobs(; aws::AWSConfig=AWSConfig()) = importexport("ListJobs"; aws=aws)
ListJobs(args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = importexport("ListJobs", args; aws=aws)

"""
    UpdateJob()

You use this operation to change the parameters specified in the original manifest file by supplying a new manifest file. The manifest file attached to this request replaces the original manifest file. You can only use the operation after a CreateJob request but before the data transfer starts and you can only use it on jobs you own.

# Required Parameters
- `JobId`: 
- `JobType`: 
- `Manifest`: 
- `ValidateOnly`: 

# Optional Parameters
- `APIVersion`: 
"""
UpdateJob(JobId, JobType, Manifest, ValidateOnly; aws::AWSConfig=AWSConfig()) = importexport("UpdateJob", Dict{String, Any}("JobId"=>JobId, "JobType"=>JobType, "Manifest"=>Manifest, "ValidateOnly"=>ValidateOnly); aws=aws)
UpdateJob(JobId, JobType, Manifest, ValidateOnly, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = importexport("UpdateJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("JobId"=>JobId, "JobType"=>JobType, "Manifest"=>Manifest, "ValidateOnly"=>ValidateOnly), args)); aws=aws)
