const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const constant = require('../lib/constant');
const errorHelper = require('../lib/errorHelper');
const validator = require('../lib/validator');
const auth = require('../services/authService');
const customerService = require('../services/customerService');

router.get('/list', function (req, res, next) {
	let customers;

    Q.when()
	.then(function(){
		return customerService.getList().then(function(data){
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
		let customer = yield customerService.getItem(query.CustomerKey);
		res.status(200).json(customer);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/update', Q.async(function* (req, res, next) {
	try
	{
		let customer = _.pick(req.body, ['CustomerKey', 'CustomerName', 'Email']);
		if(!customer) throw errorHelper.ERROR_INVALID_CUSTOMER;
				
		let result;
		if(customer.CustomerKey)
			result = yield customerService.update(customer);
		else 
			result = yield customerService.create(customer);

		res.status(200).json(true);
	}catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/delete', function (req, res, next) {
	res.status(200).json(false);
	next();
});

// return Router
module.exports = router;