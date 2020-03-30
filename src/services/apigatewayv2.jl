include("../AWSServices.jl")
using .AWSServices: apigatewayv2

"""
    CreateStage()

Creates a Stage for an API.

Required Parameters
{
  "StageName": "The name of the stage.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "AccessLogSettings": "Settings for logging access in this stage.",
  "ClientCertificateId": "The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.",
  "RouteSettings": "Route settings for the stage, by routeKey.",
  "Tags": "The collection of tags. Each tag element is associated with a given resource.",
  "Description": "The description for the API stage.",
  "DeploymentId": "The deployment identifier of the API stage.",
  "DefaultRouteSettings": "The default route settings for the stage.",
  "StageVariables": "A map that defines the stage variables for a Stage. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.",
  "AutoDeploy": "Specifies whether updates to an API automatically trigger a new deployment. The default value is false."
}
"""
CreateStage(args) = apigatewayv2("POST", "/v2/apis/{apiId}/stages", args)

"""
    DeleteStage()

Deletes a Stage.

Required Parameters
{
  "StageName": "The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.",
  "ApiId": "The API identifier."
}
"""
DeleteStage(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/stages/{stageName}", args)

"""
    CreateApi()

Creates an Api resource.

Required Parameters
{
  "ProtocolType": "The API protocol.",
  "Name": "The name of the API."
}

Optional Parameters
{
  "RouteKey": "This property is part of quick create. If you don't specify a routeKey, a default route of  default is created. The  default route acts as a catch-all for any request made to your API, for a particular stage. The  default route key can't be modified. You can add routes after creating the API, and you can update the route keys of additional routes. Supported only for HTTP APIs.",
  "Description": "The description of the API.",
  "Tags": "The collection of tags. Each tag element is associated with a given resource.",
  "RouteSelectionExpression": "The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be  {request.method}  {request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.",
  "ApiKeySelectionExpression": "An API key selection expression. Supported only for WebSocket APIs. See API Key Selection Expressions.",
  "Version": "A version identifier for the API.",
  "CorsConfiguration": "A CORS configuration. Supported only for HTTP APIs. See Configuring CORS for more information.",
  "CredentialsArn": "This property is part of quick create. It specifies the credentials required for the integration, if any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null. Currently, this property is not used for HTTP integrations. Supported only for HTTP APIs.",
  "DisableSchemaValidation": "Avoid validating models when creating a deployment. Supported only for WebSocket APIs.",
  "Target": "This property is part of quick create. Quick create produces an API with an integration, a default catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Supported only for HTTP APIs."
}
"""
CreateApi(args) = apigatewayv2("POST", "/v2/apis", args)

"""
    UpdateVpcLink()

Updates a VPC link.

Required Parameters
{
  "VpcLinkId": "The ID of the VPC link."
}

Optional Parameters
{
  "Name": "The name of the VPC link."
}
"""
UpdateVpcLink(args) = apigatewayv2("PATCH", "/v2/vpclinks/{vpcLinkId}", args)

"""
    CreateDomainName()

Creates a domain name.

Required Parameters
{
  "DomainName": "The domain name."
}

Optional Parameters
{
  "Tags": "The collection of tags associated with a domain name.",
  "DomainNameConfigurations": "The domain name configurations."
}
"""
CreateDomainName(args) = apigatewayv2("POST", "/v2/domainnames", args)

"""
    GetModel()

Gets a Model.

Required Parameters
{
  "ModelId": "The model ID.",
  "ApiId": "The API identifier."
}
"""
GetModel(args) = apigatewayv2("GET", "/v2/apis/{apiId}/models/{modelId}", args)

"""
    CreateVpcLink()

Creates a VPC link.

Required Parameters
{
  "SubnetIds": "A list of subnet IDs to include in the VPC link.",
  "Name": "The name of the VPC link."
}

Optional Parameters
{
  "SecurityGroupIds": "A list of security group IDs for the VPC link.",
  "Tags": "A list of tags."
}
"""
CreateVpcLink(args) = apigatewayv2("POST", "/v2/vpclinks", args)

"""
    GetStage()

Gets a Stage.

Required Parameters
{
  "StageName": "The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.",
  "ApiId": "The API identifier."
}
"""
GetStage(args) = apigatewayv2("GET", "/v2/apis/{apiId}/stages/{stageName}", args)

"""
    TagResource()

Creates a new Tag resource to represent a tag.

Required Parameters
{
  "ResourceArn": "The resource ARN for the tag."
}

Optional Parameters
{
  "Tags": "The collection of tags. Each tag element is associated with a given resource."
}
"""
TagResource(args) = apigatewayv2("POST", "/v2/tags/{resource-arn}", args)

"""
    UpdateDomainName()

Updates a domain name.

Required Parameters
{
  "DomainName": "The domain name."
}

Optional Parameters
{
  "DomainNameConfigurations": "The domain name configurations."
}
"""
UpdateDomainName(args) = apigatewayv2("PATCH", "/v2/domainnames/{domainName}", args)

"""
    GetAuthorizer()

Gets an Authorizer.

Required Parameters
{
  "AuthorizerId": "The authorizer identifier.",
  "ApiId": "The API identifier."
}
"""
GetAuthorizer(args) = apigatewayv2("GET", "/v2/apis/{apiId}/authorizers/{authorizerId}", args)

"""
    GetModels()

Gets the Models for an API.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetModels(args) = apigatewayv2("GET", "/v2/apis/{apiId}/models", args)

"""
    DeleteIntegrationResponse()

Deletes an IntegrationResponses.

Required Parameters
{
  "IntegrationResponseId": "The integration response ID.",
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}
"""
DeleteIntegrationResponse(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}", args)

"""
    UpdateAuthorizer()

Updates an Authorizer.

Required Parameters
{
  "AuthorizerId": "The authorizer identifier.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "IdentitySource": "The identity source for which authorization is requested. For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function. For JWT, a single entry that specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only header-based and query parameter-based selections are supported, for example \" request.header.Authorization\".",
  "AuthorizerUri": "The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations. In general, the URI has this form: arn:aws:apigateway:{region}:lambda:path/{service_api}\n               , where {region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.",
  "AuthorizerType": "The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.",
  "IdentityValidationExpression": "This parameter is not used.",
  "AuthorizerResultTtlInSeconds": "Authorizer caching is not currently supported. Don't specify this value for authorizers.",
  "Name": "The name of the authorizer.",
  "AuthorizerCredentialsArn": "Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null.",
  "JwtConfiguration": "Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs."
}
"""
UpdateAuthorizer(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/authorizers/{authorizerId}", args)

"""
    CreateRoute()

Creates a Route for an API.

Required Parameters
{
  "RouteKey": "The route key for the route.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "RequestModels": "The request models for the route. Supported only for WebSocket APIs.",
  "AuthorizationScopes": "The authorization scopes supported by this route.",
  "ModelSelectionExpression": "The model selection expression for the route. Supported only for WebSocket APIs.",
  "AuthorizerId": "The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.",
  "RouteResponseSelectionExpression": "The route response selection expression for the route. Supported only for WebSocket APIs.",
  "RequestParameters": "The request parameters for the route. Supported only for WebSocket APIs.",
  "ApiKeyRequired": "Specifies whether an API key is required for the route. Supported only for WebSocket APIs.",
  "AuthorizationType": "The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.",
  "OperationName": "The operation name for the route.",
  "Target": "The target for the route."
}
"""
CreateRoute(args) = apigatewayv2("POST", "/v2/apis/{apiId}/routes", args)

"""
    CreateIntegration()

Creates an Integration.

Required Parameters
{
  "IntegrationType": "The integration type of an integration. One of the following: AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs. AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration. HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs. HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration. For HTTP API private integrations, use an HTTP_PROXY integration. MOCK: for integrating the route or method request with API Gateway as a \"loopback\" endpoint without invoking any backend. Supported only for WebSocket APIs.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "ConnectionType": "The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.",
  "IntegrationUri": "For a Lambda integration, specify the URI of a Lambda function. For an HTTP integration, specify a fully-qualified URL. For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see DiscoverInstances. For private integrations, all resources must be owned by the same AWS account.",
  "CredentialsArn": "Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.",
  "TlsConfig": "The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.",
  "ContentHandlingStrategy": "Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string. If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.",
  "TemplateSelectionExpression": "The template selection expression for the integration.",
  "PayloadFormatVersion": "Specifies the format of the payload sent to an integration. Required for HTTP APIs.",
  "ConnectionId": "The ID of the VPC link for a private integration. Supported only for HTTP APIs.",
  "PassthroughBehavior": "Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs. WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation. NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response. WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.",
  "RequestParameters": "A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.{location}.{name}\n               , where \n                  {location}\n                is querystring, path, or header; and \n                  {name}\n                must be a valid and unique method request parameter name. Supported only for WebSocket APIs.",
  "IntegrationMethod": "Specifies the integration's HTTP method type.",
  "Description": "The description of the integration.",
  "RequestTemplates": "Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.",
  "TimeoutInMillis": "Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs."
}
"""
CreateIntegration(args) = apigatewayv2("POST", "/v2/apis/{apiId}/integrations", args)

"""
    DeleteRouteSettings()

Deletes the RouteSettings for a stage.

Required Parameters
{
  "RouteKey": "The route key.",
  "StageName": "The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.",
  "ApiId": "The API identifier."
}
"""
DeleteRouteSettings(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/stages/{stageName}/routesettings/{routeKey}", args)

"""
    GetIntegrations()

Gets the Integrations for an API.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetIntegrations(args) = apigatewayv2("GET", "/v2/apis/{apiId}/integrations", args)

"""
    GetRoutes()

Gets the Routes for an API.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetRoutes(args) = apigatewayv2("GET", "/v2/apis/{apiId}/routes", args)

"""
    UpdateApiMapping()

The API mapping.

Required Parameters
{
  "DomainName": "The domain name.",
  "ApiMappingId": "The API mapping identifier.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "Stage": "The API stage.",
  "ApiMappingKey": "The API mapping key."
}
"""
UpdateApiMapping(args) = apigatewayv2("PATCH", "/v2/domainnames/{domainName}/apimappings/{apiMappingId}", args)

"""
    GetDeployment()

Gets a Deployment.

Required Parameters
{
  "DeploymentId": "The deployment ID.",
  "ApiId": "The API identifier."
}
"""
GetDeployment(args) = apigatewayv2("GET", "/v2/apis/{apiId}/deployments/{deploymentId}", args)

"""
    CreateDeployment()

Creates a Deployment for an API.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "Description": "The description for the deployment resource.",
  "StageName": "The name of the Stage resource for the Deployment resource to create."
}
"""
CreateDeployment(args) = apigatewayv2("POST", "/v2/apis/{apiId}/deployments", args)

"""
    DeleteApiMapping()

