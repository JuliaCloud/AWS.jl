@testset "Load Credentials" begin
    config = global_aws_config()
    user = aws_user_arn(config)
    @test occursin(r"^arn:aws:(iam|sts)::[0-9]+:[^:]+$", user)
    config.region = "us-east-1"

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
