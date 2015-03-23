## Running the Servers

* **Elixir** - `./elixir/index.sh`
* **Rails** - `cd /srv/www/json-upload-benchmark/rails/rails-benchmarking;RAILS_ENV=production unicorn -c ./config/unicorn.rb -D`
* **NodeJS** - `coffee ./nodejs/index.coffee`

## Benchmarking the Servers

`./benchmark.rb [elixir|nodejs|rails] [ENVIRONMENT] [HOST]`
