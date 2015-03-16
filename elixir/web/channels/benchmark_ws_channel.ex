defmodule PhoenixBenchmark.BenchmarkWsChannel do
  use Phoenix.Channel

  def join(_topic, _message, socket) do
    :timer.sleep(8) # Simulate an auth SQL query
    {:ok, socket}
  end

  def handle_in(event, message, socket) do
    # No op
  end
end