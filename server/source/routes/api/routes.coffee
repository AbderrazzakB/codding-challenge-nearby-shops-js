express	= require('express')
# v1		= require('./v1/index')
router	= express.Router()

# router.use '/v1', v1
router.get '/', (req, res) ->
	res.send 'Welcome to our api v1'

module.exports = router