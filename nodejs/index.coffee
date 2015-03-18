cluster = require('cluster')
http = require('http')
numCPUs = require('os').cpus().length
WebSocketServer = require('ws').Server

class Controller
  constructor: ->
    wss = new WebSocketServer port: 8080

    wss.on 'connection', @onConnection

  onConnection: (ws) =>
    # console.log "authorizing..."
    setTimeout (=> @onAuth ws), 8 # Simulate an auth SQL query

  onAuth: (ws) =>
    # console.log "connected"
    ws.on 'message', (message) => @onMessage ws, message

  onMessage: (ws, message) =>
    message = JSON.parse message
    # console.log "received"
    # console.log message
    ws.send JSON.stringify
      topic: "benchmark:123"
      payload: {code: 200},
      event: "message:accepted"

if cluster.isMaster
  # Fork workers.

  cluster.fork() for i in [0..numCPUs]

  cluster.on 'exit', (worker, code, signal) ->
    console.log('worker ' + worker.process.pid + ' died')
  console.log "Master Started"
else
  # Workers can share any TCP connection
  # In this case its a HTTP server
  new Controller()
  console.log "Worker Started"
