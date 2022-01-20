# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: redshift_data
using AWS.Compat
using AWS.UUIDs

"""
    batch_execute_statement(database, sqls)
    batch_execute_statement(database, sqls, params::Dict{String,<:Any})

Runs one or more SQL statements, which can be data manipulation language (DML) or data
definition language (DDL). Depending on the authorization method, use one of the following
combinations of request parameters:    Secrets Manager - when connecting to a cluster,
specify the Amazon Resource Name (ARN) of the secret, the database name, and the cluster
identifier that matches the cluster in the secret. When connecting to a serverless
endpoint, specify the Amazon Resource Name (ARN) of the secret and the database name.
Temporary credentials - when connecting to a cluster, specify the cluster identifier, the
database name, and the database user name. Also, permission to call the
redshift:GetClusterCredentials operation is required. When connecting to a serverless
endpoint, specify the database name.

# Arguments
- `database`: The name of the database. This parameter is required when authenticating
  using either Secrets Manager or temporary credentials.
- `sqls`: One or more SQL statements to run.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClusterIdentifier"`: The cluster identifier. This parameter is required when connecting
  to a cluster and authenticating using either Secrets Manager or temporary credentials.
- `"DbUser"`: The database user name. This parameter is required when connecting to a
  cluster and authenticating using temporary credentials.
- `"SecretArn"`: The name or ARN of the secret that enables access to the database. This
  parameter is required when authenticating using Secrets Manager.
- `"StatementName"`: The name of the SQL statements. You can name the SQL statements when
  you create them to identify the query.
- `"WithEvent"`: A value that indicates whether to send an event to the Amazon EventBridge
  event bus after the SQL statements run.
"""
function batch_execute_statement(
    Database, Sqls; aws_config::AbstractAWSConfig=global_aws_config()
)
    return redshift_data(
        "BatchExecuteStatement",
        Dict{String,Any}("Database" => Database, "Sqls" => Sqls);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function batch_execute_statement(
    Database,
    Sqls,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return redshift_data(
        "BatchExecuteStatement",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Database" => Database, "Sqls" => Sqls), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    cancel_statement(id)
    cancel_statement(id, params::Dict{String,<:Any})

Cancels a running query. To be canceled, a query must be running.

# Arguments
- `id`: The identifier of the SQL statement to cancel. This value is a universally unique
  identifier (UUID) generated by Amazon Redshift Data API. This identifier is returned by
  BatchExecuteStatment, ExecuteStatment, and ListStatements.

"""
function cancel_statement(Id; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "CancelStatement",
        Dict{String,Any}("Id" => Id);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function cancel_statement(
    Id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return redshift_data(
        "CancelStatement",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Id" => Id), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_statement(id)
    describe_statement(id, params::Dict{String,<:Any})

Describes the details about a specific instance when a query was run by the Amazon Redshift
Data API. The information includes when the query started, when it finished, the query
status, the number of rows returned, and the SQL statement.

# Arguments
- `id`: The identifier of the SQL statement to describe. This value is a universally unique
  identifier (UUID) generated by Amazon Redshift Data API. A suffix indicates the number of
  the SQL statement. For example, d9b6c0c9-0747-4bf4-b142-e8883122f766:2 has a suffix of :2
  that indicates the second SQL statement of a batch query. This identifier is returned by
  BatchExecuteStatment, ExecuteStatement, and ListStatements.

"""
function describe_statement(Id; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "DescribeStatement",
        Dict{String,Any}("Id" => Id);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_statement(
    Id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return redshift_data(
        "DescribeStatement",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Id" => Id), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_table(database)
    describe_table(database, params::Dict{String,<:Any})

Describes the detailed information about a table from metadata in the cluster. The
information includes its columns. A token is returned to page through the column list.
Depending on the authorization method, use one of the following combinations of request
parameters:    Secrets Manager - when connecting to a cluster, specify the Amazon Resource
Name (ARN) of the secret, the database name, and the cluster identifier that matches the
cluster in the secret. When connecting to a serverless endpoint, specify the Amazon
Resource Name (ARN) of the secret and the database name.    Temporary credentials - when
connecting to a cluster, specify the cluster identifier, the database name, and the
database user name. Also, permission to call the redshift:GetClusterCredentials operation
is required. When connecting to a serverless endpoint, specify the database name.

# Arguments
- `database`: The name of the database that contains the tables to be described. If
  ConnectedDatabase is not specified, this is also the database to connect to with your
  authentication credentials.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClusterIdentifier"`: The cluster identifier. This parameter is required when connecting
  to a cluster and authenticating using either Secrets Manager or temporary credentials.
- `"ConnectedDatabase"`: A database name. The connected database is specified when you
  connect with your authentication credentials.
- `"DbUser"`: The database user name. This parameter is required when connecting to a
  cluster and authenticating using temporary credentials.
- `"MaxResults"`: The maximum number of tables to return in the response. If more tables
  exist than fit in one response, then NextToken is returned to page through the results.
- `"NextToken"`: A value that indicates the starting point for the next set of response
  records in a subsequent request. If a value is returned in a response, you can retrieve the
  next set of records by providing this returned NextToken value in the next NextToken
  parameter and retrying the command. If the NextToken field is empty, all response records
  have been retrieved for the request.
- `"Schema"`: The schema that contains the table. If no schema is specified, then matching
  tables for all schemas are returned.
- `"SecretArn"`: The name or ARN of the secret that enables access to the database. This
  parameter is required when authenticating using Secrets Manager.
- `"Table"`: The table name. If no table is specified, then all tables for all matching
  schemas are returned. If no table and no schema is specified, then all tables for all
  schemas in the database are returned
"""
function describe_table(Database; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "DescribeTable",
        Dict{String,Any}("Database" => Database);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_table(
    Database,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return redshift_data(
        "DescribeTable",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Database" => Database), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    execute_statement(database, sql)
    execute_statement(database, sql, params::Dict{String,<:Any})

Runs an SQL statement, which can be data manipulation language (DML) or data definition
language (DDL). This statement must be a single SQL statement. Depending on the
authorization method, use one of the following combinations of request parameters:
Secrets Manager - when connecting to a cluster, specify the Amazon Resource Name (ARN) of
the secret, the database name, and the cluster identifier that matches the cluster in the
secret. When connecting to a serverless endpoint, specify the Amazon Resource Name (ARN) of
the secret and the database name.    Temporary credentials - when connecting to a cluster,
specify the cluster identifier, the database name, and the database user name. Also,
permission to call the redshift:GetClusterCredentials operation is required. When
connecting to a serverless endpoint, specify the database name.

# Arguments
- `database`: The name of the database. This parameter is required when authenticating
  using either Secrets Manager or temporary credentials.
- `sql`: The SQL statement text to run.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClusterIdentifier"`: The cluster identifier. This parameter is required when connecting
  to a cluster and authenticating using either Secrets Manager or temporary credentials.
- `"DbUser"`: The database user name. This parameter is required when connecting to a
  cluster and authenticating using temporary credentials.
- `"Parameters"`: The parameters for the SQL statement.
- `"SecretArn"`: The name or ARN of the secret that enables access to the database. This
  parameter is required when authenticating using Secrets Manager.
- `"StatementName"`: The name of the SQL statement. You can name the SQL statement when you
  create it to identify the query.
- `"WithEvent"`: A value that indicates whether to send an event to the Amazon EventBridge
  event bus after the SQL statement runs.
"""
function execute_statement(Database, Sql; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "ExecuteStatement",
        Dict{String,Any}("Database" => Database, "Sql" => Sql);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function execute_statement(
    Database,
    Sql,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return redshift_data(
        "ExecuteStatement",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Database" => Database, "Sql" => Sql), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_statement_result(id)
    get_statement_result(id, params::Dict{String,<:Any})

Fetches the temporarily cached result of an SQL statement. A token is returned to page
through the statement results.

# Arguments
- `id`: The identifier of the SQL statement whose results are to be fetched. This value is
  a universally unique identifier (UUID) generated by Amazon Redshift Data API. A suffix
  indicates then number of the SQL statement. For example,
  d9b6c0c9-0747-4bf4-b142-e8883122f766:2 has a suffix of :2 that indicates the second SQL
  statement of a batch query. This identifier is returned by BatchExecuteStatment,
  ExecuteStatment, and ListStatements.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"NextToken"`: A value that indicates the starting point for the next set of response
  records in a subsequent request. If a value is returned in a response, you can retrieve the
  next set of records by providing this returned NextToken value in the next NextToken
  parameter and retrying the command. If the NextToken field is empty, all response records
  have been retrieved for the request.
"""
function get_statement_result(Id; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "GetStatementResult",
        Dict{String,Any}("Id" => Id);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_statement_result(
    Id, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return redshift_data(
        "GetStatementResult",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Id" => Id), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_databases(database)
    list_databases(database, params::Dict{String,<:Any})

List the databases in a cluster. A token is returned to page through the database list.
Depending on the authorization method, use one of the following combinations of request
parameters:    Secrets Manager - when connecting to a cluster, specify the Amazon Resource
Name (ARN) of the secret, the database name, and the cluster identifier that matches the
cluster in the secret. When connecting to a serverless endpoint, specify the Amazon
Resource Name (ARN) of the secret and the database name.    Temporary credentials - when
connecting to a cluster, specify the cluster identifier, the database name, and the
database user name. Also, permission to call the redshift:GetClusterCredentials operation
is required. When connecting to a serverless endpoint, specify the database name.

# Arguments
- `database`: The name of the database. This parameter is required when authenticating
  using either Secrets Manager or temporary credentials.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClusterIdentifier"`: The cluster identifier. This parameter is required when connecting
  to a cluster and authenticating using either Secrets Manager or temporary credentials.
- `"DbUser"`: The database user name. This parameter is required when connecting to a
  cluster and authenticating using temporary credentials.
- `"MaxResults"`: The maximum number of databases to return in the response. If more
  databases exist than fit in one response, then NextToken is returned to page through the
  results.
- `"NextToken"`: A value that indicates the starting point for the next set of response
  records in a subsequent request. If a value is returned in a response, you can retrieve the
  next set of records by providing this returned NextToken value in the next NextToken
  parameter and retrying the command. If the NextToken field is empty, all response records
  have been retrieved for the request.
- `"SecretArn"`: The name or ARN of the secret that enables access to the database. This
  parameter is required when authenticating using Secrets Manager.
"""
function list_databases(Database; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "ListDatabases",
        Dict{String,Any}("Database" => Database);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_databases(
    Database,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return redshift_data(
        "ListDatabases",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Database" => Database), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_schemas(database)
    list_schemas(database, params::Dict{String,<:Any})

Lists the schemas in a database. A token is returned to page through the schema list.
Depending on the authorization method, use one of the following combinations of request
parameters:    Secrets Manager - when connecting to a cluster, specify the Amazon Resource
Name (ARN) of the secret, the database name, and the cluster identifier that matches the
cluster in the secret. When connecting to a serverless endpoint, specify the Amazon
Resource Name (ARN) of the secret and the database name.    Temporary credentials - when
connecting to a cluster, specify the cluster identifier, the database name, and the
database user name. Also, permission to call the redshift:GetClusterCredentials operation
is required. When connecting to a serverless endpoint, specify the database name.

# Arguments
- `database`: The name of the database that contains the schemas to list. If
  ConnectedDatabase is not specified, this is also the database to connect to with your
  authentication credentials.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClusterIdentifier"`: The cluster identifier. This parameter is required when connecting
  to a cluster and authenticating using either Secrets Manager or temporary credentials.
- `"ConnectedDatabase"`: A database name. The connected database is specified when you
  connect with your authentication credentials.
- `"DbUser"`: The database user name. This parameter is required when connecting to a
  cluster and authenticating using temporary credentials.
- `"MaxResults"`: The maximum number of schemas to return in the response. If more schemas
  exist than fit in one response, then NextToken is returned to page through the results.
- `"NextToken"`: A value that indicates the starting point for the next set of response
  records in a subsequent request. If a value is returned in a response, you can retrieve the
  next set of records by providing this returned NextToken value in the next NextToken
  parameter and retrying the command. If the NextToken field is empty, all response records
  have been retrieved for the request.
- `"SchemaPattern"`: A pattern to filter results by schema name. Within a schema pattern,
  \"%\" means match any substring of 0 or more characters and \"_\" means match any one
  character. Only schema name entries matching the search pattern are returned.
- `"SecretArn"`: The name or ARN of the secret that enables access to the database. This
  parameter is required when authenticating using Secrets Manager.
"""
function list_schemas(Database; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "ListSchemas",
        Dict{String,Any}("Database" => Database);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_schemas(
    Database,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return redshift_data(
        "ListSchemas",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Database" => Database), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_statements()
    list_statements(params::Dict{String,<:Any})

List of SQL statements. By default, only finished statements are shown. A token is returned
to page through the statement list.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of SQL statements to return in the response. If more
  SQL statements exist than fit in one response, then NextToken is returned to page through
  the results.
- `"NextToken"`: A value that indicates the starting point for the next set of response
  records in a subsequent request. If a value is returned in a response, you can retrieve the
  next set of records by providing this returned NextToken value in the next NextToken
  parameter and retrying the command. If the NextToken field is empty, all response records
  have been retrieved for the request.
- `"RoleLevel"`: A value that filters which statements to return in the response. If true,
  all statements run by the caller's IAM role are returned. If false, only statements run by
  the caller's IAM role in the current IAM session are returned. The default is true.
- `"StatementName"`: The name of the SQL statement specified as input to
  BatchExecuteStatement or ExecuteStatement to identify the query. You can list multiple
  statements by providing a prefix that matches the beginning of the statement name. For
  example, to list myStatement1, myStatement2, myStatement3, and so on, then provide the a
  value of myStatement. Data API does a case-sensitive match of SQL statement names to the
  prefix value you provide.
- `"Status"`: The status of the SQL statement to list. Status values are defined as
  follows:    ABORTED - The query run was stopped by the user.    ALL - A status value that
  includes all query statuses. This value can be used to filter results.    FAILED - The
  query run failed.    FINISHED - The query has finished running.    PICKED - The query has
  been chosen to be run.    STARTED - The query run has started.    SUBMITTED - The query was
  submitted, but not yet processed.
"""
function list_statements(; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "ListStatements"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_statements(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return redshift_data(
        "ListStatements", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tables(database)
    list_tables(database, params::Dict{String,<:Any})

List the tables in a database. If neither SchemaPattern nor TablePattern are specified,
then all tables in the database are returned. A token is returned to page through the table
list. Depending on the authorization method, use one of the following combinations of
request parameters:    Secrets Manager - when connecting to a cluster, specify the Amazon
Resource Name (ARN) of the secret, the database name, and the cluster identifier that
matches the cluster in the secret. When connecting to a serverless endpoint, specify the
Amazon Resource Name (ARN) of the secret and the database name.    Temporary credentials -
when connecting to a cluster, specify the cluster identifier, the database name, and the
database user name. Also, permission to call the redshift:GetClusterCredentials operation
is required. When connecting to a serverless endpoint, specify the database name.

# Arguments
- `database`: The name of the database that contains the tables to list. If
  ConnectedDatabase is not specified, this is also the database to connect to with your
  authentication credentials.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ClusterIdentifier"`: The cluster identifier. This parameter is required when connecting
  to a cluster and authenticating using either Secrets Manager or temporary credentials.
- `"ConnectedDatabase"`: A database name. The connected database is specified when you
  connect with your authentication credentials.
- `"DbUser"`: The database user name. This parameter is required when connecting to a
  cluster and authenticating using temporary credentials.
- `"MaxResults"`: The maximum number of tables to return in the response. If more tables
  exist than fit in one response, then NextToken is returned to page through the results.
- `"NextToken"`: A value that indicates the starting point for the next set of response
  records in a subsequent request. If a value is returned in a response, you can retrieve the
  next set of records by providing this returned NextToken value in the next NextToken
  parameter and retrying the command. If the NextToken field is empty, all response records
  have been retrieved for the request.
- `"SchemaPattern"`: A pattern to filter results by schema name. Within a schema pattern,
  \"%\" means match any substring of 0 or more characters and \"_\" means match any one
  character. Only schema name entries matching the search pattern are returned. If
  SchemaPattern is not specified, then all tables that match TablePattern are returned. If
  neither SchemaPattern or TablePattern are specified, then all tables are returned.
- `"SecretArn"`: The name or ARN of the secret that enables access to the database. This
  parameter is required when authenticating using Secrets Manager.
- `"TablePattern"`: A pattern to filter results by table name. Within a table pattern,
  \"%\" means match any substring of 0 or more characters and \"_\" means match any one
  character. Only table name entries matching the search pattern are returned. If
  TablePattern is not specified, then all tables that match SchemaPatternare returned. If
  neither SchemaPattern or TablePattern are specified, then all tables are returned.
"""
function list_tables(Database; aws_config::AbstractAWSConfig=global_aws_config())
    return redshift_data(
        "ListTables",
        Dict{String,Any}("Database" => Database);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tables(
    Database,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return redshift_data(
        "ListTables",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("Database" => Database), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
