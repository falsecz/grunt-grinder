portfinder = require 'portfinder'

module.exports = (grunt) ->

  # console.log "GRINDERGRINDERGRINDERGRINDERGRINDERGRINDERGRINDERGRINDERGRINDER"

  require('../lib/eventize') grunt

  express = require 'express'
  app = express()
  app.use (req, res, next) ->
    res.setHeader 'ETag', 'no-cache-' + Math.random()

    try
      fs.statSync distDir + '/error.html'
      req.url = '/error.html'
    catch err

    next()


  http = require('http')
  server = http.createServer(app)
  io = require('socket.io').listen(server);

  io.set 'log level', 1
  # app.use express.static 'public'

  # app.use express.static distDir
  # app.use express.directory distDir
  # app.use (req, res, next) ->
  #   console.log res.header('etag', null)
  #   next()

  socket1 = null
  io.sockets.on 'connection', (socket) ->
    socket1 = socket

  portfinder.getPort (err, port) ->
    console.log "Listening on " + "http://127.0.0.1:#{port}"
    console.log err if err
    server.listen port




  grunt.event.on 'watch.reload', () ->
    console.log '!@#!EEWFKEWOFKQWOFKWQEOFKEWQOFKWEQFOEWFKEWQOFKEWOFKEWOFKWEQOFQWEKF'
    console.log arguments


  gle = grunt.log.error
  grunt.log.error = () ->
    # console.log 'xxx'
    gle.apply gle, arguments
    # console.log arguments[0].stack
