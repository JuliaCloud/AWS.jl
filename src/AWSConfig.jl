mutable struct AWSConfig
    credentials::AWSCredentials
    region::String
    output::String
end

function AWSConfig(;
    profile=nothing,
    creds=AWSCredentials(profile=profile),
    region=get(ENV, "AWS_DEFAULT_REGION", "us-east-1"),
    output="json",
)
    return AWSConfig(creds, region, output)
end

"""
    aws_user_arn(aws::AWSConfig) -> String

Retrieve the `User ARN` from the `AWSConfig`, if not present query STS to update the
`user_arn`.

# Arguments
- `aws::AWSConfig`: AWSConfig used to retrieve the user arn
"""
function aws_user_arn(aws::AWSConfig)
    creds = aws.credentials

    if isempty(creds.user_arn)
        _update_creds!(aws)
    end

    return creds.user_arn
end

"""
    aws_account_number(aws::AWSConfig) -> String

Retrieve the `AWS account number` from the `AWSConfig`, if not present query STS to update
the `AWS account number`.

# Arguments
- `aws::AWSConfig`: AWSConfig used to retrieve the AWS account number
"""
function aws_account_number(aws::AWSConfig)
    creds = aws.credentials

    if isempty(creds.account_number)
        _update_creds!(aws)
    end

    return creds.account_number
end

function _update_creds!(aws_config::AWSConfig)
    r = AWSServices.sts("GetCallerIdentity"; aws_config=aws_config)
    r = r["GetCallerIdentityResult"]
    creds = aws_config.credentials

    creds.user_arn = r["Arn"]
    creds.account_number = r["Account"]

    return creds
end
