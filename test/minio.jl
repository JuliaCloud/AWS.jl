using AWS
struct MinioConfig <: AbstractAWSConfig 
endpoint::String
region::String
creds
end
AWS.region(c::MinioConfig) = c.region
AWS.credentials(c::MinioConfig) = c.creds
struct SimpleCredentials
    access_key_id::String
    secret_key::String
    token::String
end
AWS.check_credentials(c::SimpleCredentials) = c
function AWS._generate_service_url(aws::MinioConfig, service::String, resource::String)
    service == "s3" || throw(ArgumentError("Can only handle s3 requests to Minio"))
    return string(aws.endpoint, resource)
end
AWS.global_aws_config(MinioConfig("http://127.0.0.1:9000","aregion",SimpleCredentials("minio", "minio123","")))

@service S3


datadir  = joinpath(dirname(pathof(AWS)),"..","data")

# Test creating a bucket
S3.create_bucket("anewbucket")
# And putting some objects inside
S3.put_object("anewbucket","myobject",Dict("body"=>"Hi from Minio"))
S3.put_object("anewbucket","empty")
S3.put_object("anewbucket","foo/bar",Dict("body"=>"a nested object"))
S3.put_object("anewbucket","foo/baz",Dict("body"=>"a secondnested object"))

#Test retrieving an object
@test S3.get_object("anewbucket","myobject") |> String == "Hi from Minio"

# Test listing
objs = S3.list_objects_v2("anewbucket")
@test length(objs["Contents"]) == 4

# Test listing with prefixes
objs_prefix = S3.list_objects_v2("anewbucket", Dict("prefix"=>"", "delimiter"=>"/"))
@test length(objs_prefix["Contents"]) == 2
@test sort(getindex.(objs_prefix["Contents"],"Key")) == ["empty","myobject"]
@test objs_prefix["CommonPrefixes"]["Prefix"] == "foo/"

#And delete all objects and the bucket
objs = S3.list_objects_v2("anewbucket")
for obj in objs["Contents"]
    S3.delete_object("anewbucket",obj["Key"])
end
S3.delete_bucket("anewbucket")
@test isempty(filter(!isequal(".minio.sys"),readdir(datadir)))