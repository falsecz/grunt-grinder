module.exports = (grunt) ->

  createWrapperFn = (fn, domain, method) ->
    ->
      source = {domain, method}
      grunt.event.emit 'grinder.output', {source, arguments}
      return fn arguments...

  wrap = (domain, object, method) ->
  	return if object.preGrinderOriginal? # already wrapped
    original = object[method]
    object[method] = createWrapperFn original, domain, method
    object[method].preGrinderOriginal = original # backup


  outputMethods = ['write', 'writeln', 'error', 'errorlns', 'ok', 'oklns', 'subhead', 'writeflags', 'debug']
  
  wrap 'grunt.log', grunt.log, method for method in outputMethods
  wrap 'grunt.verbose', grunt.verbose, method for method in outputMethods


  failMethods = ['warn', 'fail']
  
  wrap 'grunt.fail', grunt.fail, method for method in failMethods
  wrap 'grunt.fail', grunt, method for method in failMethods

