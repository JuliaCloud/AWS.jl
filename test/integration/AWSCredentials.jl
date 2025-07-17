# Must be executed in the same region where the CloudFormation template `aws_jl_test.yaml`
# was deployed into.
@testset "Load Credentials" begin
    config = current_aws_config()
    user = aws_user_arn(config)
    @test occursin(r"^arn:aws:(iam|sts)::[0-9]+:[^:]+$", user)

    @test_ecode("InvalidAction", AWSServices.iam("GetFoo"))

    @test_ecode(
        ["AccessDenied", "NoSuchEntity"],
        AWSServices.iam("GetUser", Dict("UserName" => "notauser"))
    )

    @test_ecode("ValidationError", AWSServices.iam("GetUser", Dict("UserName" => "@#!%%!")))

    # Please note: If testing in a managed Corporate AWS environment, this can set off alarms...
    @test_ecode(
        ["AccessDenied", "EntityAlreadyExists"],
        AWSServices.iam("CreateUser", Dict("UserName" => "root"))
    )
end
