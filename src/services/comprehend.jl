include("../AWSServices.jl")
using .AWSServices: comprehend

"""
    ListTopicsDetectionJobs()

Gets a list of the topic detection jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. Jobs can be filtered on their name, status, or the date and time that they were submitted. You can set only one filter at a time."
}
"""
ListTopicsDetectionJobs() = comprehend("ListTopicsDetectionJobs")
ListTopicsDetectionJobs(args) = comprehend("ListTopicsDetectionJobs", args)

"""
    CreateEndpoint()

Creates a model-specific endpoint for synchronous inference for a previously trained custom model 

Required Parameters
{
  "EndpointName": "This is the descriptive suffix that becomes part of the EndpointArn used for all subsequent requests to this resource. ",
  "DesiredInferenceUnits": " The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.",
  "ModelArn": "The Amazon Resource Number (ARN) of the model to which the endpoint will be attached."
}

Optional Parameters
{
  "ClientRequestToken": "An idempotency token provided by the customer. If this token matches a previous endpoint creation request, Amazon Comprehend will not return a ResourceInUseException. ",
  "Tags": "Tags associated with the endpoint being created. A tag is a key-value pair that adds metadata to the endpoint. For example, a tag with \"Sales\" as the key might be added to an endpoint to indicate its use by the sales department. "
}
"""
CreateEndpoint(args) = comprehend("CreateEndpoint", args)

"""
    ListDocumentClassifiers()

Gets a list of the document classifiers that you have created.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListDocumentClassifiers() = comprehend("ListDocumentClassifiers")
ListDocumentClassifiers(args) = comprehend("ListDocumentClassifiers", args)

"""
    StartDominantLanguageDetectionJob()

Starts an asynchronous dominant language detection job for a collection of documents. Use the operation to track the status of a job.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your dominant language detection job. For more information, see Amazon VPC. ",
  "JobName": "An identifier for the job."
}
"""
StartDominantLanguageDetectionJob(args) = comprehend("StartDominantLanguageDetectionJob", args)

"""
    TagResource()

Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with "Sales" as the key might be added to a resource to indicate its use by the sales department. 

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to which you want to associate the tags. ",
  "Tags": "Tags being associated with a specific Amazon Comprehend resource. There can be a maximum of 50 tags (both existing and pending) associated with a specific resource. "
}
"""
TagResource(args) = comprehend("TagResource", args)

"""
    StopSentimentDetectionJob()

Stops a sentiment detection job in progress. If the job state is IN_PROGRESS the job is marked for termination and put into the STOP_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is be stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception.  When a job is stopped, any documents already processed are written to the output location.

Required Parameters
{
  "JobId": "The identifier of the sentiment detection job to stop."
}
"""
StopSentimentDetectionJob(args) = comprehend("StopSentimentDetectionJob", args)

"""
    CreateDocumentClassifier()

Creates a new document classifier that you can use to categorize documents. To create a classifier you provide a set of training documents that labeled with the categories that you want to use. After the classifier is trained you can use it to categorize a set of labeled documents into the categories. For more information, see how-document-classification.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "DocumentClassifierName": "The name of the document classifier.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.",
  "LanguageCode": "The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\"de\"), English (\"en\"), Spanish (\"es\"), French (\"fr\"), Italian (\"it\"), or Portuguese (\"pt\"). All documents must be in the same language."
}

Optional Parameters
{
  "Mode": "Indicates the mode in which the classifier will be trained. The classifier can be trained in multi-class mode, which identifies one and only one class for each document, or multi-label mode, which identifies one or more labels for each document. In multi-label mode, multiple labels for an individual document are separated by a delimiter. The default delimiter between labels is a pipe (|).",
  "Tags": "Tags to be associated with the document classifier being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as the key might be added to a resource to indicate its use by the sales department. ",
  "OutputDataConfig": "Enables the addition of output results configuration parameters for custom classifier jobs.",
  "ClientRequestToken": "A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see Amazon VPC. "
}
"""
CreateDocumentClassifier(args) = comprehend("CreateDocumentClassifier", args)

"""
    ListKeyPhrasesDetectionJobs()

Get a list of key phrase detection jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListKeyPhrasesDetectionJobs() = comprehend("ListKeyPhrasesDetectionJobs")
ListKeyPhrasesDetectionJobs(args) = comprehend("ListKeyPhrasesDetectionJobs", args)

