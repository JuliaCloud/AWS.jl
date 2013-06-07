using AWS
using AWS.S3

env = AWSEnv(ENV["AWS_ID"], ENV["AWS_SECKEY"], EP_US_EAST_NORTHERN_VIRGINIA, 60.0, false, false)

bkt = "rnam0987"

println("List all buckets")
resp=S3.list_all_buckets(env)
println(resp.obj)

println("Create a bucket")
acl=S3.S3_ACL()
acl.acl="private"
resp=S3.create_bkt(env, bkt, acl=acl)
println("$(resp.http_code), $(resp.obj)")

println("Add a file")
resp = S3.put_object(env, bkt, "file1", "Hello ")
println("$(resp.http_code), $(resp.obj)")


println("Add another file")
resp = S3.put_object(env, bkt, "file2", "World ")
println("$(resp.http_code), $(resp.obj)")


println("List bucket")
resp = S3.get_bkt(env, bkt)
println("$(resp.http_code), $(resp.obj)")

println("Get file 1")
resp = S3.get_object(env, bkt, "file1")
println("$(resp.http_code), $(resp.obj)")

println("Get file 2")
resp = S3.get_object(env, bkt, "file2")
println("$(resp.http_code), $(resp.obj)")


println("Delete file 1")
resp = S3.del_object(env, bkt, "file1") 
println("$(resp.http_code), $(resp.obj)")

println("Delete file 2 using the multi api")
resp = S3.del_object_multi(env, bkt, S3.DeleteObjectsType([S3.ObjectType("file2")]))
println("$(resp.http_code), $(resp.obj)")


println("Delete Bucket")
resp = S3.del_bkt(env, bkt)
println("$(resp.http_code), $(resp.obj)")


