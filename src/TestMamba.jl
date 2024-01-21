module TestMamba
using Scratch
using MicroMamba
using YAML

export mamba_root

const mamba_root = Ref{String}("")

function __init__()
    global mamba_root[] = @get_scratch!("mamba_root")
    include(joinpath(@__DIR__, "install_mamba_envs.jl"))
end

end # module TestMamba
