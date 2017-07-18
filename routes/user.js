const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const auth = require('../services/authService');
const userService = require('../services/userService');

// Routers
router.get('/items', function (req, res, next) {
	var user = userService.getUsers();
	res.status(200).json(user);
	next();
});

router.get('/items/:id', function (req, res, next) {
    var user = userService.getUser();
	res.status(200).json(user);
	next();
});

router.get('/profile', function (req, res, next) {
    var myProfile = userService.myProfile();
    res.status(200).json(myProfile);
    next();
});

router.get('/menu', function (req, res, next) {	
	var menus = userService.getMenus();
	res.status(200).json(menus);	
});

router.post('/create', function (req, res, next) {
	// create user;
});

router.put('/update', function (req, res, next) {
	// edit user;
});

router.delete('/delete', function (req, res, next) {
	// edit user;
});

// return Router
module.exports = router;
