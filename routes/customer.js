const express = require('express');
const router = express.Router();
const _ = require('lodash');
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
		res.status(200).json(customers);
	})
	.catch(function(err){		
		res.status(500).json(err);
		next(err);
	});
});

router.get('/item', Q.async(function* (req, res, next) {	
	try
	{
		let query = _.pick(req.query, ['CustomerKey']);	
		let customer = yield customerService.getCustomerByKey(query.CustomerKey);
		res.status(200).json(customer);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/create', function (req, res, next) {
	res.status(200).json(true);
	next();
});

router.post('/edit', function (req, res, next) {	
	res.status(200).json(true);
	next();
});

router.post('/delete', function (req, res, next) {
	res.status(200).json(true);
	next();
});

// return Router
module.exports = router;