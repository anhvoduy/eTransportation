const router = require('express').Router();
const _ = require('lodash');
const Q = require('q');
const errorHelper = require('../lib/errorHelper');
const customerService = require('../services/customerService');

router.get('/list', Q.async(function* (req, res, next) {	
	try
	{
		let query = _.pick(req.query, ['PageCurrent', 'PageSize']);
		let data = yield customerService.getList(query);
		res.status(200).json(data);
	} catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

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
		let customer = _.pick(req.body, ['CustomerKey', 'CustomerName', 'Email', 'Mobile', 'Tel', 'Fax', 'Title', 'Address', 'Description']);
		if(!customer) throw errorHelper.ERROR_INVALID_CUSTOMER;
				
		let result;
		if(customer.CustomerKey){
			let data = yield customerService.update(customer);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		else {
			let data = yield customerService.create(customer);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		res.status(200).json(result);
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