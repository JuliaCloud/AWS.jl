module API

using AWS.EC2

import Base: start, next, done, getindex, isempty

for f in (:start, :next, :done, :getindex, :isempty)
    @eval $(f)(a::DescribeInstancesResponseType, args...) = $(f)(a.reservationSet,args...)
end 

end