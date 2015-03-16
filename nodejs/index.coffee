cluster = require('cluster')
http = require('http')
numCPUs = require('os').cpus().length
WebSocketServer = require('ws').Server

class Controller
  constructor: ->
    wss = new WebSocketServer port: 8080

    wss.on 'connection', (ws) ->
      setTimeout 8.0/1000, @onConnection # Simulate an auth SQL query

  onConnection: =>
    ws.on 'message', @onMessage

  onMessage: (message) =>
    # No-Op (auth can be sent in connection)

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
