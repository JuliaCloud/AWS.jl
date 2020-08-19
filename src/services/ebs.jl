# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ebs

using Compat
using UUIDs
"""
    CompleteSnapshot()

Seals and completes the snapshot after all of the required blocks of data have been written to it. Completing the snapshot changes the status to completed. You cannot write new blocks to a snapshot after it has been completed.

# Required Parameters
- `snapshotId`: The ID of the snapshot.
- `x-amz-ChangedBlocksCount`: The number of blocks that were written to the snapshot.

# Optional Parameters
- `x-amz-Checksum`: An aggregated Base-64 SHA256 checksum based on the checksums of each written block. To generate the aggregated checksum using the linear aggregation method, arrange the checksums for each written block in ascending order of their block index, concatenate them to form a single string, and then generate the checksum on the entire string using the SHA256 algorithm.
- `x-amz-Checksum-Aggregation-Method`: The aggregation method used to generate the checksum. Currently, the only supported aggregation method is LINEAR.
- `x-amz-Checksum-Algorithm`: The algorithm used to generate the checksum. Currently, the only supported algorithm is SHA256.
"""

CompleteSnapshot(snapshotId, x_amz_ChangedBlocksCount; aws_config::AWSConfig=global_aws_config()) = ebs("POST", "/snapshots/completion/$(snapshotId)", Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-ChangedBlocksCount"=>x_amz_ChangedBlocksCount)); aws_config=aws_config)
CompleteSnapshot(snapshotId, x_amz_ChangedBlocksCount, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = ebs("POST", "/snapshots/completion/$(snapshotId)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("headers"=>Dict{String, Any}("x-amz-ChangedBlocksCount"=>x_amz_ChangedBlocksCount)), args)); aws_config=aws_config)

"""
    GetSnapshotBlock()

Returns the data in a block in an Amazon Elastic Block Store snapshot.

# Required Parameters
- `blockIndex`: The block index of the block from which to get data. Obtain the BlockIndex by running the ListChangedBlocks or ListSnapshotBlocks operations.
- `blockToken`: The block token of the block from which to get data. Obtain the BlockToken by running the ListChangedBlocks or ListSnapshotBlocks operations.
- `snapshotId`: The ID of the snapshot containing the block from which to get data.

"""

GetSnapshotBlock(blockIndex, blockToken, snapshotId; aws_config::AWSConfig=global_aws_config()) = ebs("GET", "/snapshots/$(snapshotId)/blocks/$(blockIndex)", Dict{String, Any}("blockToken"=>blockToken); aws_config=aws_config)
GetSnapshotBlock(blockIndex, blockToken, snapshotId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = ebs("GET", "/snapshots/$(snapshotId)/blocks/$(blockIndex)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("blockToken"=>blockToken), args)); aws_config=aws_config)

"""
    ListChangedBlocks()

Returns the block indexes and block tokens for blocks that are different between two Amazon Elastic Block Store snapshots of the same volume/snapshot lineage.

# Required Parameters
- `secondSnapshotId`: The ID of the second snapshot to use for the comparison.  The SecondSnapshotId parameter must be specified with a FirstSnapshotID parameter; otherwise, an error occurs. 

# Optional Parameters
- `firstSnapshotId`: The ID of the first snapshot to use for the comparison.  The FirstSnapshotID parameter must be specified with a SecondSnapshotId parameter; otherwise, an error occurs. 
- `maxResults`: The number of results to return.
- `pageToken`: The token to request the next page of results.
- `startingBlockIndex`: The block index from which the comparison should start. The list in the response will start from this block index or the next valid block index in the snapshots.
"""

ListChangedBlocks(secondSnapshotId; aws_config::AWSConfig=global_aws_config()) = ebs("GET", "/snapshots/$(secondSnapshotId)/changedblocks"; aws_config=aws_config)
ListChangedBlocks(secondSnapshotId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = ebs("GET", "/snapshots/$(secondSnapshotId)/changedblocks", args; aws_config=aws_config)

"""
    ListSnapshotBlocks()

Returns the block indexes and block tokens for blocks in an Amazon Elastic Block Store snapshot.

# Required Parameters
- `snapshotId`: The ID of the snapshot from which to get block indexes and block tokens.

# Optional Parameters
- `maxResults`: The number of results to return.
- `pageToken`: The token to request the next page of results.
- `startingBlockIndex`: The block index from which the list should start. The list in the response will start from this block index or the next valid block index in the snapshot.
"""

ListSnapshotBlocks(snapshotId; aws_config::AWSConfig=global_aws_config()) = ebs("GET", "/snapshots/$(snapshotId)/blocks"; aws_config=aws_config)
ListSnapshotBlocks(snapshotId, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = ebs("GET", "/snapshots/$(snapshotId)/blocks", args; aws_config=aws_config)

"""
    PutSnapshotBlock()

Writes a block of data to a block in the snapshot. If the specified block contains data, the existing data is overwritten. The target snapshot must be in the pending state. Data written to a snapshot must be aligned with 512-byte sectors.

# Required Parameters
- `BlockData`: The data to write to the block. The block data is not signed as part of the Signature Version 4 signing process. As a result, you must generate and provide a Base64-encoded SHA256 checksum for the block data using the x-amz-Checksum header. Also, you must specify the checksum algorithm using the x-amz-Checksum-Algorithm header. The checksum that you provide is part of the Signature Version 4 signing process. It is validated against a checksum generated by Amazon EBS to ensure the validity and authenticity of the data. If the checksums do not correspond, the request fails. For more information, see  Using checksums with the EBS direct APIs in the Amazon Elastic Compute Cloud User Guide.
- `blockIndex`: The block index of the block in which to write the data. A block index is the offset position of a block within a snapshot, and it is used to identify the block. To identify the logical offset of the data in the logical volume, multiply the block index with the block size (Block index * 512 bytes).
- `snapshotId`: The ID of the snapshot.
- `x-amz-Checksum`: A Base64-encoded SHA256 checksum of the data. Only SHA256 checksums are supported.
- `x-amz-Checksum-Algorithm`: The algorithm used to generate the checksum. Currently, the only supported algorithm is SHA256.
- `x-amz-Data-Length`: The size of the data to write to the block, in bytes. Currently, the only supported size is 524288. Valid values: 524288 

# Optional Parameters
- `x-amz-Progress`: The progress of the write process, as a percentage.
"""

PutSnapshotBlock(BlockData, blockIndex, snapshotId, x_amz_Checksum, x_amz_Checksum_Algorithm, x_amz_Data_Length; aws_config::AWSConfig=global_aws_config()) = ebs("PUT", "/snapshots/$(snapshotId)/blocks/$(blockIndex)", Dict{String, Any}("BlockData"=>BlockData, "headers"=>Dict{String, Any}("x-amz-Checksum"=>x_amz_Checksum, "x-amz-Checksum-Algorithm"=>x_amz_Checksum_Algorithm, "x-amz-Data-Length"=>x_amz_Data_Length)); aws_config=aws_config)
PutSnapshotBlock(BlockData, blockIndex, snapshotId, x_amz_Checksum, x_amz_Checksum_Algorithm, x_amz_Data_Length, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = ebs("PUT", "/snapshots/$(snapshotId)/blocks/$(blockIndex)", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("BlockData"=>BlockData, "headers"=>Dict{String, Any}("x-amz-Checksum"=>x_amz_Checksum, "x-amz-Checksum-Algorithm"=>x_amz_Checksum_Algorithm, "x-amz-Data-Length"=>x_amz_Data_Length)), args)); aws_config=aws_config)

"""
    StartSnapshot()

Creates a new Amazon EBS snapshot. The new snapshot enters the pending state after the request completes.  After creating the snapshot, use  PutSnapshotBlock to write blocks of data to the snapshot.

# Required Parameters
- `VolumeSize`: The size of the volume, in GiB. The maximum size is 16384 GiB (16 TiB).

# Optional Parameters
- `ClientToken`: A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Idempotency ensures that an API request completes only once. With an idempotent request, if the original request completes successfully. The subsequent retries with the same client token return the result from the original successful request and they have no additional effect. If you do not specify a client token, one is automatically generated by the AWS SDK. For more information, see  Idempotency for StartSnapshot API in the Amazon Elastic Compute Cloud User Guide.
- `Description`: A description for the snapshot.
- `Encrypted`: Indicates whether to encrypt the snapshot. To create an encrypted snapshot, specify true. To create an unencrypted snapshot, omit this parameter. If you specify a value for ParentSnapshotId, omit this parameter. If you specify true, the snapshot is encrypted using the CMK specified using the KmsKeyArn parameter. If no value is specified for KmsKeyArn, the default CMK for your account is used. If no default CMK has been specified for your account, the AWS managed CMK is used. To set a default CMK for your account, use  ModifyEbsDefaultKmsKeyId. If your account is enabled for encryption by default, you cannot set this parameter to false. In this case, you can omit this parameter. For more information, see  Using encryption in the Amazon Elastic Compute Cloud User Guide.
- `KmsKeyArn`: The Amazon Resource Name (ARN) of the AWS Key Management Service (AWS KMS) customer master key (CMK) to be used to encrypt the snapshot. If you do not specify a CMK, the default AWS managed CMK is used. If you specify a ParentSnapshotId, omit this parameter; the snapshot will be encrypted using the same CMK that was used to encrypt the parent snapshot. If Encrypted is set to true, you must specify a CMK ARN. 
- `ParentSnapshotId`: The ID of the parent snapshot. If there is no parent snapshot, or if you are creating the first snapshot for an on-premises volume, omit this parameter. If your account is enabled for encryption by default, you cannot use an unencrypted snapshot as a parent snapshot. You must first create an encrypted copy of the parent snapshot using CopySnapshot.
- `Tags`: The tags to apply to the snapshot.
- `Timeout`: The amount of time (in minutes) after which the snapshot is automatically cancelled if:   No blocks are written to the snapshot.   The snapshot is not completed after writing the last block of data.   If no value is specified, the timeout defaults to 60 minutes.
"""

StartSnapshot(VolumeSize; aws_config::AWSConfig=global_aws_config()) = ebs("POST", "/snapshots", Dict{String, Any}("VolumeSize"=>VolumeSize, "ClientToken"=>string(uuid4())); aws_config=aws_config)
StartSnapshot(VolumeSize, args::AbstractDict{String, <:Any}; aws_config::AWSConfig=global_aws_config()) = ebs("POST", "/snapshots", Dict{String, Any}(mergewith(_merge, Dict{String, Any}("VolumeSize"=>VolumeSize, "ClientToken"=>string(uuid4())), args)); aws_config=aws_config)