"""
    StopTrainingDocumentClassifier()

Stops a document classifier training job while in progress. If the training job state is TRAINING, the job is marked for termination and put into the STOP_REQUESTED state. If the training job completes before it can be stopped, it is put into the TRAINED; otherwise the training job is stopped and put into the STOPPED state and the service sends back an HTTP 200 response with an empty HTTP body. 

Required Parameters
{
  "DocumentClassifierArn": "The Amazon Resource Name (ARN) that identifies the document classifier currently being trained."
}
"""
StopTrainingDocumentClassifier(args) = comprehend("StopTrainingDocumentClassifier", args)

"""
    ListDominantLanguageDetectionJobs()

Gets a list of the dominant language detection jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters that jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListDominantLanguageDetectionJobs() = comprehend("ListDominantLanguageDetectionJobs")
ListDominantLanguageDetectionJobs(args) = comprehend("ListDominantLanguageDetectionJobs", args)

"""
    ListSentimentDetectionJobs()

Gets a list of sentiment detection jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListSentimentDetectionJobs() = comprehend("ListSentimentDetectionJobs")
ListSentimentDetectionJobs(args) = comprehend("ListSentimentDetectionJobs", args)

"""
    StopDominantLanguageDetectionJob()

Stops a dominant language detection job in progress. If the job state is IN_PROGRESS the job is marked for termination and put into the STOP_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception.  When a job is stopped, any documents already processed are written to the output location.

Required Parameters
{
  "JobId": "The identifier of the dominant language detection job to stop."
}
"""
StopDominantLanguageDetectionJob(args) = comprehend("StopDominantLanguageDetectionJob", args)

"""
    BatchDetectSyntax()

Inspects the text of a batch of documents for the syntax and part of speech of the words in the document and returns information about them. For more information, see how-syntax.

Required Parameters
{
  "TextList": "A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.",
  "LanguageCode": "The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\"de\"), English (\"en\"), Spanish (\"es\"), French (\"fr\"), Italian (\"it\"), or Portuguese (\"pt\"). All documents must be in the same language."
}
"""
BatchDetectSyntax(args) = comprehend("BatchDetectSyntax", args)

"""
    DetectSyntax()

Inspects text for syntax and the part of speech of words in the document. For more information, how-syntax.

Required Parameters
{
  "LanguageCode": "The language code of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\"de\"), English (\"en\"), Spanish (\"es\"), French (\"fr\"), Italian (\"it\"), or Portuguese (\"pt\").",
  "Text": "A UTF-8 string. Each string must contain fewer that 5,000 bytes of UTF encoded characters."
}
"""
DetectSyntax(args) = comprehend("DetectSyntax", args)

"""
    BatchDetectSentiment()

Inspects a batch of documents and returns an inference of the prevailing sentiment, POSITIVE, NEUTRAL, MIXED, or NEGATIVE, in each one.

Required Parameters
{
  "TextList": "A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.",
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language."
}
"""
BatchDetectSentiment(args) = comprehend("BatchDetectSentiment", args)

"""
    UpdateEndpoint()

Updates information about the specified endpoint.

Required Parameters
{
  "DesiredInferenceUnits": " The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.",
  "EndpointArn": "The Amazon Resource Number (ARN) of the endpoint being updated."
}
"""
UpdateEndpoint(args) = comprehend("UpdateEndpoint", args)

"""
    StopEntitiesDetectionJob()

Stops an entities detection job in progress. If the job state is IN_PROGRESS the job is marked for termination and put into the STOP_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception.  When a job is stopped, any documents already processed are written to the output location.

Required Parameters
{
  "JobId": "The identifier of the entities detection job to stop."
}
"""
StopEntitiesDetectionJob(args) = comprehend("StopEntitiesDetectionJob", args)

"""
    UntagResource()

Removes a specific tag associated with an Amazon Comprehend resource. 

Required Parameters
{
  "ResourceArn": " The Amazon Resource Name (ARN) of the given Amazon Comprehend resource from which you want to remove the tags. ",
  "TagKeys": "The initial part of a key-value pair that forms a tag being removed from a given resource. For example, a tag with \"Sales\" as the key might be added to a resource to indicate its use by the sales department. Keys must be unique and cannot be duplicated for a particular resource. "
}
"""
UntagResource(args) = comprehend("UntagResource", args)

"""
    StartKeyPhrasesDetectionJob()

Starts an asynchronous key phrase detection job for a collection of documents. Use the operation to track the status of a job.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions.",
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": " Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your key phrases detection job. For more information, see Amazon VPC. ",
  "JobName": "The identifier of the job."
}
"""
StartKeyPhrasesDetectionJob(args) = comprehend("StartKeyPhrasesDetectionJob", args)

