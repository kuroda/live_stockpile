# Live Stockpile - a Phoenix LiveView demo

## Setting up the demo

```
$ git clone git@github.com:kuroda/live_stockpile.git
$ cd live_stockpile
$ pushd cd apps/stockpile_web
$ mix deps.get
$ cd assets
$ npm i
$ popd
```

## Starting the stack server

```
$ bin/start_stack.sh
```

## Starting the web server

```
$ bin/start_web.sh
```

You can play with this demo by opening http://localhost:4000 with you browser.

## Starting the IEx

```
$ hostname
dummy
$ bin/console.sh
iex(console@dummy)1> Node.connect(:stack@dummy)
true
iex(console@dummy)2> Node.list()
[:stack@dummy, :web@dummy]
```

Replace `dummy` with your real hostname.

## Adding an item to the stack

```
iex(console@dummy)3> pid = :global.whereis_name(:stack_server)
#PID<11060.140.0>
iex(console@dummy)4> GenServer.call(pid, {:push, "foo"})
:ok
iex(console@dummy)5> GenServer.call(pid, {:push, "bar"})
:ok
```

## Removing an item from the stack

```
iex(console@dummy)6> GenServer.call(pid, :pop)
"bar"
iex(console@dummy)7> GenServer.call(pid, :pop)
"foo"
```
