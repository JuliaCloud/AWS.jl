module TestS3
using AWS
using AWS.S3
using Base.Test

function check_resp(resp, resp_obj_type=Any)
    info("response: ", resp.obj)
    @test 200 <= resp.http_code <= 206
    @test isa(resp, AWS.S3.S3Response)
    @test isa(resp.obj, resp_obj_type)
end

function test_bucket_ops(env)
    bkt = "1-test-temp-bkt"

    info("list all buckets")
    resp = S3.list_all_buckets(env)
    check_resp(resp, AWS.S3.ListAllMyBucketsResult)
    @test isa(resp.obj.buckets, Vector{AWS.S3.Bucket})

    info("create a bucket")
    acl = S3.S3_ACL()
    acl.acl = "public-read"
    resp = S3.create_bkt(env, bkt, acl=acl, config=AWS.S3.CreateBucketConfiguration(env.region))
    check_resp(resp, String)

    po = S3.PutObjectOptions()
    po.acl = acl

    info("add a file")
    resp = S3.put_object(env, bkt, "file1", "Hello ", options=po)
    check_resp(resp, String)

    info("add another file")
    resp = S3.put_object(env, bkt, "file2", "World ")
    check_resp(resp, String)

    info("add another file")
    resp = S3.put_object(env, bkt, "file3", "Hello World ")
    check_resp(resp, String)

    info("list bucket")
    resp = S3.get_bkt(env, bkt)
    check_resp(resp, AWS.S3.ListBucketResult)
    @test isa(resp.obj.contents, Vector{AWS.S3.Contents})
    @test length(resp.obj.contents) == 3

    info("get file 1")
    resp = S3.get_object(env, bkt, "file1")
    check_resp(resp, Vector{UInt8})
    @test String(resp.obj) == "Hello "

    info("get file 2")
    resp = S3.get_object(env, bkt, "file2")
    check_resp(resp, Vector{UInt8})
    @test String(resp.obj) == "World "

    # sleep to allow some window to run manual debug commands
    #info("Sleep for 10 secs ....")
    #sleep(10)

    info("list objects")
    (bkt,objs) = S3.list_objects(env, bkt, "fi")
    @test collect(objs) == ["file1", "file2", "file3"]

    info("list objects with details")
    (bkt,objs) = S3.list_objects_details(env, bkt, "fi")
    @test [o.key for o in objs] == ["file1", "file2", "file3"]

    info("delete file 1")
    resp = S3.del_object(env, bkt, "file1")
    check_resp(resp, String)

    info("delete file 2 using the multi api")
    resp = S3.del_object_multi(env, bkt, S3.DeleteObjectsType([S3.ObjectType("file2"), S3.ObjectType("file3")]))
    check_resp(resp, AWS.S3.DeleteResult)
    @test isa(resp.obj.deleted, Vector{AWS.S3.Deleted})
    @test length(resp.obj.deleted) == 2

    info("delete bucket")
    resp = S3.del_bkt(env, bkt)
    check_resp(resp, String)
end

function test_endpoint(env)
    info("custom s3 endpoint")
    env2 = AWSEnv(env, ep="http://localhost/")
    try
        S3.list_all_buckets(env2)
        error("expected connect failure")
    catch ex
        @test isa(ex, Base.UVError)
        @test ex.prefix == "connect"
    end
end

function runtests(env, config)
    info("testing s3 bucket ops...")
    test_endpoint(env)
    test_bucket_ops(env)
end

end # module TestS3
