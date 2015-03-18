#!/usr/bin/env ruby

def environment
  ARGV[1] || "development"
end

def dev
  environment == "development"
end

def thor(opts)
  cmd =  "./node_modules/thor/bin/thor"
  options = [
    "ws://127.0.0.1:#{opts[:port]}/ws",
    "--generator", "./generator.js",
    "--amount", (dev ? "10" : "10000"),
    "-C", (dev ? "10" : "1000"),
    "--messages", "10",
    "--masked"
  ]
  Process.exec cmd, *options
end

case ARGV[0]
when "elixir"
  thor(
    port: dev ? 4000 : 80
  )
when "nodejs"
  thor(
    port: dev ? 8080 : 80
  )
when "rails"
  raise "TODO: Rails benchmark"
else
  puts "Useage: ./benchmark.rb [elixir|nodejs|rails]"
end
