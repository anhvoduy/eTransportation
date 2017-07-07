const express = require('express');
const router = express.Router();
const Q = require('q');
const auth = require('../services/authService');
const customerService = require('../services/customerService');

router.get('/items', function (req, res, next) {
	let customers;

    Q.when()
	.then(function(){
		return customerService.getCustomer().then(function(data){
			customers = data;
		});
	})
	.then(function(){
		console.log(customers);
		return res.status(200).json(customers);
	})
	.catch(function(err){
		throw err;
	});
});

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