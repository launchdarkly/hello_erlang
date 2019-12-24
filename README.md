# hello_erlang

LaunchDarkly Erlang SDK example application.

## Build

```bash
rebar3 compile
```

## Run

```bash
export LD_SDK_KEY=YOUR_SDK_KEY
rebar3 shell
```

```erlang
hello_erlang_server:get(<<"FLAG_KEY">>, "FALLBACK_VALUE", <<"USER_KEY">>).
```
