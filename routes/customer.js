// Dependencies
var express = require('express');
var router = express.Router();
var Q = require('q');
var auth = require('../lib/auth');
var customerService = require('../services/customerService');

// Router
router.get('/itemspaging/:id', function (request, response, next) {
    var customer = [];
	res.status(200).json(customer);
	next();
});

router.get('/items/:id', function (request, response, next) {
	var customer = [];
	res.status(200).json(customer);
	next();
});

router.get('/itemsbrand/:id', function (request, response, next) {
    var customer = [];
	res.status(200).json(customer);
	next();
});

// return Router
module.exports = router;