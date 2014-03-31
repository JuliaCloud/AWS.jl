refs = Array(RemoteRef, ec2_num_workers)
responses = Array(Int, ec2_num_workers)

println("Testing newly added workers")

tic()
for (i,p) in enumerate(workers())
    refs[i] = remotecall(p, myid)
end

@sync begin
    for i in 1:ec2_num_workers
        @async begin
            responses[i] = take!(refs[i])
        end
    end
end

println("responses:")
for r in responses
    print("$r ")
end
println()

println("Time taken : ", toq())

assert(responses[1] == 2)
assert(responses[ec2_num_workers] == ec2_num_workers+1)

