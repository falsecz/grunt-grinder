debug = require('debug') 'grinder:server'
WebSockteServer = require('ws').Server

connected = []


server = new WebSockteServer port:8666
server.on 'connection', (socket) ->
	debug 'Server on'

	connected.push socket

	socket.on 'open', ->
		debug 'Socker open'

	socket.on 'close', ->
		debug 'Socket closed'

	socket.on 'message', (data) ->
		debug "received message", data
	
	socket.send 'ready'

send_all = (message) ->
	for socket in connected
		try 
			socket.send message
		catch e
			console.log e

module.exports = (grunt) ->
	grunt.event.on 'grinder.output', ->
		send_all JSON.stringify arguments
