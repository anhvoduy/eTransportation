const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const auth = require('../services/authService');
const brandService = require('../services/brandService');

router.get('/items', function (req, res, next) {
	var brands = [];	
	res.status(200).json(brands);
	next();	
});

router.get('/items/:id', function (req, res, next) {	
	var brand = {};
	res.status(200).json(brand);
	next();
});

router.post('/create', auth.checkAuthentication(), function (req, res, next) {
	// create brand
	res.status(200).json({ code: 'CREATE_BRAND_SUCCESS', message: "Create Brand is success." });
	next();
});

router.put('/update', auth.checkAuthentication(), function (req, res, next) {
    res.status(200).json({ code: 'UPDATE_BRAND_SUCCESS', message: "Update Brand is success." });
	next();
});

router.delete('/delete', auth.checkAuthentication(), function (req, res, next) {
	// delete brand
	res.status(200).json({ code: 'DELETE_BRAND_SUCCESS', message: "Delete Brand is success." });
	next();
});

module.exports = router;