Deletes an API mapping.

Required Parameters
{
  "DomainName": "The domain name.",
  "ApiMappingId": "The API mapping identifier."
}
"""
DeleteApiMapping(args) = apigatewayv2("DELETE", "/v2/domainnames/{domainName}/apimappings/{apiMappingId}", args)

"""
    GetAuthorizers()

Gets the Authorizers for an API.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetAuthorizers(args) = apigatewayv2("GET", "/v2/apis/{apiId}/authorizers", args)

"""
    DeleteDomainName()

Deletes a domain name.

Required Parameters
{
  "DomainName": "The domain name."
}
"""
DeleteDomainName(args) = apigatewayv2("DELETE", "/v2/domainnames/{domainName}", args)

"""
    GetDomainNames()

Gets the domain names for an AWS account.

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetDomainNames() = apigatewayv2("GET", "/v2/domainnames")
GetDomainNames(args) = apigatewayv2("GET", "/v2/domainnames", args)

"""
    UntagResource()

Deletes a Tag.

Required Parameters
{
  "ResourceArn": "The resource ARN for the tag.",
  "TagKeys": "The Tag keys to delete"
}
"""
UntagResource(args) = apigatewayv2("DELETE", "/v2/tags/{resource-arn}", args)

"""
    DeleteVpcLink()

