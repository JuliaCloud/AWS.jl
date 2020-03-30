include("../AWSServices.jl")
using .AWSServices: comprehendmedical

"""
    StartPHIDetectionJob()

Starts an asynchronous job to detect protected health information (PHI). Use the DescribePHIDetectionJob operation to track the status of a job.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend Medical read access to your input data. For more information, see  Role-Based Permissions Required for Asynchronous Operations.",
  "LanguageCode": "The language of the input documents. All documents must be in the same language."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you don't set the client request token, Amazon Comprehend Medical generates one.",
  "KMSKey": "An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the files are written in plain text.",
  "JobName": "The identifier of the job."
}
"""
StartPHIDetectionJob(args) = comprehendmedical("StartPHIDetectionJob", args)

"""
    DetectEntities()

The DetectEntities operation is deprecated. You should use the DetectEntitiesV2 operation instead.  Inspects the clinical text for a variety of medical entities and returns specific information about them such as entity category, location, and confidence score on that information .

Required Parameters
{
  "Text": " A UTF-8 text string containing the clinical content being examined for entities. Each string must contain fewer than 20,000 bytes of characters."
}
"""
DetectEntities(args) = comprehendmedical("DetectEntities", args)

"""
    StopPHIDetectionJob()

Stops a protected health information (PHI) detection job in progress.

Required Parameters
{
  "JobId": "The identifier of the PHI detection job to stop."
}
"""
StopPHIDetectionJob(args) = comprehendmedical("StopPHIDetectionJob", args)

"""
    DetectEntitiesV2()

Inspects the clinical text for a variety of medical entities and returns specific information about them such as entity category, location, and confidence score on that information. Amazon Comprehend Medical only detects medical entities in English language texts. The DetectEntitiesV2 operation replaces the DetectEntities operation. This new action uses a different model for determining the entities in your medical text and changes the way that some entities are returned in the output. You should use the DetectEntitiesV2 operation in all new applications. The DetectEntitiesV2 operation returns the Acuity and Direction entities as attributes instead of types. 

Required Parameters
{
  "Text": "A UTF-8 string containing the clinical content being examined for entities. Each string must contain fewer than 20,000 bytes of characters."
}
"""
DetectEntitiesV2(args) = comprehendmedical("DetectEntitiesV2", args)

"""
    InferRxNorm()

InferRxNorm detects medications as entities listed in a patient record and links to the normalized concept identifiers in the RxNorm database from the National Library of Medicine. Amazon Comprehend Medical only detects medical entities in English language texts.

Required Parameters
{
  "Text": "The input text used for analysis. The input for InferRxNorm is a string from 1 to 10000 characters."
}
"""
InferRxNorm(args) = comprehendmedical("InferRxNorm", args)

"""
    StartEntitiesDetectionV2Job()

Starts an asynchronous medical entity detection job for a collection of documents. Use the DescribeEntitiesDetectionV2Job operation to track the status of a job.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend Medical read access to your input data. For more information, see  Role-Based Permissions Required for Asynchronous Operations.",
  "LanguageCode": "The language of the input documents. All documents must be in the same language."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you don't set the client request token, Amazon Comprehend Medical generates one.",
  "KMSKey": "An AWS Key Management Service key to encrypt your output files. If you do not specify a key, the files are written in plain text.",
  "JobName": "The identifier of the job."
}
"""
StartEntitiesDetectionV2Job(args) = comprehendmedical("StartEntitiesDetectionV2Job", args)

"""
    ListEntitiesDetectionV2Jobs()

Gets a list of medical entity detection jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. You can filter jobs based on their names, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListEntitiesDetectionV2Jobs() = comprehendmedical("ListEntitiesDetectionV2Jobs")
ListEntitiesDetectionV2Jobs(args) = comprehendmedical("ListEntitiesDetectionV2Jobs", args)

"""
    ListPHIDetectionJobs()

Gets a list of protected health information (PHI) detection jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. You can filter jobs based on their names, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListPHIDetectionJobs() = comprehendmedical("ListPHIDetectionJobs")
ListPHIDetectionJobs(args) = comprehendmedical("ListPHIDetectionJobs", args)

"""
    DetectPHI()

 Inspects the clinical text for protected health information (PHI) entities and returns the entity category, location, and confidence score for each entity. Amazon Comprehend Medical only detects entities in English language texts.

Required Parameters
{
  "Text": " A UTF-8 text string containing the clinical content being examined for PHI entities. Each string must contain fewer than 20,000 bytes of characters."
}
"""
DetectPHI(args) = comprehendmedical("DetectPHI", args)

"""
    StopEntitiesDetectionV2Job()

Stops a medical entities detection job in progress.

Required Parameters
{
  "JobId": "The identifier of the medical entities job to stop."
}
"""
StopEntitiesDetectionV2Job(args) = comprehendmedical("StopEntitiesDetectionV2Job", args)

"""
    InferICD10CM()

InferICD10CM detects medical conditions as entities listed in a patient record and links those entities to normalized concept identifiers in the ICD-10-CM knowledge base from the Centers for Disease Control. Amazon Comprehend Medical only detects medical entities in English language texts.

Required Parameters
{
  "Text": "The input text used for analysis. The input for InferICD10CM is a string from 1 to 10000 characters."
}
"""
InferICD10CM(args) = comprehendmedical("InferICD10CM", args)

"""
    DescribePHIDetectionJob()

Gets the properties associated with a protected health information (PHI) detection job. Use this operation to get the status of a detection job.

Required Parameters
{
  "JobId": "The identifier that Amazon Comprehend Medical generated for the job. The StartPHIDetectionJob operation returns this identifier in its response."
}
"""
DescribePHIDetectionJob(args) = comprehendmedical("DescribePHIDetectionJob", args)

"""
    DescribeEntitiesDetectionV2Job()

Gets the properties associated with a medical entities detection job. Use this operation to get the status of a detection job.

Required Parameters
{
  "JobId": "The identifier that Amazon Comprehend Medical generated for the job. The StartEntitiesDetectionV2Job operation returns this identifier in its response."
}
"""
DescribeEntitiesDetectionV2Job(args) = comprehendmedical("DescribeEntitiesDetectionV2Job", args)
