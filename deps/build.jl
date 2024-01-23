module TestMamba

using Scratch
using YAML
using MicroMamba
using UUIDs
using TOML

"Get mamba_root in parent package scratch space, by it's UUID."
mamba_root = get_scratch!(
    UUID(
        TOML.parsefile(
            filter(contains(r"/(Julia)?Project.toml$"), readdir(joinpath(@__DIR__, "../"); join=true))[end]
            )["uuid"]
        ),
    "mamba_root"
    )
@info "" mamba_root

for env_yml in readdir(joinpath(@__DIR__, "mamba_env_ymls"); join=true)
    @info "" env_yml
    env_name = YAML.load_file(env_yml; dicttype=Dict{Symbol,Any})[:name]
    @info "" env_name
    global mamba_root
    env_dir = joinpath(mamba_root, "envs", env_name)
    if !isdir(env_dir)
        @info "installing . . ." env_dir
        run(MicroMamba.cmd(`env create --yes --root-prefix $mamba_root --file $env_yml`))
    end
end

end # module TestMamba