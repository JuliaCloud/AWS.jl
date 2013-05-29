using LibExpat
using Calendar
using Base.Test

include("../src/s3_types.jl") 

macro testxml (oname)
    quote
#        println("\n\n"); tic()
        xom = xp_parse(readall($(string(oname)) * ".xml"))
#        print("XOM : "); println(xom)
        o = $(esc(oname))(xom)
#        toc()
        print ($(string(oname)) * " : "); println(o)
    end
end

@testxml CORSConfiguration
@testxml ListAllMyBucketsResult
@testxml ListBucketResult
@testxml AccessControlPolicy
@testxml VersioningConfiguration

xom = xp_parse(readall("VersioningConfiguration2.xml"))
o = VersioningConfiguration(xom)
print ("VersioningConfiguration : "); println(o)

@testxml RequestPaymentConfiguration
@testxml CompleteMultipartUploadResult

xom = xp_parse(readall("Error.xml"))
o = S3Error(xom)
print ("S3Error : "); println(o)


@testxml BucketLoggingStatus
@testxml ListVersionsResult
@testxml NotificationConfiguration
@testxml InitiateMultipartUploadResult
@testxml CopyPartResult
@testxml ListPartsResult



