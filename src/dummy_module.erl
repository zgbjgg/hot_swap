%% dummy module
-module(dummy_module).

-export([function/1]).

%% a dummy function
function(Arg) ->
    %% for the first version, return length 
    %% of the given list
    {ok, length(Arg)}.
    %% for the second version, return the list
    %% {ok, Arg}.
