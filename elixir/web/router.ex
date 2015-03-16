defmodule PhoenixBenchmark.Router do
  use Phoenix.Router

  socket "/ws", PhoenixBenchmark do
    channel "sample_topic:*", BenchmarkWsChannel
  end
end
