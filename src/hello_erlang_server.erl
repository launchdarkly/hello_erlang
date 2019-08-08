-module(hello_erlang_server).
-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).

-export([start_link/0]).
-export([get/3]).

% public functions

start_link() ->
  gen_server:start_link({local, hello_erlang_server}, ?MODULE, [], []).

get(Key, Fallback, User) -> gen_server:call(?MODULE, {get, Key, Fallback, User}).

% gen_server callbacks

init(_Args) ->
  eld:start_instance("YOUR_SDK_KEY"),
  {ok, []}.

handle_call({get, Key, Fallback, User}, _From, State) ->
  Flag = eld:variation(Key, #{key => User}, Fallback),
  {reply, Flag, State}.

handle_cast(_Request, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
