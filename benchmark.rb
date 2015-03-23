#!/usr/bin/env ruby

def amount
  (dev ? 10 : 100*1000)
end

def concurrency
  (dev ? 10 : 10*1000)
end

def environment
  ARGV[1] || "development"
end

def dev
  environment == "development"
end

def host
  dev ? "127.0.0.1" : ARGV[2]
end

def thor(opts)
  cmd =  "./node_modules/thor/bin/thor"
  options = [
    "ws://#{host}:#{opts[:port]}/ws",
    "--generator", "./generator.js",
    "--amount", (amount/10).to_i.to_s,
    "-C", concurrency.to_s,
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
  Process.exec "ab", *[
    "-p", "./payload.json",
    "-T", "application/json",
    "-c", concurrency.to_s,
    "-n", amount.to_s,
    "http://#{host}:#{dev ? 3000 : 80}/"
  ]
else
  puts "Useage: ./benchmark.rb [elixir|nodejs|rails] [ENVIRONMENT] [HOST]"
end