"""
    StartDocumentClassificationJob()

Starts an asynchronous document classification job. Use the operation to track the progress of the job.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files.",
  "DocumentClassifierArn": "The Amazon Resource Name (ARN) of the document classifier to use to process the job.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see Amazon VPC. ",
  "JobName": "The identifier of the job."
}
"""
StartDocumentClassificationJob(args) = comprehend("StartDocumentClassificationJob", args)

"""
    CreateEntityRecognizer()

Creates an entity recognizer using submitted files. After your CreateEntityRecognizer request is submitted, you can check job status using the API. 

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data. The S3 bucket containing the input data must be located in the same region as the entity recognizer being created. ",
  "RecognizerName": "The name given to the newly created recognizer. Recognizer names can be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The name must be unique in the account/region.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.",
  "LanguageCode": " The language of the input documents. All documents must be in the same language. Only English (\"en\") is currently supported. "
}

Optional Parameters
{
  "Tags": "Tags to be associated with the entity recognizer being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \"Sales\" as the key might be added to a resource to indicate its use by the sales department. ",
  "ClientRequestToken": " A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see Amazon VPC. "
}
"""
CreateEntityRecognizer(args) = comprehend("CreateEntityRecognizer", args)

"""
    ListDocumentClassificationJobs()

Gets a list of the documentation classification jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. You can filter jobs on their names, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListDocumentClassificationJobs() = comprehend("ListDocumentClassificationJobs")
ListDocumentClassificationJobs(args) = comprehend("ListDocumentClassificationJobs", args)

"""
    DetectSentiment()

Inspects text and returns an inference of the prevailing sentiment (POSITIVE, NEUTRAL, MIXED, or NEGATIVE). 

Required Parameters
{
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.",
  "Text": "A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters."
}
"""
DetectSentiment(args) = comprehend("DetectSentiment", args)

"""
    ListTagsForResource()

Lists all tags associated with a given Amazon Comprehend resource. 

Required Parameters
{
  "ResourceArn": "The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying. "
}
"""
ListTagsForResource(args) = comprehend("ListTagsForResource", args)

"""
    ListEntitiesDetectionJobs()

Gets a list of the entity detection jobs that you have submitted.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time."
}
"""
ListEntitiesDetectionJobs() = comprehend("ListEntitiesDetectionJobs")
ListEntitiesDetectionJobs(args) = comprehend("ListEntitiesDetectionJobs", args)

"""
    DetectDominantLanguage()

Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see Amazon Comprehend Supported Languages. 

Required Parameters
{
  "Text": "A UTF-8 text string. Each string should contain at least 20 characters and must contain fewer that 5,000 bytes of UTF-8 encoded characters."
}
"""
DetectDominantLanguage(args) = comprehend("DetectDominantLanguage", args)

"""
    DescribeEntitiesDetectionJob()

Gets the properties associated with an entities detection job. Use this operation to get the status of a detection job.

Required Parameters
{
  "JobId": "The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response."
}
"""
DescribeEntitiesDetectionJob(args) = comprehend("DescribeEntitiesDetectionJob", args)

"""
    DetectEntities()

Inspects text for named entities, and returns information about them. For more information, about named entities, see how-entities. 

Required Parameters
{
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.",
  "Text": "A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters."
}
"""
DetectEntities(args) = comprehend("DetectEntities", args)

"""
    ListEntityRecognizers()

Gets a list of the properties of all entity recognizers that you created, including recognizers currently in training. Allows you to filter the list of recognizers based on criteria such as status and submission time. This call returns up to 500 entity recognizers in the list, with a default number of 100 recognizers in the list. The results of this list are not in any particular order. Please get the list and sort locally if needed.

Optional Parameters
{
  "MaxResults": " The maximum number of results to return on each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the list of entities returned. You can filter on Status, SubmitTimeBefore, or SubmitTimeAfter. You can only set one filter at a time."
}
"""
ListEntityRecognizers() = comprehend("ListEntityRecognizers")
ListEntityRecognizers(args) = comprehend("ListEntityRecognizers", args)

"""
    ClassifyDocument()

Creates a new document classification request to analyze a single document in real-time, using a previously created and trained custom model and an endpoint.

Required Parameters
{
  "EndpointArn": "The Amazon Resource Number (ARN) of the endpoint.",
  "Text": "The document text to be analyzed."
}
"""
ClassifyDocument(args) = comprehend("ClassifyDocument", args)

"""
    DescribeDocumentClassificationJob()

Gets the properties associated with a document classification job. Use this operation to get the status of a classification job.

Required Parameters
{
  "JobId": "The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response."
}
"""
DescribeDocumentClassificationJob(args) = comprehend("DescribeDocumentClassificationJob", args)

"""
    StopKeyPhrasesDetectionJob()

