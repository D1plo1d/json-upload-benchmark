## Running the Servers

* **Elixir** - `./elixir/index.sh`
* **Rails** - `cd ./rails/rails-benchmark/;RAILS_ENV=production unicorn ./config/unicorn.rb`
* **NodeJS** - `coffee ./nodejs/index.coffee`

## Benchmarking the Servers

`./benchmark.rb [elixir|nodejs|rails] [ENVIRONMENT] [HOST]`
