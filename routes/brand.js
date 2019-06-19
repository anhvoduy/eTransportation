const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const errorHelper = require('../lib/errorHelper');
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

router.post('/update', auth.checkAuthentication(), Q.async(function* (req, res, next) {
	try
	{
		let brand = _.pick(req.body, ['BrandKey', 'BrandName', 'Description']);
		if(!brand) throw { code: 'ERROR_INVALID_BRAND', message: "Brand is invalid" };		
		
		if(brand.BrandKey){
			let data = yield brandService.update(brand);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		else {
			let data = yield brandService.create(brand);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		res.status(200).json(true);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

module.exports = router;