Stops a key phrases detection job in progress. If the job state is IN_PROGRESS the job is marked for termination and put into the STOP_REQUESTED state. If the job completes before it can be stopped, it is put into the COMPLETED state; otherwise the job is stopped and put into the STOPPED state. If the job is in the COMPLETED or FAILED state when you call the StopDominantLanguageDetectionJob operation, the operation returns a 400 Internal Request Exception.  When a job is stopped, any documents already processed are written to the output location.

Required Parameters
{
  "JobId": "The identifier of the key phrases detection job to stop."
}
"""
StopKeyPhrasesDetectionJob(args) = comprehend("StopKeyPhrasesDetectionJob", args)

"""
    DescribeEntityRecognizer()

Provides details about an entity recognizer including status, S3 buckets containing training data, recognizer metadata, metrics, and so on.

Required Parameters
{
  "EntityRecognizerArn": "The Amazon Resource Name (ARN) that identifies the entity recognizer."
}
"""
DescribeEntityRecognizer(args) = comprehend("DescribeEntityRecognizer", args)

"""
    DeleteEndpoint()

Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be deleted in order for the model to be deleted.

Required Parameters
{
  "EndpointArn": "The Amazon Resource Number (ARN) of the endpoint being deleted."
}
"""
DeleteEndpoint(args) = comprehend("DeleteEndpoint", args)

"""
    StopTrainingEntityRecognizer()

Stops an entity recognizer training job while in progress. If the training job state is TRAINING, the job is marked for termination and put into the STOP_REQUESTED state. If the training job completes before it can be stopped, it is put into the TRAINED; otherwise the training job is stopped and putted into the STOPPED state and the service sends back an HTTP 200 response with an empty HTTP body.

Required Parameters
{
  "EntityRecognizerArn": "The Amazon Resource Name (ARN) that identifies the entity recognizer currently being trained."
}
"""
StopTrainingEntityRecognizer(args) = comprehend("StopTrainingEntityRecognizer", args)

"""
    StartTopicsDetectionJob()

Starts an asynchronous topic detection job. Use the DescribeTopicDetectionJob operation to track the status of a job.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files. The output is a compressed archive with two files, topic-terms.csv that lists the terms associated with each topic, and doc-topics.csv that lists the documents associated with each topic",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your topic detection job. For more information, see Amazon VPC. ",
  "JobName": "The identifier of the job.",
  "NumberOfTopics": "The number of topics to detect."
}
"""
StartTopicsDetectionJob(args) = comprehend("StartTopicsDetectionJob", args)

"""
    DetectKeyPhrases()

Detects the key noun phrases found in the text. 

Required Parameters
{
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.",
  "Text": "A UTF-8 text string. Each string must contain fewer that 5,000 bytes of UTF-8 encoded characters."
}
"""
DetectKeyPhrases(args) = comprehend("DetectKeyPhrases", args)

"""
    DeleteEntityRecognizer()

Deletes an entity recognizer. Only those recognizers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a ResourceInUseException will be returned. This is an asynchronous action that puts the recognizer into a DELETING state, and it is then removed by a background job. Once removed, the recognizer disappears from your account and is no longer available for use. 

Required Parameters
{
  "EntityRecognizerArn": "The Amazon Resource Name (ARN) that identifies the entity recognizer."
}
"""
DeleteEntityRecognizer(args) = comprehend("DeleteEntityRecognizer", args)

"""
    BatchDetectKeyPhrases()

Detects the key noun phrases found in a batch of documents.

Required Parameters
{
  "TextList": "A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer that 5,000 bytes of UTF-8 encoded characters.",
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language."
}
"""
BatchDetectKeyPhrases(args) = comprehend("BatchDetectKeyPhrases", args)

"""
    BatchDetectDominantLanguage()

Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see Amazon Comprehend Supported Languages. 

Required Parameters
{
  "TextList": "A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document should contain at least 20 characters and must contain fewer than 5,000 bytes of UTF-8 encoded characters."
}
"""
BatchDetectDominantLanguage(args) = comprehend("BatchDetectDominantLanguage", args)

"""
    DescribeSentimentDetectionJob()

Gets the properties associated with a sentiment detection job. Use this operation to get the status of a detection job.

Required Parameters
{
  "JobId": "The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response."
}
"""
DescribeSentimentDetectionJob(args) = comprehend("DescribeSentimentDetectionJob", args)

"""
    ListEndpoints()

Gets a list of all existing endpoints that you've created.

