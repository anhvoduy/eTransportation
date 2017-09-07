const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const constant = require('../lib/constant');
const errorHelper = require('../lib/errorHelper');
const validator = require('../lib/validator');
const auth = require('../services/authService');
const brandService = require('../services/brandService');

router.get('/list', Q.async(function* (req, res, next) {
	try
	{
		let brands = yield brandService.getList();
		res.status(200).json(brands);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.get('/item', Q.async(function* (req, res, next) {
	try
	{
		let query = _.pick(req.query, ['BrandKey']);
		let brand = yield brandService.getItem(query.BrandKey);
		res.status(200).json(brand);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/create', auth.checkAuthentication(), function (req, res, next) {	
	res.status(200).json(true);
	next();
});

router.put('/update', auth.checkAuthentication(), function (req, res, next) {
    res.status(200).json(true);
	next();
});

router.delete('/delete', auth.checkAuthentication(), function (req, res, next) {	
	res.status(200).json(true);
	next();
});

module.exports = router;