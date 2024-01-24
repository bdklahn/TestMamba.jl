using Scratch
using YAML
using MicroMamba
using UUIDs
using TOML

@info "installing any micromamba deps"

MicroMamba.STATE.root_dir = get_scratch!(
    UUID(
        TOML.parsefile(
            filter(contains(r"/(Julia)?Project.toml$"), readdir(joinpath(@__DIR__, "../"); join=true))[end]
            )["uuid"]
        ),
    "mamba_root"
)
@info "" MicroMamba.STATE.root_dir

for env_yml in readdir(joinpath(@__DIR__, "mamba_env_ymls"); join=true)
    @info "" env_yml
    env_name = YAML.load_file(env_yml; dicttype=Dict{Symbol,Any})[:name]
    @info "" env_name
    env_dir = joinpath(MicroMamba.STATE.root_dir, "envs", env_name)
    if !isdir(env_dir)
        @info "installing . . ." env_dir
        run(MicroMamba.cmd(`env create --yes --file $env_yml`))
    end
end