type MetadataEntry
    Name::Union(ASCIIString, Nothing)
    Value::Union(ASCIIString, Nothing)

    MetadataEntry(Name, Value) = 
         new(Name, Value)
    MetadataEntry() = 
        new(nothing, nothing)
end
export MetadataEntry


type Status
    Code::Union(Int32, Nothing)
    Description::Union(ASCIIString, Nothing)

    Status(Code, Description) = 
         new(Code, Description)
    Status() = 
        new(nothing, nothing)
end
export Status


type CreateBucketResult
    BucketName::Union(ASCIIString, Nothing)

    CreateBucketResult(BucketName) = 
         new(BucketName)
    CreateBucketResult() = 
        new(nothing)
end
export CreateBucketResult


