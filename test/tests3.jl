using AWS
using AWS.S3

include("config.jl")

env=AWSEnv(; id=id, key=key, dbg=dbg)

## env = AWSEnv(timeout=60.0)

bkt = "1-test-temp-bkt"

println("List all buckets")
resp=S3.list_all_buckets(env)
println(resp.obj)

println("Create a bucket")
acl=S3.S3_ACL()
acl.acl="public-read"
resp=S3.create_bkt(env, bkt, acl=acl)
println(resp)

po = S3.PutObjectOptions()
po.acl = acl

println("Add a file")
resp = S3.put_object(env, bkt, "file1", "Hello ", options=po)
println(resp)


println("Add another file")
resp = S3.put_object(env, bkt, "file2", "World ")
println(resp)

println("Add another file (POST)")
file = open("test_file.txt", "w+")
write(file, "BEGIN_1234_END")
resp = S3.post_object(env, bkt, "file3", file)
close(file)

println("List bucket")
resp = S3.get_bkt(env, bkt)
println(resp)

println("Get file 1")
resp = S3.get_object(env, bkt, "file1")
println(resp)

println("Get file 2")
resp = S3.get_object(env, bkt, "file2")
println(resp)

println("Get file 3")
resp = S3.get_object(env, bkt, "file3")
println(resp)

println("Sleep for 30 secs ....")
sleep(30)


println("Delete file 1")
resp = S3.del_object(env, bkt, "file1") 
println(resp)

println("Delete file 2 using the multi api")
resp = S3.del_object_multi(env, bkt, S3.DeleteObjectsType([S3.ObjectType("file2")]))
println(resp)

println("Delete file 1")
resp = S3.del_object(env, bkt, "file3") 
println(resp)

println("Delete Bucket")
resp = S3.del_bkt(env, bkt)
println(resp)


