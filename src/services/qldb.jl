# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: qldb

using Compat
using UUIDs
"""
    CancelJournalKinesisStream()

Ends a given Amazon QLDB journal stream. Before a stream can be canceled, its current status must be ACTIVE. You can't restart a stream after you cancel it. Canceled QLDB stream resources are subject to a 7-day retention period, so they are automatically deleted after this limit expires.

# Required Parameters
- `name`: The name of the ledger.
- `streamId`: The unique ID that QLDB assigns to each QLDB journal stream.

"""
CancelJournalKinesisStream(name, streamId; aws::AWSConfig=AWSConfig()) = qldb("DELETE", "/ledgers/$(name)/journal-kinesis-streams/$(streamId)"; aws=aws)
CancelJournalKinesisStream(name, streamId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("DELETE", "/ledgers/$(name)/journal-kinesis-streams/$(streamId)", args; aws=aws)

"""
    CreateLedger()

Creates a new ledger in your AWS account.

# Required Parameters
- `Name`: The name of the ledger that you want to create. The name must be unique among all of your ledgers in the current AWS Region. Naming constraints for ledger names are defined in Quotas in Amazon QLDB in the Amazon QLDB Developer Guide.
- `PermissionsMode`: The permissions mode to assign to the ledger that you want to create.

# Optional Parameters
- `DeletionProtection`: The flag that prevents a ledger from being deleted by any user. If not provided on ledger creation, this feature is enabled (true) by default. If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the UpdateLedger operation to set the flag to false. The QLDB console disables deletion protection for you when you use it to delete a ledger.
- `Tags`: The key-value pairs to add as tags to the ledger that you want to create. Tag keys are case sensitive. Tag values are case sensitive and can be null.
"""
CreateLedger(Name, PermissionsMode; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers", Dict{String, Any}("Name"=>Name, "PermissionsMode"=>PermissionsMode))
CreateLedger(Name, PermissionsMode, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Name"=>Name, "PermissionsMode"=>PermissionsMode), args)); aws=aws)

"""
    DeleteLedger()

Deletes a ledger and all of its contents. This action is irreversible. If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the UpdateLedger operation to set the flag to false. The QLDB console disables deletion protection for you when you use it to delete a ledger.

# Required Parameters
- `name`: The name of the ledger that you want to delete.

"""
DeleteLedger(name; aws::AWSConfig=AWSConfig()) = qldb("DELETE", "/ledgers/$(name)"; aws=aws)
DeleteLedger(name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("DELETE", "/ledgers/$(name)", args; aws=aws)

"""
    DescribeJournalKinesisStream()

Returns detailed information about a given Amazon QLDB journal stream. The output includes the Amazon Resource Name (ARN), stream name, current status, creation time, and the parameters of your original stream creation request.

# Required Parameters
- `name`: The name of the ledger.
- `streamId`: The unique ID that QLDB assigns to each QLDB journal stream.

"""
DescribeJournalKinesisStream(name, streamId; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-kinesis-streams/$(streamId)"; aws=aws)
DescribeJournalKinesisStream(name, streamId, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-kinesis-streams/$(streamId)", args; aws=aws)

"""
    DescribeJournalS3Export()

Returns information about a journal export job, including the ledger name, export ID, when it was created, current status, and its start and end time export parameters. This action does not return any expired export jobs. For more information, see Export Job Expiration in the Amazon QLDB Developer Guide. If the export job with the given ExportId doesn't exist, then throws ResourceNotFoundException. If the ledger with the given Name doesn't exist, then throws ResourceNotFoundException.

# Required Parameters
- `exportId`: The unique ID of the journal export job that you want to describe.
- `name`: The name of the ledger.

"""
DescribeJournalS3Export(exportId, name; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-s3-exports/$(exportId)"; aws=aws)
DescribeJournalS3Export(exportId, name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-s3-exports/$(exportId)", args; aws=aws)

"""
    DescribeLedger()

Returns information about a ledger, including its state and when it was created.

# Required Parameters
- `name`: The name of the ledger that you want to describe.

"""
DescribeLedger(name; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)"; aws=aws)
DescribeLedger(name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)", args; aws=aws)

"""
    ExportJournalToS3()

Exports journal contents within a date and time range from a ledger into a specified Amazon Simple Storage Service (Amazon S3) bucket. The data is written as files in Amazon Ion format. If the ledger with the given Name doesn't exist, then throws ResourceNotFoundException. If the ledger with the given Name is in CREATING status, then throws ResourcePreconditionNotMetException. You can initiate up to two concurrent journal export requests for each ledger. Beyond this limit, journal export requests throw LimitExceededException.

# Required Parameters
- `ExclusiveEndTime`: The exclusive end date and time for the range of journal contents that you want to export. The ExclusiveEndTime must be in ISO 8601 date and time format and in Universal Coordinated Time (UTC). For example: 2019-06-13T21:36:34Z  The ExclusiveEndTime must be less than or equal to the current UTC date and time.
- `InclusiveStartTime`: The inclusive start date and time for the range of journal contents that you want to export. The InclusiveStartTime must be in ISO 8601 date and time format and in Universal Coordinated Time (UTC). For example: 2019-06-13T21:36:34Z  The InclusiveStartTime must be before ExclusiveEndTime. If you provide an InclusiveStartTime that is before the ledger's CreationDateTime, Amazon QLDB defaults it to the ledger's CreationDateTime.
- `RoleArn`: The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions for a journal export job to do the following:   Write objects into your Amazon Simple Storage Service (Amazon S3) bucket.   (Optional) Use your customer master key (CMK) in AWS Key Management Service (AWS KMS) for server-side encryption of your exported data.  
- `S3ExportConfiguration`: The configuration settings of the Amazon S3 bucket destination for your export request.
- `name`: The name of the ledger.

"""
ExportJournalToS3(ExclusiveEndTime, InclusiveStartTime, RoleArn, S3ExportConfiguration, name; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/journal-s3-exports", Dict{String, Any}("ExclusiveEndTime"=>ExclusiveEndTime, "InclusiveStartTime"=>InclusiveStartTime, "RoleArn"=>RoleArn, "S3ExportConfiguration"=>S3ExportConfiguration))
ExportJournalToS3(ExclusiveEndTime, InclusiveStartTime, RoleArn, S3ExportConfiguration, name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/journal-s3-exports", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("ExclusiveEndTime"=>ExclusiveEndTime, "InclusiveStartTime"=>InclusiveStartTime, "RoleArn"=>RoleArn, "S3ExportConfiguration"=>S3ExportConfiguration), args)); aws=aws)

"""
    GetBlock()

Returns a block object at a specified address in a journal. Also returns a proof of the specified block for verification if DigestTipAddress is provided. For information about the data contents in a block, see Journal contents in the Amazon QLDB Developer Guide. If the specified ledger doesn't exist or is in DELETING status, then throws ResourceNotFoundException. If the specified ledger is in CREATING status, then throws ResourcePreconditionNotMetException. If no block exists with the specified address, then throws InvalidParameterException.

# Required Parameters
- `BlockAddress`: The location of the block that you want to request. An address is an Amazon Ion structure that has two fields: strandId and sequenceNo. For example: {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:14} 
- `name`: The name of the ledger.

# Optional Parameters
- `DigestTipAddress`: The latest block location covered by the digest for which to request a proof. An address is an Amazon Ion structure that has two fields: strandId and sequenceNo. For example: {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:49} 
"""
GetBlock(BlockAddress, name; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/block", Dict{String, Any}("BlockAddress"=>BlockAddress))
GetBlock(BlockAddress, name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/block", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("BlockAddress"=>BlockAddress), args)); aws=aws)

"""
    GetDigest()

Returns the digest of a ledger at the latest committed block in the journal. The response includes a 256-bit hash value and a block address.

# Required Parameters
- `name`: The name of the ledger.

"""
GetDigest(name; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/digest"; aws=aws)
GetDigest(name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/digest", args; aws=aws)

"""
    GetRevision()

Returns a revision data object for a specified document ID and block address. Also returns a proof of the specified revision for verification if DigestTipAddress is provided.

# Required Parameters
- `BlockAddress`: The block location of the document revision to be verified. An address is an Amazon Ion structure that has two fields: strandId and sequenceNo. For example: {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:14} 
- `DocumentId`: The unique ID of the document to be verified.
- `name`: The name of the ledger.

# Optional Parameters
- `DigestTipAddress`: The latest block location covered by the digest for which to request a proof. An address is an Amazon Ion structure that has two fields: strandId and sequenceNo. For example: {strandId:\"BlFTjlSXze9BIh1KOszcE3\",sequenceNo:49} 
"""
GetRevision(BlockAddress, DocumentId, name; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/revision", Dict{String, Any}("BlockAddress"=>BlockAddress, "DocumentId"=>DocumentId))
GetRevision(BlockAddress, DocumentId, name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/revision", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("BlockAddress"=>BlockAddress, "DocumentId"=>DocumentId), args)); aws=aws)

"""
    ListJournalKinesisStreamsForLedger()

Returns an array of all Amazon QLDB journal stream descriptors for a given ledger. The output of each stream descriptor includes the same details that are returned by DescribeJournalKinesisStream. This action returns a maximum of MaxResults items. It is paginated so that you can retrieve all the items by calling ListJournalKinesisStreamsForLedger multiple times.

# Required Parameters
- `name`: The name of the ledger.

# Optional Parameters
- `max_results`: The maximum number of results to return in a single ListJournalKinesisStreamsForLedger request. (The actual number of results returned might be fewer.)
- `next_token`: A pagination token, indicating that you want to retrieve the next page of results. If you received a value for NextToken in the response from a previous ListJournalKinesisStreamsForLedger call, you should use that value as input here.
"""
ListJournalKinesisStreamsForLedger(name; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-kinesis-streams"; aws=aws)
ListJournalKinesisStreamsForLedger(name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-kinesis-streams", args; aws=aws)

"""
    ListJournalS3Exports()

Returns an array of journal export job descriptions for all ledgers that are associated with the current AWS account and Region. This action returns a maximum of MaxResults items, and is paginated so that you can retrieve all the items by calling ListJournalS3Exports multiple times. This action does not return any expired export jobs. For more information, see Export Job Expiration in the Amazon QLDB Developer Guide.

# Optional Parameters
- `max_results`: The maximum number of results to return in a single ListJournalS3Exports request. (The actual number of results returned might be fewer.)
- `next_token`: A pagination token, indicating that you want to retrieve the next page of results. If you received a value for NextToken in the response from a previous ListJournalS3Exports call, then you should use that value as input here.
"""
ListJournalS3Exports(; aws::AWSConfig=AWSConfig()) = qldb("GET", "/journal-s3-exports"; aws=aws)
ListJournalS3Exports(args::AbstractDict{String, Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/journal-s3-exports", args; aws=aws)

"""
    ListJournalS3ExportsForLedger()

Returns an array of journal export job descriptions for a specified ledger. This action returns a maximum of MaxResults items, and is paginated so that you can retrieve all the items by calling ListJournalS3ExportsForLedger multiple times. This action does not return any expired export jobs. For more information, see Export Job Expiration in the Amazon QLDB Developer Guide.

# Required Parameters
- `name`: The name of the ledger.

# Optional Parameters
- `max_results`: The maximum number of results to return in a single ListJournalS3ExportsForLedger request. (The actual number of results returned might be fewer.)
- `next_token`: A pagination token, indicating that you want to retrieve the next page of results. If you received a value for NextToken in the response from a previous ListJournalS3ExportsForLedger call, then you should use that value as input here.
"""
ListJournalS3ExportsForLedger(name; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-s3-exports"; aws=aws)
ListJournalS3ExportsForLedger(name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers/$(name)/journal-s3-exports", args; aws=aws)

"""
    ListLedgers()

Returns an array of ledger summaries that are associated with the current AWS account and Region. This action returns a maximum of 100 items and is paginated so that you can retrieve all the items by calling ListLedgers multiple times.

# Optional Parameters
- `max_results`: The maximum number of results to return in a single ListLedgers request. (The actual number of results returned might be fewer.)
- `next_token`: A pagination token, indicating that you want to retrieve the next page of results. If you received a value for NextToken in the response from a previous ListLedgers call, then you should use that value as input here.
"""
ListLedgers(; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers"; aws=aws)
ListLedgers(args::AbstractDict{String, Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/ledgers", args; aws=aws)

"""
    ListTagsForResource()

Returns all tags for a specified Amazon QLDB resource.

# Required Parameters
- `resourceArn`: The Amazon Resource Name (ARN) for which you want to list the tags. For example:  arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger 

"""
ListTagsForResource(resourceArn; aws::AWSConfig=AWSConfig()) = qldb("GET", "/tags/$(resourceArn)"; aws=aws)
ListTagsForResource(resourceArn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("GET", "/tags/$(resourceArn)", args; aws=aws)

"""
    StreamJournalToKinesis()

Creates a journal stream for a given Amazon QLDB ledger. The stream captures every document revision that is committed to the ledger's journal and delivers the data to a specified Amazon Kinesis Data Streams resource.

# Required Parameters
- `InclusiveStartTime`: The inclusive start date and time from which to start streaming journal data. This parameter must be in ISO 8601 date and time format and in Universal Coordinated Time (UTC). For example: 2019-06-13T21:36:34Z  The InclusiveStartTime cannot be in the future and must be before ExclusiveEndTime. If you provide an InclusiveStartTime that is before the ledger's CreationDateTime, QLDB effectively defaults it to the ledger's CreationDateTime.
- `KinesisConfiguration`: The configuration settings of the Kinesis Data Streams destination for your stream request.
- `RoleArn`: The Amazon Resource Name (ARN) of the IAM role that grants QLDB permissions for a journal stream to write data records to a Kinesis Data Streams resource.
- `StreamName`: The name that you want to assign to the QLDB journal stream. User-defined names can help identify and indicate the purpose of a stream. Your stream name must be unique among other active streams for a given ledger. Stream names have the same naming constraints as ledger names, as defined in Quotas in Amazon QLDB in the Amazon QLDB Developer Guide.
- `name`: The name of the ledger.

# Optional Parameters
- `ExclusiveEndTime`: The exclusive date and time that specifies when the stream ends. If you don't define this parameter, the stream runs indefinitely until you cancel it. The ExclusiveEndTime must be in ISO 8601 date and time format and in Universal Coordinated Time (UTC). For example: 2019-06-13T21:36:34Z 
- `Tags`: The key-value pairs to add as tags to the stream that you want to create. Tag keys are case sensitive. Tag values are case sensitive and can be null.
"""
StreamJournalToKinesis(InclusiveStartTime, KinesisConfiguration, RoleArn, StreamName, name; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/journal-kinesis-streams", Dict{String, Any}("InclusiveStartTime"=>InclusiveStartTime, "KinesisConfiguration"=>KinesisConfiguration, "RoleArn"=>RoleArn, "StreamName"=>StreamName))
StreamJournalToKinesis(InclusiveStartTime, KinesisConfiguration, RoleArn, StreamName, name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("POST", "/ledgers/$(name)/journal-kinesis-streams", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("InclusiveStartTime"=>InclusiveStartTime, "KinesisConfiguration"=>KinesisConfiguration, "RoleArn"=>RoleArn, "StreamName"=>StreamName), args)); aws=aws)

"""
    TagResource()

Adds one or more tags to a specified Amazon QLDB resource. A resource can have up to 50 tags. If you try to create more than 50 tags for a resource, your request fails and returns an error.

# Required Parameters
- `Tags`: The key-value pairs to add as tags to the specified QLDB resource. Tag keys are case sensitive. If you specify a key that already exists for the resource, your request fails and returns an error. Tag values are case sensitive and can be null.
- `resourceArn`: The Amazon Resource Name (ARN) to which you want to add the tags. For example:  arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger 

"""
TagResource(Tags, resourceArn; aws::AWSConfig=AWSConfig()) = qldb("POST", "/tags/$(resourceArn)", Dict{String, Any}("Tags"=>Tags))
TagResource(Tags, resourceArn, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("POST", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("Tags"=>Tags), args)); aws=aws)

"""
    UntagResource()

Removes one or more tags from a specified Amazon QLDB resource. You can specify up to 50 tag keys to remove.

# Required Parameters
- `resourceArn`: The Amazon Resource Name (ARN) from which you want to remove the tags. For example:  arn:aws:qldb:us-east-1:123456789012:ledger/exampleLedger 
- `tagKeys`: The list of tag keys that you want to remove.

"""
UntagResource(resourceArn, tagKeys; aws::AWSConfig=AWSConfig()) = qldb("DELETE", "/tags/$(resourceArn)", Dict{String, Any}("tagKeys"=>tagKeys))
UntagResource(resourceArn, tagKeys, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("DELETE", "/tags/$(resourceArn)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("tagKeys"=>tagKeys), args)); aws=aws)

"""
    UpdateLedger()

Updates properties on a ledger.

# Required Parameters
- `name`: The name of the ledger.

# Optional Parameters
- `DeletionProtection`: The flag that prevents a ledger from being deleted by any user. If not provided on ledger creation, this feature is enabled (true) by default. If deletion protection is enabled, you must first disable it before you can delete the ledger using the QLDB API or the AWS Command Line Interface (AWS CLI). You can disable it by calling the UpdateLedger operation to set the flag to false. The QLDB console disables deletion protection for you when you use it to delete a ledger.
"""
UpdateLedger(name; aws::AWSConfig=AWSConfig()) = qldb("PATCH", "/ledgers/$(name)"; aws=aws)
UpdateLedger(name, args::AbstractDict{String, <:Any}; aws::AWSConfig=AWSConfig()) = qldb("PATCH", "/ledgers/$(name)", args; aws=aws)
