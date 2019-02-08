%%%-------------------------------------------------------------------
%% @doc hello_erlang top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(hello_erlang_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

init([]) ->
    {ok, {{one_for_one, 1, 5},
          [{console,
            {hello_erlang_server, start_link, []},
            permanent, 5000, worker, [hello_erlang_server]}]}}.