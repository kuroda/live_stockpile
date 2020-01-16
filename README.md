# Live Stockpile - a Phoenix LiveView demo

## Setting up the demo

```
$ git clone git@github.com:kuroda/live_stockpile.git
$ cd live_stockpile
$ pushd cd apps/stockpile_web/assets
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
> Node.connect(:stack@dummy)
> Node.list()
[:stack@dummy, :web@dummy]
```

Replace `dummy` with your real hostname.
