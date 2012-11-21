%% hot code loading example
-module(code_loading).

-export([start/0, server/1]).

%% start the registered process
start() ->
     Pid = spawn(code_loading, server, [source]),
     true = register(code_loading, Pid).

%% simple loop for receive requests and
%% send responses
server(State) ->
    receive 
	{request, Msg, Pid} ->
	    %% here the response is from dummy_module:function
	    Pid ! {ok, swap, self(), dummy_module:function(Msg)},
	    code_loading:server(State)
    end.	
