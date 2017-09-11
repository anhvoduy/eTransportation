const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const constant = require('../lib/constant');
const errorHelper = require('../lib/errorHelper');
const validator = require('../lib/validator');
const auth = require('../services/authService');
const productService = require('../services/productService');

router.get('/list', Q.async(function* (req, res, next) {
	try
	{
		let products = yield productService.getList();
		res.status(200).json(products);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.get('/item', Q.async(function* (req, res, next) {
	try
	{
		let query = _.pick(req.query, ['ProductKey']);
		let product = yield productService.getItem(query.ProductKey);
		res.status(200).json(product);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/update', Q.async(function* (req, res, next) {
    try
	{
		let product = _.pick(req.body, ['ProductKey', 'ProductCode', 'ProductName', 'Description']);
		if(!product) throw errorHelper.ERROR_INVALID_PRODUCT;

		let result;
		if(product.ProductKey){
			let data = yield productService.update(product);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		else {
			let data = yield productService.create(product);
			result = false
		}
		res.status(200).json(result);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.delete('/delete', auth.checkAuthentication(), Q.async(function* (req, res, next) {
	res.status(200).json(true);
	next();
}));

module.exports = router;