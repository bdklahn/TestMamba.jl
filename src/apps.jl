
function mamba_run(
    cmd::String="python",
    args::Union{String,Vector{String}}="--version";
    env_name::String="py3_11_001"
)
    args_interpol = isa(args, String) ? split(args) : args
    run(MicroMamba.cmd(`run --name $env_name $cmd $args_interpol`))
    print("")
end

function python(
    args::Union{String,Vector{String}}="--version";
    env_name::String="py3_12_001"
)
    mamba_run("python", args; env_name)
end
