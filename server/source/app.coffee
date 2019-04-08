express			= require('express')
path			= require('path')
cookieParser	= require('cookie-parser')
logger			= require('morgan')
api				= require('./routes/api/routes')

app = express()
app.use logger('dev')
app.use express.json()
app.use express.urlencoded(extended: false)
app.use cookieParser()
app.use '/api', api

# catch 404 and forward to error handler
app.use (req, res, next) ->
	res.status 404
	.send 'We think you are lost!'
	return

# error handler
app.use (err, req, res, next) ->
	# set locals, only providing error in development
	res.locals.message = err.message
	res.locals.error = if req.app.get('env') == 'development' then err else {}
	# render the error page
	res.status err.status or 500
	res.send 'error'
	return

module.exports = app