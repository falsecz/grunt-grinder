module.exports = (grunt) ->

	fakeExitBehavior = (fn, done) ->
		->
			console.log "I'm faking it"
			originalExit = process.exit
			process.exit = ->
				console.log 'restart'
				grunt.task.clearQueue()
				grunt.task.run 'grinder'

			result = fn arguments...
			console.log result
			process.exit = originalExit
			return result

	grunt.registerMultiTask 'grinder', 'test task', ->
		require('../lib/eventize') grunt
		require('../lib/server') grunt
	
		grunt.warn = grunt.fail.warn = fakeExitBehavior grunt.fail.warn
		grunt.fatal = grunt.fail.fatal = fakeExitBehavior grunt.fail.fatal

