# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: ebs
using AWS.Compat
using AWS.UUIDs

MAPPING = Dict(
    "starting_block_index" => "startingBlockIndex",
    "next_token" => "pageToken",
    "encrypted" => "Encrypted",
    "checksum" => "x-amz-Checksum",
    "progress" => "x-amz-Progress",
    "first_snapshot_id" => "firstSnapshotId",
    "description" => "Description",
    "max_results" => "maxResults",
    "client_token" => "ClientToken",
    "checksum_algorithm" => "x-amz-Checksum-Algorithm",
    "kms_key_arn" => "KmsKeyArn",
    "timeout" => "Timeout",
    "checksum_aggregation_method" => "x-amz-Checksum-Aggregation-Method",
    "parent_snapshot_id" => "ParentSnapshotId",
    "tags" => "Tags",
)

"""
    complete_snapshot(snapshot_id, x-amz-_changed_blocks_count; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Seals and completes the snapshot after all of the required blocks of data have been written
to it. Completing the snapshot changes the status to completed. You cannot write new blocks
to a snapshot after it has been completed.

# Arguments
- `snapshot_id`: The ID of the snapshot.
- `x-amz-_changed_blocks_count`: The number of blocks that were written to the snapshot.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"checksum"`: An aggregated Base-64 SHA256 checksum based on the checksums of each
  written block. To generate the aggregated checksum using the linear aggregation method,
  arrange the checksums for each written block in ascending order of their block index,
  concatenate them to form a single string, and then generate the checksum on the entire
  string using the SHA256 algorithm.
- `"checksum_aggregation_method"`: The aggregation method used to generate the checksum.
  Currently, the only supported aggregation method is LINEAR.
- `"checksum_algorithm"`: The algorithm used to generate the checksum. Currently, the only
  supported algorithm is SHA256.
"""
function complete_snapshot(
    snapshotId,
    x_amz_ChangedBlocksCount;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return ebs(
        "POST",
        "/snapshots/completion/$(snapshotId)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "headers" => Dict{String,Any}(
                        "x-amz-ChangedBlocksCount" => x_amz_ChangedBlocksCount
                    ),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_snapshot_block(block_index, block_token, snapshot_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns the data in a block in an Amazon Elastic Block Store snapshot.

# Arguments
- `block_index`: The block index of the block from which to get data. Obtain the BlockIndex
  by running the ListChangedBlocks or ListSnapshotBlocks operations.
- `block_token`: The block token of the block from which to get data. Obtain the BlockToken
  by running the ListChangedBlocks or ListSnapshotBlocks operations.
- `snapshot_id`: The ID of the snapshot containing the block from which to get data.

"""
function get_snapshot_block(
    blockIndex,
    blockToken,
    snapshotId;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return ebs(
        "GET",
        "/snapshots/$(snapshotId)/blocks/$(blockIndex)",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("blockToken" => blockToken), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_changed_blocks(second_snapshot_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the blocks that are different between two Amazon Elastic Block
Store snapshots of the same volume/snapshot lineage.

# Arguments
- `second_snapshot_id`: The ID of the second snapshot to use for the comparison.  The
  SecondSnapshotId parameter must be specified with a FirstSnapshotID parameter; otherwise,
  an error occurs.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"first_snapshot_id"`: The ID of the first snapshot to use for the comparison.  The
  FirstSnapshotID parameter must be specified with a SecondSnapshotId parameter; otherwise,
  an error occurs.
- `"max_results"`: The number of results to return.
- `"next_token"`: The token to request the next page of results.
- `"starting_block_index"`: The block index from which the comparison should start. The
  list in the response will start from this block index or the next valid block index in the
  snapshots.
"""
function list_changed_blocks(
    secondSnapshotId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return ebs(
        "GET",
        "/snapshots/$(secondSnapshotId)/changedblocks",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_snapshot_blocks(snapshot_id; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Returns information about the blocks in an Amazon Elastic Block Store snapshot.

# Arguments
- `snapshot_id`: The ID of the snapshot from which to get block indexes and block tokens.

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"max_results"`: The number of results to return.
- `"next_token"`: The token to request the next page of results.
- `"starting_block_index"`: The block index from which the list should start. The list in
  the response will start from this block index or the next valid block index in the snapshot.
"""
function list_snapshot_blocks(
    snapshotId; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return ebs(
        "GET",
        "/snapshots/$(snapshotId)/blocks",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_snapshot_block(block_data, block_index, snapshot_id, x-amz-_checksum, x-amz-_checksum-_algorithm, x-amz-_data-_length; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Writes a block of data to a snapshot. If the specified block contains data, the existing
data is overwritten. The target snapshot must be in the pending state. Data written to a
snapshot must be aligned with 512-KiB sectors.

# Arguments
- `block_data`: The data to write to the block. The block data is not signed as part of the
  Signature Version 4 signing process. As a result, you must generate and provide a
  Base64-encoded SHA256 checksum for the block data using the x-amz-Checksum header. Also,
  you must specify the checksum algorithm using the x-amz-Checksum-Algorithm header. The
  checksum that you provide is part of the Signature Version 4 signing process. It is
  validated against a checksum generated by Amazon EBS to ensure the validity and
  authenticity of the data. If the checksums do not correspond, the request fails. For more
  information, see  Using checksums with the EBS direct APIs in the Amazon Elastic Compute
  Cloud User Guide.
- `block_index`: The block index of the block in which to write the data. A block index is
  a logical index in units of 512 KiB blocks. To identify the block index, divide the logical
  offset of the data in the logical volume by the block size (logical offset of data/524288).
  The logical offset of the data must be 512 KiB aligned.
- `snapshot_id`: The ID of the snapshot.
- `x-amz-_checksum`: A Base64-encoded SHA256 checksum of the data. Only SHA256 checksums
  are supported.
- `x-amz-_checksum-_algorithm`: The algorithm used to generate the checksum. Currently, the
  only supported algorithm is SHA256.
- `x-amz-_data-_length`: The size of the data to write to the block, in bytes. Currently,
  the only supported size is 524288 bytes. Valid values: 524288

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"progress"`: The progress of the write process, as a percentage.
"""
function put_snapshot_block(
    BlockData,
    blockIndex,
    snapshotId,
    x_amz_Checksum,
    x_amz_Checksum_Algorithm,
    x_amz_Data_Length;
    aws_config::AbstractAWSConfig=global_aws_config(),
    kwargs...,
)
    params = amazonify(MAPPING, kwargs)
    return ebs(
        "PUT",
        "/snapshots/$(snapshotId)/blocks/$(blockIndex)",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "BlockData" => BlockData,
                    "headers" => Dict{String,Any}(
                        "x-amz-Checksum" => x_amz_Checksum,
                        "x-amz-Checksum-Algorithm" => x_amz_Checksum_Algorithm,
                        "x-amz-Data-Length" => x_amz_Data_Length,
                    ),
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_snapshot(volume_size; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...)

Creates a new Amazon EBS snapshot. The new snapshot enters the pending state after the
request completes.  After creating the snapshot, use  PutSnapshotBlock to write blocks of
data to the snapshot.

# Arguments
- `volume_size`: The size of the volume, in GiB. The maximum size is 65536 GiB (64 TiB).

# Optional Parameters
Optional parameters can be passed as a keyword argument. Valid keys are:
- `"client_token"`: A unique, case-sensitive identifier that you provide to ensure the
  idempotency of the request. Idempotency ensures that an API request completes only once.
  With an idempotent request, if the original request completes successfully. The subsequent
  retries with the same client token return the result from the original successful request
  and they have no additional effect. If you do not specify a client token, one is
  automatically generated by the Amazon Web Services SDK. For more information, see
  Idempotency for StartSnapshot API in the Amazon Elastic Compute Cloud User Guide.
- `"description"`: A description for the snapshot.
- `"encrypted"`: Indicates whether to encrypt the snapshot. To create an encrypted
  snapshot, specify true. To create an unencrypted snapshot, omit this parameter. If you
  specify a value for ParentSnapshotId, omit this parameter. If you specify true, the
  snapshot is encrypted using the KMS key specified using the KmsKeyArn parameter. If no
  value is specified for KmsKeyArn, the default KMS key for your account is used. If no
  default KMS key has been specified for your account, the Amazon Web Services managed KMS
  key is used. To set a default KMS key for your account, use  ModifyEbsDefaultKmsKeyId. If
  your account is enabled for encryption by default, you cannot set this parameter to false.
  In this case, you can omit this parameter. For more information, see  Using encryption in
  the Amazon Elastic Compute Cloud User Guide.
- `"kms_key_arn"`: The Amazon Resource Name (ARN) of the Key Management Service (KMS) key
  to be used to encrypt the snapshot. If you do not specify a KMS key, the default Amazon Web
  Services managed KMS key is used. If you specify a ParentSnapshotId, omit this parameter;
  the snapshot will be encrypted using the same KMS key that was used to encrypt the parent
  snapshot. If Encrypted is set to true, you must specify a KMS key ARN.
- `"parent_snapshot_id"`: The ID of the parent snapshot. If there is no parent snapshot, or
  if you are creating the first snapshot for an on-premises volume, omit this parameter. If
  your account is enabled for encryption by default, you cannot use an unencrypted snapshot
  as a parent snapshot. You must first create an encrypted copy of the parent snapshot using
  CopySnapshot.
- `"tags"`: The tags to apply to the snapshot.
- `"timeout"`: The amount of time (in minutes) after which the snapshot is automatically
  cancelled if:   No blocks are written to the snapshot.   The snapshot is not completed
  after writing the last block of data.   If no value is specified, the timeout defaults to
  60 minutes.
"""
function start_snapshot(
    VolumeSize; aws_config::AbstractAWSConfig=global_aws_config(), kwargs...
)
    params = amazonify(MAPPING, kwargs)
    return ebs(
        "POST",
        "/snapshots",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "VolumeSize" => VolumeSize, "client_token" => string(uuid4())
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
