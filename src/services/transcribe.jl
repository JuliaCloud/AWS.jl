include("../AWSServices.jl")
using .AWSServices: transcribe

"""
    GetTranscriptionJob()

Returns information about a transcription job. To see the status of the job, check the TranscriptionJobStatus field. If the status is COMPLETED, the job is finished and you can find the results at the location specified in the TranscriptFileUri field. If you enable content redaction, the redacted transcript appears in RedactedTranscriptFileUri.

Required Parameters
{
  "TranscriptionJobName": "The name of the job."
}
"""
GetTranscriptionJob(args) = transcribe("GetTranscriptionJob", args)

"""
    GetVocabularyFilter()

Returns information about a vocabulary filter.

Required Parameters
{
  "VocabularyFilterName": "The name of the vocabulary filter for which to return information."
}
"""
GetVocabularyFilter(args) = transcribe("GetVocabularyFilter", args)

"""
    UpdateVocabularyFilter()

Updates a vocabulary filter with a new list of filtered words.

Required Parameters
{
  "VocabularyFilterName": "The name of the vocabulary filter to update."
}

Optional Parameters
{
  "Words": "The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see Character Sets for Custom Vocabularies. If you provide a list of words in the Words parameter, you can't use the VocabularyFilterFileUri parameter.",
  "VocabularyFilterFileUri": "The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see Character Sets for Custom Vocabularies. The specified file must be less than 50 KB of UTF-8 characters. If you provide the location of a list of words in the VocabularyFilterFileUri parameter, you can't use the Words parameter."
}
"""
UpdateVocabularyFilter(args) = transcribe("UpdateVocabularyFilter", args)

"""
    DeleteVocabularyFilter()

Removes a vocabulary filter.

Required Parameters
{
  "VocabularyFilterName": "The name of the vocabulary filter to remove."
}
"""
DeleteVocabularyFilter(args) = transcribe("DeleteVocabularyFilter", args)

"""
    CreateVocabulary()

Creates a new custom vocabulary that you can use to change the way Amazon Transcribe handles transcription of an audio file. 

Required Parameters
{
  "LanguageCode": "The language code of the vocabulary entries.",
  "VocabularyName": "The name of the vocabulary. The name must be unique within an AWS account. The name is case-sensitive."
}

Optional Parameters
{
  "Phrases": "An array of strings that contains the vocabulary entries. ",
  "VocabularyFileUri": "The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is    https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt;   For example:  https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt  For more information about S3 object names, see Object Keys in the Amazon S3 Developer Guide. For more information about custom vocabularies, see Custom Vocabularies."
}
"""
CreateVocabulary(args) = transcribe("CreateVocabulary", args)

"""
    ListTranscriptionJobs()

Lists transcription jobs with the specified status.

Optional Parameters
{
  "MaxResults": "The maximum number of jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.",
  "NextToken": "If the result of the previous request to ListTranscriptionJobs was truncated, include the NextToken to fetch the next set of jobs.",
  "Status": "When specified, returns only transcription jobs with the specified status. Jobs are ordered by creation date, with the newest jobs returned first. If you don’t specify a status, Amazon Transcribe returns all transcription jobs ordered by creation date. ",
  "JobNameContains": "When specified, the jobs returned in the list are limited to jobs whose name contains the specified string."
}
"""
ListTranscriptionJobs() = transcribe("ListTranscriptionJobs")
ListTranscriptionJobs(args) = transcribe("ListTranscriptionJobs", args)

"""
    UpdateVocabulary()

Updates an existing vocabulary with new values. The UpdateVocabulary operation overwrites all of the existing information with the values that you provide in the request. 

Required Parameters
{
  "LanguageCode": "The language code of the vocabulary entries.",
  "VocabularyName": "The name of the vocabulary to update. The name is case-sensitive."
}

Optional Parameters
{
  "Phrases": "An array of strings containing the vocabulary entries.",
  "VocabularyFileUri": "The S3 location of the text file that contains the definition of the custom vocabulary. The URI must be in the same region as the API endpoint that you are calling. The general form is    https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt;   For example:  https://s3.us-east-1.amazonaws.com/examplebucket/vocab.txt  For more information about S3 object names, see Object Keys in the Amazon S3 Developer Guide. For more information about custom vocabularies, see Custom Vocabularies."
}
"""
UpdateVocabulary(args) = transcribe("UpdateVocabulary", args)

"""
    ListVocabularyFilters()

Gets information about vocabulary filters.

Optional Parameters
{
  "MaxResults": "The maximum number of filters to return in the response. If there are fewer results in the list, this response contains only the actual results.",
  "NameContains": "Filters the response so that it only contains vocabulary filters whose name contains the specified string.",
  "NextToken": "If the result of the previous request to ListVocabularyFilters was truncated, include the NextToken to fetch the next set of collections."
}
"""
ListVocabularyFilters() = transcribe("ListVocabularyFilters")
ListVocabularyFilters(args) = transcribe("ListVocabularyFilters", args)

