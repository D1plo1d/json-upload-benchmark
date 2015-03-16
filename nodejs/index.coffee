cluster = require('cluster')
http = require('http')
numCPUs = require('os').cpus().length
WebSocketServer = require('ws').Server

if cluster.isMaster
  # Fork workers.

  cluster.fork() for i in [0..numCPUs]

  cluster.on 'exit', (worker, code, signal) ->
    console.log('worker ' + worker.process.pid + ' died')
  console.log "Master Started"
else
  # Workers can share any TCP connection
  # In this case its a HTTP server
  wss = new WebSocketServer port: 8080

  wss.on 'connection', (ws) ->
    ws.on 'message', (message) ->
      # No-Op (auth can be sent in connection)

  console.log "Worker Started"
