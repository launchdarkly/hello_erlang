# hello_erlang

LaunchDarkly Erlang SDK example application.

## Build

```bash
rebar3 compile
```

## Run

You'll need to put your SDK key in `hello_erlang_server.erl` in the `init()` callback.

```bash
rebar3 shell
```

```erlang
hello_erlang_server:get(<<"YOUR_KEY">>, "YOUR_FALLBACK_VALUE", <<"YOUR_USER_KEY">>).
```