Optional Parameters
{
  "MaxResults": "The maximum number of results to return in each page. The default is 100.",
  "NextToken": "Identifies the next page of results to return.",
  "Filter": "Filters the endpoints that are returned. You can filter endpoints on their name, model, status, or the date and time that they were created. You can only set one filter at a time. "
}
"""
ListEndpoints() = comprehend("ListEndpoints")
ListEndpoints(args) = comprehend("ListEndpoints", args)

"""
    DescribeDocumentClassifier()

Gets the properties associated with a document classifier.

Required Parameters
{
  "DocumentClassifierArn": "The Amazon Resource Name (ARN) that identifies the document classifier. The operation returns this identifier in its response."
}
"""
DescribeDocumentClassifier(args) = comprehend("DescribeDocumentClassifier", args)

"""
    BatchDetectEntities()

Inspects the text of a batch of documents for named entities and returns information about them. For more information about named entities, see how-entities 

Required Parameters
{
  "TextList": "A list containing the text of the input documents. The list can contain a maximum of 25 documents. Each document must contain fewer than 5,000 bytes of UTF-8 encoded characters.",
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language."
}
"""
BatchDetectEntities(args) = comprehend("BatchDetectEntities", args)

"""
    DeleteDocumentClassifier()

Deletes a previously created document classifier Only those classifiers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a ResourceInUseException will be returned. This is an asynchronous action that puts the classifier into a DELETING state, and it is then removed by a background job. Once removed, the classifier disappears from your account and is no longer available for use. 

Required Parameters
{
  "DocumentClassifierArn": "The Amazon Resource Name (ARN) that identifies the document classifier. "
}
"""
DeleteDocumentClassifier(args) = comprehend("DeleteDocumentClassifier", args)

"""
    StartSentimentDetectionJob()

Starts an asynchronous sentiment detection job for a collection of documents. use the operation to track the status of a job.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files. ",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions.",
  "LanguageCode": "The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your sentiment detection job. For more information, see Amazon VPC. ",
  "JobName": "The identifier of the job."
}
"""
StartSentimentDetectionJob(args) = comprehend("StartSentimentDetectionJob", args)

"""
    StartEntitiesDetectionJob()

Starts an asynchronous entity detection job for a collection of documents. Use the operation to track the status of a job. This API can be used for either standard entity detection or custom entity recognition. In order to be used for custom entity recognition, the optional EntityRecognizerArn must be used in order to provide access to the recognizer being used to detect the custom entity.

Required Parameters
{
  "InputDataConfig": "Specifies the format and location of the input data for the job.",
  "OutputDataConfig": "Specifies where to send the output files.",
  "DataAccessRoleArn": "The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions.",
  "LanguageCode": "The language of the input documents. All documents must be in the same language. You can specify any of the languages supported by Amazon Comprehend. If custom entities recognition is used, this parameter is ignored and the language used for training the model is used instead."
}

Optional Parameters
{
  "ClientRequestToken": "A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.",
  "VolumeKmsKeyId": "ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"    Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ",
  "VpcConfig": "Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your entity detection job. For more information, see Amazon VPC. ",
  "JobName": "The identifier of the job.",
  "EntityRecognizerArn": "The Amazon Resource Name (ARN) that identifies the specific entity recognizer to be used by the StartEntitiesDetectionJob. This ARN is optional and is only used for a custom entity recognition job."
}
"""
StartEntitiesDetectionJob(args) = comprehend("StartEntitiesDetectionJob", args)

"""
    DescribeTopicsDetectionJob()

Gets the properties associated with a topic detection job. Use this operation to get the status of a detection job.

Required Parameters
{
  "JobId": "The identifier assigned by the user to the detection job."
}
"""
DescribeTopicsDetectionJob(args) = comprehend("DescribeTopicsDetectionJob", args)

"""
    DescribeDominantLanguageDetectionJob()

Gets the properties associated with a dominant language detection job. Use this operation to get the status of a detection job.

Required Parameters
{
  "JobId": "The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response."
}
"""
DescribeDominantLanguageDetectionJob(args) = comprehend("DescribeDominantLanguageDetectionJob", args)

"""
    DescribeEndpoint()

Gets the properties associated with a specific endpoint. Use this operation to get the status of an endpoint.

Required Parameters
{
  "EndpointArn": "The Amazon Resource Number (ARN) of the endpoint being described."
}
"""
DescribeEndpoint(args) = comprehend("DescribeEndpoint", args)

"""
    DescribeKeyPhrasesDetectionJob()

Gets the properties associated with a key phrases detection job. Use this operation to get the status of a detection job.

Required Parameters
{
  "JobId": "The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response."
}
"""
DescribeKeyPhrasesDetectionJob(args) = comprehend("DescribeKeyPhrasesDetectionJob", args)