Deletes a VPC link.

Required Parameters
{
  "VpcLinkId": "The ID of the VPC link."
}
"""
DeleteVpcLink(args) = apigatewayv2("DELETE", "/v2/vpclinks/{vpcLinkId}", args)

"""
    CreateModel()

Creates a Model for an API.

Required Parameters
{
  "Schema": "The schema for the model. For application/json models, this should be JSON schema draft 4 model.",
  "ApiId": "The API identifier.",
  "Name": "The name of the model. Must be alphanumeric."
}

Optional Parameters
{
  "Description": "The description of the model.",
  "ContentType": "The content-type for the model, for example, \"application/json\"."
}
"""
CreateModel(args) = apigatewayv2("POST", "/v2/apis/{apiId}/models", args)

"""
    DeleteRouteResponse()

Deletes a RouteResponse.

Required Parameters
{
  "RouteResponseId": "The route response ID.",
  "RouteId": "The route ID.",
  "ApiId": "The API identifier."
}
"""
DeleteRouteResponse(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}", args)

"""
    UpdateStage()

Updates a Stage.

Required Parameters
{
  "StageName": "The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "AccessLogSettings": "Settings for logging access in this stage.",
  "ClientCertificateId": "The identifier of a client certificate for a Stage.",
  "Description": "The description for the API stage.",
  "RouteSettings": "Route settings for the stage.",
  "DeploymentId": "The deployment identifier for the API stage. Can't be updated if autoDeploy is enabled.",
  "DefaultRouteSettings": "The default route settings for the stage.",
  "StageVariables": "A map that defines the stage variables for a Stage. Variable names can have alphanumeric and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.",
  "AutoDeploy": "Specifies whether updates to an API automatically trigger a new deployment. The default value is false."
}
"""
UpdateStage(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/stages/{stageName}", args)

"""
    GetVpcLink()

