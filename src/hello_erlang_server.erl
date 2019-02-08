-module(hello_erlang_server).
-behaviour(gen_server).

-export([init/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).

-export([start/0]).

% public functions

start() ->
  gen_server:start({local, hello_erlang_server}, ?MODULE, [], []).

% gen_server callbacks

init(_Args) ->
  {ok, launchdarkly:start_instance("YOUR_SDK_KEY_HERE")}.

handle_call({get, Key, Fallback, User}, _From, State) ->
  Flag = launchdarkly:evaluate(<<Key>>, #{key => <<User>>}, Fallback),
  {reply, Flag, Flag}.

handle_cast(_Request, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
