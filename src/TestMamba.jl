module TestMamba

using Scratch
using MicroMamba
using YAML

export mamba_run
export python

function __init__()
    global MicroMamba.STATE.root_dir = @get_scratch!("mamba_root")
end

include("apps.jl")

end # module TestMamba
