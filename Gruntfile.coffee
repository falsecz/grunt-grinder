module.exports = (grunt) ->
	grunt.initConfig {test: {}, grinder: { default: {}}}

	grunt.loadTasks './tasks'
	
	grunt.registerTask 'perform_stunt', 'You know...to perform some stunts', ->
		grunt.log.write 'Just made some stunt'
		grunt.fail.fatal 'nasrar'

	grunt.registerTask 'fail', 'Fail faster, fail harder', ->
		grunt.log.write '...and failed hard'

	grunt.registerTask 'test', ['grinder', 'perform_stunt', 'fail']
