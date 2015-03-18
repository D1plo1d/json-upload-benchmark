defmodule PhoenixBenchmark.BenchmarkWsChannel do
  use Phoenix.Channel

  def join(_topic, message, socket) do
    # IO.puts "WWUUUUUTT"
    # IO.puts message
    :timer.sleep(8) # Simulate an auth SQL query
    reply socket, "join:accepted", %{code: 200}
    {:ok, socket}
  end

  def handle_in(event, message, socket) do
    # IO.puts "MESSAGE!!"
    # IO.inspect message
    reply socket, "message:accepted", %{code: 200}
    {:ok, socket}
  end

end