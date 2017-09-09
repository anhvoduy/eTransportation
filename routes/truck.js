const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const auth = require('../services/authService');
const truckService = require('../services/truckService');

// Routers
router.get('/list', Q.async(function* (req, res, next) {
	var trucks = yield truckService.getList();
	res.status(200).json(trucks);
	next();
}));

router.get('/item', Q.async(function* (req, res, next) {
	try
	{
		let query = _.pick(req.query, ['TruckKey']);	
		let truck = yield truckService.getItem(query.TruckKey);
		res.status(200).json(truck);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.put('/update', function (req, res, next) {
	res.status(200).json(true);
	next();
});

router.delete('/delete', function (req, res, next) {
	res.status(200).json(true);
	next();
});

// return Router
module.exports = router;
