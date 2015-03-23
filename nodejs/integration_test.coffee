WebSocket = require('ws')
ws = new WebSocket('ws://127.0.0.1/ws')

ws.on 'open', ->
  console.log "authenticating"
  ws.send JSON.stringify
    topic: "benchmark:123"
    event: "join"
    payload: "lol"
  console.log "sending a message"
  ws.send JSON.stringify
    topic: "benchmark:123"
    event: "create_and_stuff"
    payload: "lol"

  console.log "sent!"

ws.on 'message', (data, flags) ->
  console.log data

ws.on 'close', ->
  console.log "CLOSED!"
