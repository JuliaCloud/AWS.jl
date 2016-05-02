module SQS

import URIParser

using Requests
using LightXML
using AWS.AWSEnv
using AWS

include("sqs_typed.jl")


type SQSError
    typ::AbstractString
    code::AbstractString
    msg::AbstractString
    detail::AbstractString
    request_id::Union{AbstractString, Void}
end
export SQSError

sqs_error_str(o::SQSError) = "type: $(o.typ), code: $(o.code), msg : $(o.msg), $(o.request_id)"
export sqs_error_str


type SQSResponse
    http_code::Int
    headers
    body::Union{AbstractString, Void}
    pd::Union{LightXML.XMLElement, Void}
    obj::Any

    SQSResponse() = new(0, Dict{Any, Any}(), "", nothing, nothing)
end
export SQSResponse


function sqs_execute(env_::AWSEnv, action::AbstractString, ep, params_in, use_post)
    # Adjust endpoint.
    env = env_
    if ep != nothing
        env = AWSEnv(env_; ep=ep)
    end

    # Prepare the standard params
    params = copy(params_in)

    push!(params, ("Action", action))
    push!(params, ("AWSAccessKeyId", env.aws_id))
    push!(params, ("Timestamp", get_utc_timestamp()))
    push!(params, ("Version", "2012-11-05"))

    amz_headers, data, signed_querystr = canonicalize_and_sign(env, "sqs", use_post, params)

    complete_url = "https://" * ep_host(env, "sqs") * env.ep_path
    if length(signed_querystr) > 0
        complete_url *= "?" * signed_querystr
    end
    if (env.dbg) || (env.dry_run)
        println("URL:\n$complete_url\n")
    end

	 headers = Dict(
        "User-Agent" => "Requests.jl/0.0.0",
        "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
    )
    for (k,v) in amz_headers
        setindex!(headers, v, k)
    end

    #make the request
    sqsresp = SQSResponse()
    if !(env.dry_run)
        ## ro = HTTPC.RequestOptions(headers = amz_headers, request_timeout = env.timeout)
		## TODO timout value to be passed to Requests !
        if use_post
            ## resp = HTTPC.post(complete_url, data, ro)
			resp = Requests.post(URIParser.parse_url(complete_url), data; headers=headers)
        else
            ## resp = HTTPC.get(complete_url, ro)
			resp = Requests.get(complete_url; headers = headers)
        end

        sqsresp.http_code = resp.status
        sqsresp.headers = resp.headers
        sqsresp.body = bytestring(resp.data)

        if (env.dbg)
            print("HTTPCode: ", sqsresp.http_code, "\nHeaders: ", sqsresp.headers, "\nBody : ", sqsresp.body, "\n")
        end

        if (sqsresp.http_code >= 200) && (sqsresp.http_code <= 299)
             if (search(Base.get(resp.headers, "Content-Type", [""]), "/xml") != 0:-1)
#            if  haskey(resp.headers, "Content-Type") && (resp.headers["Content-Type"] == "application/xml")
                sqsresp.pd = LightXML.root(LightXML.parse_string(bytestring(sqsresp.body)))
            end
        elseif (sqsresp.http_code >= 400) && (sqsresp.http_code <= 599)
            if length(sqsresp.body) > 0
                xom = LightXML.root(LightXML.parse_string(bytestring(sqsresp.body)))
                epd = LightXML.find_element(xom, "Error")
                if epd == nothing
                    error("HTTP error : $(resp.status), $(sqsresp.body)")
                end
                sqsresp.obj = SQSError(LightXML.content(LightXML.find_element(epd, "Type")), LightXML.content(LightXML.find_element(epd, "Code")), LightXML.content(LightXML.find_element(epd, "Message")), LightXML.content(LightXML.find_element(epd, "Detail")), LightXML.content(LightXML.find_element(xom, "RequestId")))
            else
                error("HTTP error : $(resp.http_code)")
            end
        else
            error("HTTP error : $(resp.http_code), $(sqsresp.body)")
        end
    end

    sqsresp
end


"""
get the url of queue
"""
export get_qurl
function get_qurl(env::AWSEnv, qname::AbstractString="spipe-tasks")
    return GetQueueUrl(env; queueName=qname).obj.queueUrl
end

"""
fetch SQS message from queue url
`Inputs:`
env: AWS enviroment
qurl: String, url of queue or queue name
"""
export fetchSQSmessage
function fetchSQSmessage(env::AWSEnv, qurl::AbstractString)
    if !contains(qurl, "https://sqs.")
        # this is not a url, should be a queue name
        qurl = get_qurl(env, qurl)
    end
    resp = ReceiveMessage(env, queueUrl = qurl)
    msg = resp.obj.messageSet[1]
    return msg
end

"""
take SQS message from queue
will delete mssage after fetching
"""
export takeSQSmessage!
function takeSQSmessage!(env::AWSEnv, qurl::AbstractString="")
    if !contains(qurl, "https://sqs.")
        # this is not a url, should be a queue name
        qurl = get_qurl(env, qurl)
    end

    msg = fetchSQSmessage(env, qurl)
    # delete the message in queue
    resp = DeleteMessage(env, queueUrl=qurl, receiptHandle=msg.receiptHandle)
    # resp = DeleteMessage(env, msg)
    if resp.http_code < 299
        println("message deleted")
    else
        println("message taking failed!")
    end
    return msg
end


"""
put a task to SQS queue
"""
export sendSQSmessage
function sendSQSmessage(env::AWSEnv, qurl::AbstractString, msg::AbstractString)
    if !contains(qurl, "https://sqs.")
        qurl = get_qurl(env, qurl)
    end
    resp = SendMessage(env; queueUrl=qurl, delaySeconds=0, messageBody=msg)
end


end
