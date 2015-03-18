defmodule PhoenixBenchmark.Router do
  use Phoenix.Router

  socket "/ws", PhoenixBenchmark do
    channel "benchmark:*", BenchmarkWsChannel
  end
end
