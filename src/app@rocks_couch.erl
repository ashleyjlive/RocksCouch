%%%-------------------------------------------------------------------
%% @doc rocks_couch public API
%% @end
%%%-------------------------------------------------------------------

-module(app@rocks_couch).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    sup@rocks_couch:start_link().

stop(_State) ->
    ok.

%% internal functions
