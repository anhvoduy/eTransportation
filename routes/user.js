const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const auth = require('../services/authService');
const userService = require('../services/userService');

// Routers
router.get('/list', function (req, res, next) {
	var user = userService.getUsers();
	res.status(200).json(user);
	next();
});

router.get('/item', function (req, res, next) {
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
	next();
});

router.post('/update', function (req, res, next) {
	res.status(200).json(true);
	next();
});

router.delete('/delete', function (req, res, next) {
	res.status(200).json(true);
	next();
});

// export Router
module.exports = router;
