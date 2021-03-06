%%%-------------------------------------------------------------------
%% @doc pgsql_pool public API
%% @end
%%%-------------------------------------------------------------------

-module(pgsql_pool_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    Pools = application:get_env(pgsql_pool, pools, []),
    pgsql_pool_sup:start_link(Pools).

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
