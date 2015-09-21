
include("ec2_types.jl")
include("ec2_operations.jl")
#include("api.jl")



function is_basic_type(v)
    if  isa(v, AbstractString) || isa(v, Int) || isa(v, Int32) ||
        isa(v, Int64) || isa(v, Float64) || isa(v, Bool) ||
        isa(v, DateTime)

        return true
    end
    return false
end

corrections_map = Dict(
    ("CreateTagsType", "resourcesSet") => "resourceId",
    ("DeleteTagsType", "resourcesSet") => "resourceId",

    ("DescribeVolumesType", "volumeSet") => "volumeId",
    ("DescribeVolumeStatusType", "volumeSet") => "volumeId",

    ("MonitorInstancesType", "instancesSet") => "instanceId",
    ("DescribeInstancesType", "instancesSet") => "instanceId",
    ("DescribeInstanceStatusType", "instancesSet") => "instanceId",
    ("TerminateInstancesType", "instancesSet") => "instanceId",
    ("StopInstancesType", "instancesSet") => "instanceId",
    ("StartInstancesType", "instancesSet") => "instanceId",
    ("ReportInstanceStatusType", "instancesSet") => "instanceId")

function add_to_params(params, obj, pfx)
    for m in fieldnames(typeof(obj))
        fld_val = getfield(obj, m)
        if (fld_val != nothing)
            fld_name = string(m)
            if haskey(corrections_map, (typebasename(obj), fld_name))
                arg_name = corrections_map[(typebasename(obj), fld_name)]
            elseif endswith(fld_name, "Set")
                arg_name = fld_name[1:end-3]
            else
                arg_name = fld_name
            end

            if startswith(arg_name, "_")
                # handle field names that match julia reserved types....
                arg_name =  arg_name[2:end]
            end

            #Captitalize the first letter for the argument.
            arg_name = uppercase(arg_name[1:1]) * arg_name[2:end]

            if is_basic_type(fld_val)
                push!(params, (pfx * arg_name, aws_string(fld_val)))
            elseif isa(fld_val, Array)
                for (idx, fv) in enumerate(fld_val)
                    subarg_name = "$(pfx)$(arg_name).$(idx)"
                    if is_basic_type(fv)
                        push!(params, (subarg_name, aws_string(fv)))
                    else
                        add_to_params(params, fv, subarg_name*".")
                    end
                end
            else
                # compound type
                add_to_params(params, fld_val, "$(pfx)$(arg_name).")
            end
        end
    end
end

function call_ec2(env::AWSEnv, action::AbstractString, msg=nothing)
    params = Array(Tuple, 0)
    if (msg != nothing)
        # make sure it is a valid type
        msg_name = typebasename(msg)
        if !haskey(ValidRqstMsgs, msg_name) error("Invalid message for request: $msg_name") end

        add_to_params(params, msg, "")
    end
    ec2_execute(env, action, params)
end

typebasename(a) = split(string(typeof(a)), ".")[end]
