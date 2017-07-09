const express = require('express');
const router = express.Router();
const Q = require('q');
const auth = require('../services/authService');
const customerService = require('../services/customerService');

router.get('/items', function (req, res, next) {
	let customers;

    Q.when()
	.then(function(){
		customerService.getCustomer().then(function(data){
			customers = data;
		});
	})
	.then(function(){		
		res.status(200).json(customers);
	})
	.catch(function(err){		
		res.status(500).json(err);
		next(err);
	});
});

router.get('/item/:id', function (req, res, next) {
    var customer = [];
	res.status(200).json(customer);
	next();
});

router.get('/edit/:id', function (req, res, next) {
	var customer = [];
	res.status(200).json(customer);
	next();
});

router.get('/delete/:id', function (req, res, next) {
    var customer = [];
	res.status(200).json(customer);
	next();
});

// return Router
module.exports = router;