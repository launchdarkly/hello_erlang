%%%-------------------------------------------------------------------
%% @doc hello_erlang public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_erlang_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    hello_erlang_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.
    