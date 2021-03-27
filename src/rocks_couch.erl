-module(rocks_couch).

-include("common.hrl").

-export([start/0,
         start/1,
         stop/0]).

-export([start_args/0,
         start_args/1,
         start_arg/1, 
         start_arg/2]).

start() ->
    start(#{}).

start(Args) ->
    ok = application:set_env(?APP, start_args, Args),
    application:ensure_all_started(?APP).

stop() ->
    application:stop(?APP).

start_args() ->
    start_args([sys_ops]).

start_args(Kys) ->
    Env = application:get_env(?APP, start_args, #{}),
    [start_arg(K, Env) || K <- Kys].

start_arg(K) when is_atom(K) ->
    start_arg(application:get_env(?APP, start_args, #{})).

start_arg(sys_ops, #{sys_ops := Ops}) ->
    Ops;
start_arg(sys_ops, #{}) ->
    [].