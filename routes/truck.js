// Dependencies
var express = require('express');
var router = express.Router();
var Q = require('q');
var auth = require('../services/authService');
var truckService = require('../services/truckService');

// Routers
router.get('/items', function (req, res, next) {
	var trucks = truckService.getTrucks();
	res.status(200).json(trucks);
	next();
});

router.get('/items/:id', function (req, res, next) {
    var truck = truckService.getTruckById(100);
	res.status(200).json(truck);
	next();
});

router.post('/create', function (req, res, next) {
	// create truck;
	next();
});

router.put('/update', function (req, res, next) {
	// edit truck;
	next();
});

router.delete('/delete', function (req, res, next) {
	// edit truck;
	next();
});

// return Router
module.exports = router;