Gets a VPC link.

Required Parameters
{
  "VpcLinkId": "The ID of the VPC link."
}
"""
GetVpcLink(args) = apigatewayv2("GET", "/v2/vpclinks/{vpcLinkId}", args)

"""
    UpdateApi()

Updates an Api resource.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "RouteKey": "This property is part of quick create. If not specified, the route created using quick create is kept. Otherwise, this value replaces the route key of the quick create route. Additional routes may still be added after the API is updated. Supported only for HTTP APIs.",
  "Target": "This property is part of quick create. For HTTP integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. The value provided updates the integration URI and integration type. You can update a quick-created target, but you can't remove it from an API. Supported only for HTTP APIs.",
  "Description": "The description of the API.",
  "RouteSelectionExpression": "The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be  {request.method}  {request.path}. If not provided, this will be the default for HTTP APIs. This property is required for WebSocket APIs.",
  "ApiKeySelectionExpression": "An API key selection expression. Supported only for WebSocket APIs. See API Key Selection Expressions.",
  "Version": "A version identifier for the API.",
  "CorsConfiguration": "A CORS configuration. Supported only for HTTP APIs.",
  "CredentialsArn": "This property is part of quick create. It specifies the credentials required for the integration, if any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null. Currently, this property is not used for HTTP integrations. If provided, this value replaces the credentials associated with the quick create integration. Supported only for HTTP APIs.",
  "DisableSchemaValidation": "Avoid validating models when creating a deployment. Supported only for WebSocket APIs.",
  "Name": "The name of the API."
}
"""
UpdateApi(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}", args)

"""
    UpdateRouteResponse()

Updates a RouteResponse.

Required Parameters
{
  "RouteResponseId": "The route response ID.",
  "RouteId": "The route ID.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "ModelSelectionExpression": "The model selection expression for the route response. Supported only for WebSocket APIs.",
  "ResponseParameters": "The route response parameters.",
  "RouteResponseKey": "The route response key.",
  "ResponseModels": "The response models for the route response."
}
"""
UpdateRouteResponse(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}", args)

"""
    GetVpcLinks()

Gets a collection of VPC links.

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetVpcLinks() = apigatewayv2("GET", "/v2/vpclinks")
GetVpcLinks(args) = apigatewayv2("GET", "/v2/vpclinks", args)

"""
    UpdateIntegrationResponse()

Updates an IntegrationResponses.

Required Parameters
{
  "IntegrationResponseId": "The integration response ID.",
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}

Optional Parameters
{
  "IntegrationResponseKey": "The integration response key.",
  "ContentHandlingStrategy": "Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string. If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.",
  "TemplateSelectionExpression": "The template selection expression for the integration response. Supported only for WebSocket APIs.",
  "ResponseTemplates": "The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.",
  "ResponseParameters": "A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}\n               , where name is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name}\n                or integration.response.body.{JSON-expression}\n               , where \n                  {name}\n                is a valid and unique response header name and \n                  {JSON-expression}\n                is a valid JSON expression without the   prefix."
}
"""
UpdateIntegrationResponse(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}", args)

