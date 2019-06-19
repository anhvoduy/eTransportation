const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const jwt = require('jsonwebtoken');
const passport = require('passport');
const constant = require('../lib/constant');
const auth = require('../services/authService');
const userService = require('../services/userService');

/**
 * APIs: using for testing
 * GET & POST simple + test database connection
 */
router.get('/', function (req, res, next) {
    res.json({ message: 'Transportation API method GET() is success' });
    console.log('%s %s :: %s', (new Date).toString(), req.method, req.url);	
    next();
});

router.post('/', function (req, res, next) {
    res.json({ message: 'Transportation API method POST() is success' });
    console.log('%s %s :: %s', (new Date).toString(), req.method, req.url);
    next();
});

router.get('/connection', Q.async(function* (req, res, next) {
	let tables = yield auth.getInformationSchema();
    res.json({ 
		code: 'CONNECTION_SUCCESS', 
		message: 'Transportation API make connection to database is success',
		data: tables
	});
    console.log('%s %s :: %s', (new Date).toString(), req.method, req.url);	
    next();
}));



// routers: use to authenticate
router.post('/login', function (req, res, next) {
	passport.authenticate('local', function (err, result) {
		if (err) { 
			return next(err); 
		}

		if (!result.success) {
			res.status(404).json({
				success: false,
				message: { code: 'ERROR_UNAUTHENTICATION', message: 'Username and Password is invalid.' }
			});
		} 
		else {
			var token = jwt.sign(result.user, constant.secretKey, { expiresIn: 60 * 60 * 24 * 1 });
			res.status(200).json({
				success: true,
				message: { code: 'SUCCESS_AUTHENTICATION', message: 'Login is successful.' },
				user: { username: result.user.username, token: token }
			});
		}
	})(req, res, next);
});

router.get('/logout', function (req, res) {
	res.status(200).json({
		success: true,
		message: { code: 'LOGOUT', message: 'Logout is successful.' }
	});
});

router.get('/profile', function (req, res, next) {
    res.json(userService.myProfile());
    next();
});

// authenticate by Azure Directory
router.post('/loginAzure', function (req, res, next) {
	res.status(200).json({
		success: true
	});
});

server.get('/azure', au, (req, res, next) => {
    res.status(200).json({
		message: 'response from API endpoint'
	});
    next();
});

module.exports = router;