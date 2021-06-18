# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: healthlake
using AWS.Compat
using AWS.UUIDs

"""
    create_fhirdatastore(datastore_type_version)
    create_fhirdatastore(datastore_type_version, params::Dict{String,<:Any})

Creates a Data Store that can ingest and export FHIR formatted data.

# Arguments
- `datastore_type_version`: The FHIR version of the Data Store. The only supported version
  is R4.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClientToken"`: Optional user provided token used for ensuring idempotency.
- `"DatastoreName"`: The user generated name for the Data Store.
- `"PreloadDataConfig"`: Optional parameter to preload data upon creation of the Data
  Store. Currently, the only supported preloaded data is synthetic data generated from
  Synthea.
"""
create_fhirdatastore(DatastoreTypeVersion; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("CreateFHIRDatastore", Dict{String, Any}("DatastoreTypeVersion"=>DatastoreTypeVersion, "ClientToken"=>string(uuid4())); aws_config=aws_config)
create_fhirdatastore(DatastoreTypeVersion, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("CreateFHIRDatastore", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DatastoreTypeVersion"=>DatastoreTypeVersion, "ClientToken"=>string(uuid4())), params)); aws_config=aws_config)

"""
    delete_fhirdatastore()
    delete_fhirdatastore(params::Dict{String,<:Any})

Deletes a Data Store.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DatastoreId"`:  The AWS-generated ID for the Data Store to be deleted.
"""
delete_fhirdatastore(; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DeleteFHIRDatastore"; aws_config=aws_config)
delete_fhirdatastore(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DeleteFHIRDatastore", params; aws_config=aws_config)

"""
    describe_fhirdatastore()
    describe_fhirdatastore(params::Dict{String,<:Any})

Gets the properties associated with the FHIR Data Store, including the Data Store ID, Data
Store ARN, Data Store name, Data Store status, created at, Data Store type version, and
Data Store endpoint.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DatastoreId"`: The AWS-generated Data Store id. This is part of the
  ‘CreateFHIRDatastore’ output.
"""
describe_fhirdatastore(; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DescribeFHIRDatastore"; aws_config=aws_config)
describe_fhirdatastore(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DescribeFHIRDatastore", params; aws_config=aws_config)

"""
    describe_fhirexport_job(datastore_id, job_id)
    describe_fhirexport_job(datastore_id, job_id, params::Dict{String,<:Any})

Displays the properties of a FHIR export job, including the ID, ARN, name, and the status
of the job.

# Arguments
- `datastore_id`: The AWS generated ID for the Data Store from which files are being
  exported from for an export job.
- `job_id`: The AWS generated ID for an export job.

"""
describe_fhirexport_job(DatastoreId, JobId; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DescribeFHIRExportJob", Dict{String, Any}("DatastoreId"=>DatastoreId, "JobId"=>JobId); aws_config=aws_config)
describe_fhirexport_job(DatastoreId, JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DescribeFHIRExportJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DatastoreId"=>DatastoreId, "JobId"=>JobId), params)); aws_config=aws_config)

"""
    describe_fhirimport_job(datastore_id, job_id)
    describe_fhirimport_job(datastore_id, job_id, params::Dict{String,<:Any})

Displays the properties of a FHIR import job, including the ID, ARN, name, and the status
of the job.

# Arguments
- `datastore_id`: The AWS-generated ID of the Data Store.
- `job_id`: The AWS-generated job ID.

"""
describe_fhirimport_job(DatastoreId, JobId; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DescribeFHIRImportJob", Dict{String, Any}("DatastoreId"=>DatastoreId, "JobId"=>JobId); aws_config=aws_config)
describe_fhirimport_job(DatastoreId, JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("DescribeFHIRImportJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("DatastoreId"=>DatastoreId, "JobId"=>JobId), params)); aws_config=aws_config)

"""
    list_fhirdatastores()
    list_fhirdatastores(params::Dict{String,<:Any})

Lists all FHIR Data Stores that are in the user’s account, regardless of Data Store
status.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Filter"`: Lists all filters associated with a FHIR Data Store request.
- `"MaxResults"`: The maximum number of Data Stores returned in a single page of a
  ListFHIRDatastoresRequest call.
- `"NextToken"`: Fetches the next page of Data Stores when results are paginated.
"""
list_fhirdatastores(; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("ListFHIRDatastores"; aws_config=aws_config)
list_fhirdatastores(params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("ListFHIRDatastores", params; aws_config=aws_config)

"""
    start_fhirexport_job(client_token, data_access_role_arn, datastore_id, output_data_config)
    start_fhirexport_job(client_token, data_access_role_arn, datastore_id, output_data_config, params::Dict{String,<:Any})

Begins a FHIR export job.

# Arguments
- `client_token`: An optional user provided token used for ensuring idempotency.
- `data_access_role_arn`: The Amazon Resource Name used during the initiation of the job.
- `datastore_id`: The AWS generated ID for the Data Store from which files are being
  exported for an export job.
- `output_data_config`: The output data configuration that was supplied when the export job
  was created.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"JobName"`: The user generated name for an export job.
"""
start_fhirexport_job(ClientToken, DataAccessRoleArn, DatastoreId, OutputDataConfig; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("StartFHIRExportJob", Dict{String, Any}("ClientToken"=>ClientToken, "DataAccessRoleArn"=>DataAccessRoleArn, "DatastoreId"=>DatastoreId, "OutputDataConfig"=>OutputDataConfig); aws_config=aws_config)
start_fhirexport_job(ClientToken, DataAccessRoleArn, DatastoreId, OutputDataConfig, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("StartFHIRExportJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientToken"=>ClientToken, "DataAccessRoleArn"=>DataAccessRoleArn, "DatastoreId"=>DatastoreId, "OutputDataConfig"=>OutputDataConfig), params)); aws_config=aws_config)

"""
    start_fhirimport_job(client_token, data_access_role_arn, datastore_id, input_data_config)
    start_fhirimport_job(client_token, data_access_role_arn, datastore_id, input_data_config, params::Dict{String,<:Any})

Begins a FHIR Import job.

# Arguments
- `client_token`: Optional user provided token used for ensuring idempotency.
- `data_access_role_arn`: The Amazon Resource Name (ARN) that gives Amazon HealthLake
  access permission.
- `datastore_id`: The AWS-generated Data Store ID.
- `input_data_config`: The input properties of the FHIR Import job in the StartFHIRImport
  job request.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"JobName"`: The name of the FHIR Import job in the StartFHIRImport job request.
"""
start_fhirimport_job(ClientToken, DataAccessRoleArn, DatastoreId, InputDataConfig; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("StartFHIRImportJob", Dict{String, Any}("ClientToken"=>ClientToken, "DataAccessRoleArn"=>DataAccessRoleArn, "DatastoreId"=>DatastoreId, "InputDataConfig"=>InputDataConfig); aws_config=aws_config)
start_fhirimport_job(ClientToken, DataAccessRoleArn, DatastoreId, InputDataConfig, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()) = healthlake("StartFHIRImportJob", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ClientToken"=>ClientToken, "DataAccessRoleArn"=>DataAccessRoleArn, "DatastoreId"=>DatastoreId, "InputDataConfig"=>InputDataConfig), params)); aws_config=aws_config)