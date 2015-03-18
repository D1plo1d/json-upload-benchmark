'use strict';

var auth = {
  topic: "benchmark:123",
  event: "join",
  payload: "authorize me!"
};

auth = JSON.stringify(auth).toString('utf-8');

var message = {
  // event: "create_and_stuff",
  // payload: require("./payload.json")
  topic: "benchmark:123",
  event: "create_and_stuff",
  payload: require("./payload.json")
};

message = JSON.stringify(message);

/**
 * Join the channel
 */
exports.onOpen = function (socket, task, id, fn) {
  socket.send(auth, {}, fn);
}

/**
 * Generate a UTF-8 messages that we will be send to a connected client.
 *
 * @async
 * @param {Number} size The specified in bytes for the message.
 * @param {Function} fn The callback function for the data.
 * @public
 */
exports.utf8 = function utf(size, fn) {
  fn(undefined, message);
};

