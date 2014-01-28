module.exports = (grunt) ->
	grunt.initConfig
		coffee:
			js:
				src: 'src/*.coffee'
				dest: 'underscore.array.js'

		uglify:
			js:
				src: 'underscore.array.js'
				dest: 'underscore.array.min.js'

		watch:
			files: 'src/*.coffee'
			tasks: 'default'

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.registerTask 'default', [
		'coffee:js',
		'uglify:js',
	]
