
for env_yml in readdir(joinpath(@__DIR__, "mamba_env_ymls"); join=true)
    @info "" env_yml
    env_name = YAML.load_file(env_yml; dicttype=Dict{Symbol,Any})[:name]
    @info "" env_name
    @info "" mamba_root[]

    env_dir = joinpath(mamba_root[], "envs", env_name)
    if !isdir(env_dir)
        @info "installing . . ." env_dir
        run(MicroMamba.cmd(`env create --yes --root-prefix $(mamba_root[]) --file $env_yml`))
    end
end