"""
    StartTranscriptionJob()

Starts an asynchronous job to transcribe speech to text. 

Required Parameters
{
  "Media": "An object that describes the input media for a transcription job.",
  "LanguageCode": "The language code for the language used in the input media file.",
  "TranscriptionJobName": "The name of the job. Note that you can't use the strings \".\" or \"..\" by themselves as the job name. The name must also be unique within an AWS account."
}

Optional Parameters
{
  "MediaSampleRateHertz": "The sample rate, in Hertz, of the audio track in the input media file.  If you do not specify the media sample rate, Amazon Transcribe determines the sample rate. If you specify the sample rate, it must match the sample rate detected by Amazon Transcribe. In most cases, you should leave the MediaSampleRateHertz field blank and let Amazon Transcribe determine the sample rate.",
  "OutputBucketName": "The location where the transcription is stored. If you set the OutputBucketName, Amazon Transcribe puts the transcript in the specified S3 bucket. When you call the GetTranscriptionJob operation, the operation returns this location in the TranscriptFileUri field. If you enable content redaction, the redacted transcript appears in RedactedTranscriptFileUri. If you enable content redaction and choose to output an unredacted transcript, that transcript's location still appears in the TranscriptFileUri. The S3 bucket must have permissions that allow Amazon Transcribe to put files in the bucket. For more information, see Permissions Required for IAM User Roles. You can specify an AWS Key Management Service (KMS) key to encrypt the output of your transcription using the OutputEncryptionKMSKeyId parameter. If you don't specify a KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side encryption of transcripts that are placed in your S3 bucket. If you don't set the OutputBucketName, Amazon Transcribe generates a pre-signed URL, a shareable URL that provides secure access to your transcription, and returns it in the TranscriptFileUri field. Use this URL to download the transcription.",
  "OutputEncryptionKMSKeyId": "The Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key used to encrypt the output of the transcription job. The user calling the StartTranscriptionJob operation must have permission to use the specified KMS key. You can use either of the following to identify a KMS key in the current account:   KMS Key ID: \"1234abcd-12ab-34cd-56ef-1234567890ab\"   KMS Key Alias: \"alias/ExampleAlias\"   You can use either of the following to identify a KMS key in the current account or another account:   Amazon Resource Name (ARN) of a KMS Key: \"arn:aws:kms:region:account ID:key/1234abcd-12ab-34cd-56ef-1234567890ab\"   ARN of a KMS Key Alias: \"arn:aws:kms:region:account ID:alias/ExampleAlias\"   If you don't specify an encryption key, the output of the transcription job is encrypted with the default Amazon S3 key (SSE-S3).  If you specify a KMS key to encrypt your output, you must also specify an output location in the OutputBucketName parameter.",
  "ContentRedaction": "An object that contains the request parameters for content redaction.",
  "JobExecutionSettings": "Provides information about how a transcription job is executed. Use this field to indicate that the job can be queued for deferred execution if the concurrency limit is reached and there are no slots available to immediately run the job.",
  "MediaFormat": "The format of the input media file.",
  "Settings": "A Settings object that provides optional settings for a transcription job."
}
"""
StartTranscriptionJob(args) = transcribe("StartTranscriptionJob", args)

"""
    DeleteVocabulary()

Deletes a vocabulary from Amazon Transcribe. 

Required Parameters
{
  "VocabularyName": "The name of the vocabulary to delete. "
}
"""
DeleteVocabulary(args) = transcribe("DeleteVocabulary", args)

"""
    DeleteTranscriptionJob()

Deletes a previously submitted transcription job along with any other generated results such as the transcription, models, and so on.

Required Parameters
{
  "TranscriptionJobName": "The name of the transcription job to be deleted."
}
"""
DeleteTranscriptionJob(args) = transcribe("DeleteTranscriptionJob", args)

"""
    ListVocabularies()

Returns a list of vocabularies that match the specified criteria. If no criteria are specified, returns the entire list of vocabularies.

Optional Parameters
{
  "MaxResults": "The maximum number of vocabularies to return in the response. If there are fewer results in the list, this response contains only the actual results.",
  "NameContains": "When specified, the vocabularies returned in the list are limited to vocabularies whose name contains the specified string. The search is case-insensitive, ListVocabularies will return both \"vocabularyname\" and \"VocabularyName\" in the response list.",
  "NextToken": "If the result of the previous request to ListVocabularies was truncated, include the NextToken to fetch the next set of jobs.",
  "StateEquals": "When specified, only returns vocabularies with the VocabularyState field equal to the specified state."
}
"""
ListVocabularies() = transcribe("ListVocabularies")
ListVocabularies(args) = transcribe("ListVocabularies", args)

"""
    CreateVocabularyFilter()

Creates a new vocabulary filter that you can use to filter words, such as profane words, from the output of a transcription job.

Required Parameters
{
  "VocabularyFilterName": "The vocabulary filter name. The name must be unique within the account that contains it.",
  "LanguageCode": "The language code of the words in the vocabulary filter. All words in the filter must be in the same language. The vocabulary filter can only be used with transcription jobs in the specified language."
}

Optional Parameters
{
  "Words": "The words to use in the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see Character Sets for Custom Vocabularies. If you provide a list of words in the Words parameter, you can't use the VocabularyFilterFileUri parameter.",
  "VocabularyFilterFileUri": "The Amazon S3 location of a text file used as input to create the vocabulary filter. Only use characters from the character set defined for custom vocabularies. For a list of character sets, see Character Sets for Custom Vocabularies. The specified file must be less than 50 KB of UTF-8 characters. If you provide the location of a list of words in the VocabularyFilterFileUri parameter, you can't use the Words parameter."
}
"""
CreateVocabularyFilter(args) = transcribe("CreateVocabularyFilter", args)

"""
    GetVocabulary()

Gets information about a vocabulary. 

Required Parameters
{
  "VocabularyName": "The name of the vocabulary to return information about. The name is case-sensitive."
}
"""
GetVocabulary(args) = transcribe("GetVocabulary", args)