"""
    DeleteDeployment()

Deletes a Deployment.

Required Parameters
{
  "DeploymentId": "The deployment ID.",
  "ApiId": "The API identifier."
}
"""
DeleteDeployment(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/deployments/{deploymentId}", args)

"""
    ImportApi()

Imports an API.

Required Parameters
{
  "Body": "The OpenAPI definition. Supported only for HTTP APIs."
}

Optional Parameters
{
  "Basepath": "Specifies how to interpret the base path of the API during import. Valid values are ignore, prepend, and split. The default value is ignore. To learn more, see Set the OpenAPI basePath Property. Supported only for HTTP APIs.",
  "FailOnWarnings": "Specifies whether to rollback the API creation (true) or not (false) when a warning is encountered. The default value is false."
}
"""
ImportApi(args) = apigatewayv2("PUT", "/v2/apis", args)

"""
    GetApiMapping()

Gets an API mapping.

Required Parameters
{
  "DomainName": "The domain name.",
  "ApiMappingId": "The API mapping identifier."
}
"""
GetApiMapping(args) = apigatewayv2("GET", "/v2/domainnames/{domainName}/apimappings/{apiMappingId}", args)

"""
    GetDeployments()

Gets the Deployments for an API.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetDeployments(args) = apigatewayv2("GET", "/v2/apis/{apiId}/deployments", args)

"""
    GetIntegrationResponse()

Gets an IntegrationResponses.

Required Parameters
{
  "IntegrationResponseId": "The integration response ID.",
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}
"""
GetIntegrationResponse(args) = apigatewayv2("GET", "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses/{integrationResponseId}", args)

"""
    GetRouteResponses()

Gets the RouteResponses for a Route.

Required Parameters
{
  "RouteId": "The route ID.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetRouteResponses(args) = apigatewayv2("GET", "/v2/apis/{apiId}/routes/{routeId}/routeresponses", args)

"""
    GetTags()

Gets a collection of Tag resources.

Required Parameters
{
  "ResourceArn": "The resource ARN for the tag."
}
"""
GetTags(args) = apigatewayv2("GET", "/v2/tags/{resource-arn}", args)

"""
    GetIntegration()

Gets an Integration.

Required Parameters
{
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}
"""
GetIntegration(args) = apigatewayv2("GET", "/v2/apis/{apiId}/integrations/{integrationId}", args)

"""
    GetApi()

Gets an Api resource.

Required Parameters
{
  "ApiId": "The API identifier."
}
"""
GetApi(args) = apigatewayv2("GET", "/v2/apis/{apiId}", args)

"""
    GetStages()

Gets the Stages for an API.

Required Parameters
{
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetStages(args) = apigatewayv2("GET", "/v2/apis/{apiId}/stages", args)

"""
    CreateAuthorizer()

Creates an Authorizer for an API.

Required Parameters
{
  "IdentitySource": "The identity source for which authorization is requested. For a REQUEST authorizer, this is optional. The value is a set of one or more mapping expressions of the specified request parameters. Currently, the identity source can be headers, query string parameters, stage variables, and context parameters. For example, if an Auth header and a Name query string parameter are defined as identity sources, this value is route.request.header.Auth, route.request.querystring.Name. These parameters will be used to perform runtime validation for Lambda-based authorizers by verifying all of the identity-related request parameters are present in the request, not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function. For JWT, a single entry that specifies where to extract the JSON Web Token (JWT )from inbound requests. Currently only header-based and query parameter-based selections are supported, for example \" request.header.Authorization\".",
  "AuthorizerType": "The authorizer type. For WebSocket APIs, specify REQUEST for a Lambda function using incoming request parameters. For HTTP APIs, specify JWT to use JSON Web Tokens.",
  "ApiId": "The API identifier.",
  "Name": "The name of the authorizer."
}

Optional Parameters
{
  "AuthorizerUri": "The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a well-formed Lambda function URI, for example, arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2:{account_id}:function:{lambda_function_name}/invocations. In general, the URI has this form: arn:aws:apigateway:{region}:lambda:path/{service_api}\n               , where {region} is the same as the region hosting the Lambda function, path indicates that the remaining substring in the URI should be treated as the path to the resource, including the initial /. For Lambda functions, this is usually of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.",
  "IdentityValidationExpression": "This parameter is not used.",
  "JwtConfiguration": "Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported only for HTTP APIs.",
  "AuthorizerResultTtlInSeconds": "Authorizer caching is not currently supported. Don't specify this value for authorizers.",
  "AuthorizerCredentialsArn": "Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use resource-based permissions on the Lambda function, specify null. Supported only for REQUEST authorizers."
}
"""
CreateAuthorizer(args) = apigatewayv2("POST", "/v2/apis/{apiId}/authorizers", args)

"""
    GetApis()

Gets a collection of Api resources.

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetApis() = apigatewayv2("GET", "/v2/apis")
GetApis(args) = apigatewayv2("GET", "/v2/apis", args)

"""
    DeleteRoute()

Deletes a Route.

Required Parameters
{
  "RouteId": "The route ID.",
  "ApiId": "The API identifier."
}
"""
DeleteRoute(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/routes/{routeId}", args)

"""
    CreateRouteResponse()

Creates a RouteResponse for a Route.

Required Parameters
{
  "RouteId": "The route ID.",
  "RouteResponseKey": "The route response key.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "ModelSelectionExpression": "The model selection expression for the route response. Supported only for WebSocket APIs.",
  "ResponseParameters": "The route response parameters.",
  "ResponseModels": "The response models for the route response."
}
"""
CreateRouteResponse(args) = apigatewayv2("POST", "/v2/apis/{apiId}/routes/{routeId}/routeresponses", args)

"""
    DeleteAccessLogSettings()

Deletes the AccessLogSettings for a Stage. To disable access logging for a Stage, delete its AccessLogSettings.

Required Parameters
{
  "StageName": "The stage name. Stage names can only contain alphanumeric characters, hyphens, and underscores. Maximum length is 128 characters.",
  "ApiId": "The API identifier."
}
"""
DeleteAccessLogSettings(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/stages/{stageName}/accesslogsettings", args)

"""
    GetModelTemplate()

Gets a model template.

Required Parameters
{
  "ModelId": "The model ID.",
  "ApiId": "The API identifier."
}
"""
GetModelTemplate(args) = apigatewayv2("GET", "/v2/apis/{apiId}/models/{modelId}/template", args)

"""
    UpdateDeployment()

Updates a Deployment.

Required Parameters
{
  "DeploymentId": "The deployment ID.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "Description": "The description for the deployment resource."
}
"""
UpdateDeployment(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/deployments/{deploymentId}", args)

"""
    UpdateRoute()

Updates a Route.

Required Parameters
{
  "RouteId": "The route ID.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "RouteKey": "The route key for the route.",
  "ModelSelectionExpression": "The model selection expression for the route. Supported only for WebSocket APIs.",
  "RequestModels": "The request models for the route. Supported only for WebSocket APIs.",
  "AuthorizerId": "The identifier of the Authorizer resource to be associated with this route. The authorizer identifier is generated by API Gateway when you created the authorizer.",
  "ApiKeyRequired": "Specifies whether an API key is required for the route. Supported only for WebSocket APIs.",
  "Target": "The target for the route.",
  "RequestParameters": "The request parameters for the route. Supported only for WebSocket APIs.",
  "AuthorizationType": "The authorization type for the route. For WebSocket APIs, valid values are NONE for open access, AWS_IAM for using AWS IAM permissions, and CUSTOM for using a Lambda authorizer For HTTP APIs, valid values are NONE for open access, or JWT for using JSON Web Tokens.",
  "AuthorizationScopes": "The authorization scopes supported by this route.",
  "RouteResponseSelectionExpression": "The route response selection expression for the route. Supported only for WebSocket APIs.",
  "OperationName": "The operation name for the route."
}
"""
UpdateRoute(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/routes/{routeId}", args)

"""
    GetIntegrationResponses()

Gets the IntegrationResponses for an Integration.

Required Parameters
{
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetIntegrationResponses(args) = apigatewayv2("GET", "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses", args)

"""
    GetRouteResponse()

Gets a RouteResponse.

Required Parameters
{
  "RouteResponseId": "The route response ID.",
  "RouteId": "The route ID.",
  "ApiId": "The API identifier."
}
"""
GetRouteResponse(args) = apigatewayv2("GET", "/v2/apis/{apiId}/routes/{routeId}/routeresponses/{routeResponseId}", args)

"""
    GetApiMappings()

Gets API mappings.

Required Parameters
{
  "DomainName": "The domain name."
}

Optional Parameters
{
  "MaxResults": "The maximum number of elements to be returned for this resource.",
  "NextToken": "The next page of elements from this collection. Not valid for the last element of the collection."
}
"""
GetApiMappings(args) = apigatewayv2("GET", "/v2/domainnames/{domainName}/apimappings", args)

"""
    GetRoute()

Gets a Route.

Required Parameters
{
  "RouteId": "The route ID.",
  "ApiId": "The API identifier."
}
"""
GetRoute(args) = apigatewayv2("GET", "/v2/apis/{apiId}/routes/{routeId}", args)

"""
    DeleteRouteRequestParameter()

Deletes a route request parameter.

Required Parameters
{
  "RouteId": "The route ID.",
  "ApiId": "The API identifier.",
  "RequestParameterKey": "The route request parameter key."
}
"""
DeleteRouteRequestParameter(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/routes/{routeId}/requestparameters/{requestParameterKey}", args)

"""
    GetDomainName()

Gets a domain name.

Required Parameters
{
  "DomainName": "The domain name."
}
"""
GetDomainName(args) = apigatewayv2("GET", "/v2/domainnames/{domainName}", args)

"""
    DeleteIntegration()

Deletes an Integration.

Required Parameters
{
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}
"""
DeleteIntegration(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/integrations/{integrationId}", args)

"""
    DeleteModel()

Deletes a Model.

Required Parameters
{
  "ModelId": "The model ID.",
  "ApiId": "The API identifier."
}
"""
DeleteModel(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/models/{modelId}", args)

"""
    CreateApiMapping()

Creates an API mapping.

Required Parameters
{
  "DomainName": "The domain name.",
  "Stage": "The API stage.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "ApiMappingKey": "The API mapping key."
}
"""
CreateApiMapping(args) = apigatewayv2("POST", "/v2/domainnames/{domainName}/apimappings", args)

"""
    UpdateModel()

Updates a Model.

Required Parameters
{
  "ModelId": "The model ID.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "Description": "The description of the model.",
  "Schema": "The schema for the model. For application/json models, this should be JSON schema draft 4 model.",
  "ContentType": "The content-type for the model, for example, \"application/json\".",
  "Name": "The name of the model."
}
"""
UpdateModel(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/models/{modelId}", args)

"""
    DeleteApi()

Deletes an Api resource.

Required Parameters
{
  "ApiId": "The API identifier."
}
"""
DeleteApi(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}", args)

"""
    UpdateIntegration()

Updates an Integration.

Required Parameters
{
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}

Optional Parameters
{
  "ConnectionType": "The type of the network connection to the integration endpoint. Specify INTERNET for connections through the public routable internet or VPC_LINK for private connections between API Gateway and resources in a VPC. The default value is INTERNET.",
  "IntegrationUri": "For a Lambda integration, specify the URI of a Lambda function. For an HTTP integration, specify a fully-qualified URL. For an HTTP API private integration, specify the ARN of an Application Load Balancer listener, Network Load Balancer listener, or AWS Cloud Map service. If you specify the ARN of an AWS Cloud Map service, API Gateway uses DiscoverInstances to identify resources. You can use query parameters to target specific resources. To learn more, see DiscoverInstances. For private integrations, all resources must be owned by the same AWS account.",
  "CredentialsArn": "Specifies the credentials required for the integration, if any. For AWS integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported AWS services, specify null.",
  "TlsConfig": "The TLS configuration for a private integration. If you specify a TLS configuration, private integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.",
  "IntegrationType": "The integration type of an integration. One of the following: AWS: for integrating the route or method request with an AWS service action, including the Lambda function-invoking action. With the Lambda function-invoking action, this is referred to as the Lambda custom integration. With any other AWS service action, this is known as AWS integration. Supported only for WebSocket APIs. AWS_PROXY: for integrating the route or method request with the Lambda function-invoking action with the client request passed through as-is. This integration is also referred to as Lambda proxy integration. HTTP: for integrating the route or method request with an HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only for WebSocket APIs. HTTP_PROXY: for integrating the route or method request with an HTTP endpoint, with the client request passed through as-is. This is also referred to as HTTP proxy integration. For HTTP API private integrations, use an HTTP_PROXY integration. MOCK: for integrating the route or method request with API Gateway as a \"loopback\" endpoint without invoking any backend. Supported only for WebSocket APIs.",
  "ContentHandlingStrategy": "Supported only for WebSocket APIs. Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string. If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.",
  "TemplateSelectionExpression": "The template selection expression for the integration.",
  "PayloadFormatVersion": "Specifies the format of the payload sent to an integration. Required for HTTP APIs.",
  "ConnectionId": "The ID of the VPC link for a private integration. Supported only for HTTP APIs.",
  "PassthroughBehavior": "Specifies the pass-through behavior for incoming requests based on the Content-Type header in the request, and the available mapping templates specified as the requestTemplates property on the Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER. Supported only for WebSocket APIs. WHEN_NO_MATCH passes the request body for unmapped content types through to the integration backend without transformation. NEVER rejects unmapped content types with an HTTP 415 Unsupported Media Type response. WHEN_NO_TEMPLATES allows pass-through when the integration has no content types mapped to templates. However, if there is at least one content type defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type response.",
  "RequestParameters": "A key-value map specifying request parameters that are passed from the method request to the backend. The key is an integration request parameter name and the associated value is a method request parameter value or static value that must be enclosed within single quotes and pre-encoded as required by the backend. The method request parameter value must match the pattern of method.request.{location}.{name}\n               , where \n                  {location}\n                is querystring, path, or header; and \n                  {name}\n                must be a valid and unique method request parameter name. Supported only for WebSocket APIs.",
  "IntegrationMethod": "Specifies the integration's HTTP method type.",
  "Description": "The description of the integration",
  "RequestTemplates": "Represents a map of Velocity templates that are applied on the request payload based on the value of the Content-Type header sent by the client. The content type value is the key in this map, and the template (as a String) is the value. Supported only for WebSocket APIs.",
  "TimeoutInMillis": "Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000 milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for HTTP APIs."
}
"""
UpdateIntegration(args) = apigatewayv2("PATCH", "/v2/apis/{apiId}/integrations/{integrationId}", args)

"""
    CreateIntegrationResponse()

Creates an IntegrationResponses.

Required Parameters
{
  "IntegrationResponseKey": "The integration response key.",
  "ApiId": "The API identifier.",
  "IntegrationId": "The integration ID."
}

Optional Parameters
{
  "ContentHandlingStrategy": "Specifies how to handle response payload content type conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a Base64-encoded string. If this property is not defined, the response payload will be passed through from the integration response to the route response or method response without modification.",
  "TemplateSelectionExpression": "The template selection expression for the integration response. Supported only for WebSocket APIs.",
  "ResponseTemplates": "The collection of response templates for the integration response as a string-to-string map of key-value pairs. Response templates are represented as a key/value map, with a content-type as the key and a template as the value.",
  "ResponseParameters": "A key-value map specifying response parameters that are passed to the method response from the backend. The key is a method response header parameter name and the mapped value is an integration response header value, a static value enclosed within a pair of single quotes, or a JSON expression from the integration response body. The mapping key must match the pattern of method.response.header.{name}, where {name} is a valid and unique header name. The mapped non-static value must match the pattern of integration.response.header.{name} or integration.response.body.{JSON-expression}, where {name} is a valid and unique response header name and {JSON-expression} is a valid JSON expression without the   prefix."
}
"""
CreateIntegrationResponse(args) = apigatewayv2("POST", "/v2/apis/{apiId}/integrations/{integrationId}/integrationresponses", args)

"""
    ReimportApi()

Puts an Api resource.

Required Parameters
{
  "Body": "The OpenAPI definition. Supported only for HTTP APIs.",
  "ApiId": "The API identifier."
}

Optional Parameters
{
  "Basepath": "Specifies how to interpret the base path of the API during import. Valid values are ignore, prepend, and split. The default value is ignore. To learn more, see Set the OpenAPI basePath Property. Supported only for HTTP APIs.",
  "FailOnWarnings": "Specifies whether to rollback the API creation (true) or not (false) when a warning is encountered. The default value is false."
}
"""
ReimportApi(args) = apigatewayv2("PUT", "/v2/apis/{apiId}", args)

"""
    DeleteCorsConfiguration()

Deletes a CORS configuration.

Required Parameters
{
  "ApiId": "The API identifier."
}
"""
DeleteCorsConfiguration(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/cors", args)

"""
    DeleteAuthorizer()

Deletes an Authorizer.

Required Parameters
{
  "AuthorizerId": "The authorizer identifier.",
  "ApiId": "The API identifier."
}
"""
DeleteAuthorizer(args) = apigatewayv2("DELETE", "/v2/apis/{apiId}/authorizers/{authorizerId}", args)
