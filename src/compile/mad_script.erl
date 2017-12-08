-module(mad_script).
-copyright('Sina Samavati').
-compile(export_all).

script(ConfigFile, Conf, _) ->
    File = ConfigFile ++ ".script",
    case file:script(File, [{'CONFIG', Conf}, {'SCRIPT', File}]) of
        {ok, {error, Out}} -> exit({error, Out});
        {ok, Out} -> Out;
        {error, enoent} -> Conf;
        {error, Out} -> exit({error, Out})
    end.
