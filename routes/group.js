const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const constant = require('../lib/constant');
const errorHelper = require('../lib/errorHelper');
const validator = require('../lib/validator');
const auth = require('../services/authService');
const groupService = require('../services/groupService');

// Routers
router.get('/list', Q.async(function* (req, res, next) {
	try{
		var groups = yield groupService.getList();
		res.status(200).json(groups);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.get('/item', Q.async(function* (req, res, next) {
	try
	{
		let query = _.pick(req.query, ['GroupKey']);	
		let truck = yield groupService.getItem(query.GroupKey);
		res.status(200).json(truck);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/update', Q.async(function* (req, res, next) {
	try
	{
		let truck = _.pick(req.body, ['TruckKey', 'TruckName', 'TruckNumber', 'Description']);
		if(!truck) throw errorHelper.ERROR_INVALID_TRUCK;

		let result;
		if(truck.TruckKey){
			let data = yield truckService.update(truck);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		else {
			let data = yield truckService.create(truck);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		res.status(200).json(result);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}	
}));

router.delete('/delete', function (req, res, next) {
	res.status(200).json(true);
	next();
});

// return Router
module.exports = router;
