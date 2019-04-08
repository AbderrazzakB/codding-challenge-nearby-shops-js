del				= require 'del'
gulp			= require 'gulp'
newer			= require 'gulp-newer'
plumber			= require 'gulp-plumber'
coffee			= require 'gulp-coffee'

cleanTask = ->
	del [
		'build/*'
		'!build'
	]

coffeeTask = ->
	return gulp
		.src ['./source/**/[!_]*.coffee']
		.pipe plumber()
		.pipe coffee bare: true
		.pipe gulp.dest './build/'

watchTask = ->
	gulp.watch './source/**/*.coffee', coffeeTask
	return

gulp.task 'default', gulp.series cleanTask, gulp.parallel(coffeeTask), watchTask
