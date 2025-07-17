abstract type AbstractAWSConfig end

# https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html
const AWS_MAX_RETRY_ATTEMPTS = 3

"""
    max_attempts(::AbstractAWSConfig) -> Int

The number of AWS request retry attempts to make.
Each backend may perform an additional layer backend-specific retries.

`AbstractAWSConfig` subtypes should allow users to override the default.
The default is 3, per the recommendations at
https://docs.aws.amazon.com/sdkref/latest/guide/feature-retry-behavior.html
"""
max_attempts(::AbstractAWSConfig) = AWS_MAX_RETRY_ATTEMPTS

mutable struct AWSConfig <: AbstractAWSConfig
    credentials::Union{AWSCredentials,Nothing}
    region::String
    output::String
    max_attempts::Int
end

# provide a default for the new field since people were using the default constructor
AWSConfig(creds, region, output) = AWSConfig(creds, region, output, AWS_MAX_RETRY_ATTEMPTS)

credentials(aws::AWSConfig) = aws.credentials
region(aws::AWSConfig) = aws.region
max_attempts(aws::AWSConfig) = aws.max_attempts

function AWSConfig(;
    profile=nothing,
    creds=AWSCredentials(; profile=profile),
    region=nothing,
    output="json",
    max_attempts=AWS_MAX_RETRY_ATTEMPTS,
)
    region = @something region aws_get_region(; profile=profile)
    return AWSConfig(creds, region, output, max_attempts)
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
    response = AWSServices.sts(
        "GetCallerIdentity";
        aws_config=aws_config,
        feature_set=FeatureSet(; use_response_type=true),
    )
    dict = parse(response)["GetCallerIdentityResult"]
    creds = aws_config.credentials

    creds.user_arn = dict["Arn"]
    creds.account_number = dict["Account"]

    return creds
end

const _DEFAULT_AWS_CONFIG = Ref{AbstractAWSConfig}()
const _DEFAULT_AWS_CONFIG_LOCK = ReentrantLock()
const _SCOPED_AWS_CONFIG = ScopedValue{AbstractAWSConfig}()

"""
    default_aws_config(config::AbstractAWSConfig) -> Nothing

Sets the default AWS configuration to use when calling
[`current_aws_config()`](@ref current_aws_config) outside of the scope of any
[`with_aws_config`](@ref) calls.
"""
function default_aws_config(config::AbstractAWSConfig)
    @lock _DEFAULT_AWS_CONFIG_LOCK begin
        _DEFAULT_AWS_CONFIG[] = config
    end
    return nothing
end

"""
    default_aws_config() -> AbstractAWSConfig

Gets the default AWS configuration to use when calling
[`current_aws_config()`](@ref current_aws_config) outside of the scope of any
[`with_aws_config`](@ref) calls. If no configuration has been set with
`default_aws_config(::AbstractAWSConfig)` then the AWS configuration will be loaded using
`AWSConfig()`.

User's will typically want to use [`current_aws_config()](@ref current_aws_config) instead.
"""
function default_aws_config()
    # Load an initial default AWS configuration only if a user hasn't already loaded one.
    # We'll  make use of a lock to avoid race conditions but only lock when necessary to
    # avoid unnecessary overhead.
    if !isassigned(_DEFAULT_AWS_CONFIG)
        @lock _DEFAULT_AWS_CONFIG_LOCK begin
            if !isassigned(_DEFAULT_AWS_CONFIG)
                _DEFAULT_AWS_CONFIG[] = @mock AWSConfig()
            end
        end
    end

    return _DEFAULT_AWS_CONFIG[]
end

"""
    current_aws_config() -> AbstractAWSConfig

Retrieve the current AWS configuration set within the current scope. If no configuration has
been set using [`with_aws_config`](@ref) then the default AWS configuration will be used.
"""
function current_aws_config()
    #! format: off
    return @something(
        ScopedValues.get(_SCOPED_AWS_CONFIG),
        @mock(default_aws_config()),
    )
    #! format: on
end

"""
    with_aws_config(f, config::AbstractAWSConfig) -> Any

Executes the function `f` where the result of `current_aws_config()` returns `config`.
Nesting of `with_aws_config` calls is supported.

The user provided function `f` takes no parameters. The `with_aws_config` function returns
the result return from `f`.
"""
function with_aws_config(f, config::AbstractAWSConfig)
    return @with _SCOPED_AWS_CONFIG => config begin
        f()
    end
end
