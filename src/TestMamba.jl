module TestMamba
using Scratch
using MicroMamba
using YAML

export mamba_root

const mamba_root = Ref{String}("")

function __init__()
    global mamba_root[] = @get_scratch!("mamba_root")
end

end # module TestMamba
