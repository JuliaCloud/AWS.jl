type MetadataEntry
    Name::Union(ASCIIString, Nothing)
    Value::Union(ASCIIString, Nothing)

    MetadataEntry(; Name=nothing, Value=nothing) = 
         new(Name, Value)
end
export MetadataEntry


type Status
    Code::Union(Int32, Nothing)
    Description::Union(ASCIIString, Nothing)

    Status(; Code=nothing, Description=nothing) = 
         new(Code, Description)
end
export Status


type CreateBucketResult
    BucketName::Union(ASCIIString, Nothing)

    CreateBucketResult(; BucketName=nothing) = 
         new(BucketName)
end
export CreateBucketResult


