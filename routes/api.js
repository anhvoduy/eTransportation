// dependencies
const express = require('express');
const router = express.Router();
const jwt = require('jsonwebtoken');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

// configuration
const config = require('../config/config');
const constant = require('../lib/constant');
const errorHelper = require('../lib/errorHelper');
const auth = require('../services/authService');
const userService = require('../services/userService');

// routers: use to test
router.get('/', function (req, res, next) {
    res.json({ message: 'eTransport method GET() is success' });
    console.log('%s %s :: %s', (new Date).toString(), req.method, req.url);	
    next();
});

router.post('/', function (req, res, next) {
    res.json({ message: 'eTransport method POST() is success' });
    console.log('%s %s :: %s', (new Date).toString(), req.method, req.url);
    next();
});

// routers: use to authenticate
router.post('/authenticate', function (req, res, next) {
	console.log('authenticate ...');
	next();
});

router.get('/profile', function (req, res, next) {
	console.log('get my profile ...');
    res.json(userService.myProfile());
    next();
});

router.post('/login', function (req, res, next) {
	passport.authenticate('local', function (err, result) {
		if (err) { return next(err); }
		if (!result.success) {
			console.log('Login is failed ...');
			res.status(404).json({
				success: false,
				message: { code: 'ERROR_UNAUTHENTICATION', message: 'Username and Password is invalid.' }
			});
		} else {
			console.log('Login is success ...');
			var token = jwt.sign(result.user, config.secretKey, { expiresIn: 60 * 60 * 24 * 1 });
			//console.log(token);
			res.status(200).json({
				success: true,
				message: { code: 'SUCCESS_AUTHENTICATION', message: 'Login is successful.' },                
				user: { username: result.user.username, token: token },
			});
		}
	})(req, res, next);
});

router.get('/logout', function (req, res) {
	console.log('Log out current user ...');
	res.status(200).json({
		success: true,
		message: { code: 'LOGOUT', message: 'Logout is successful.' }
	});
});

module.exports = router;