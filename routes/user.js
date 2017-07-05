// Dependencies
var express = require('express');
var router = express.Router();
var Q = require('q');
var throat = require('throat');
var auth = require('../lib/auth');
var userService = require('../services/userService');

// Routers
router.get('/items', auth.checkAuthentication(), function (req, res, next) {
	var user = {};
	res.status(200).json(user);
	next();
});

router.get('/items/:id', auth.checkAuthentication(), function (req, res, next) {
    var user = {};
	res.status(200).json(user);
	next();
});

router.get('/profile', auth.checkAuthentication(), function (req, res, next) {
    var peoples = [
        {name: '11', sex: false},
        {name: '12', sex: false},
        {name: '13', sex: false},
        {name: '14', sex: false},
        {name: '15', sex: true},
        {name: '16', sex: false},
        {name: '20', sex: true},
        {name: '22', sex: true}
    ];

    var user = {};
    var ctx = {};
    //console.log('get current user profile ...');
    dbContext.getConnection()
    .then(function (con) {
        ctx = con;
        return userService.getUserById(ctx, 1);
    })
    .then(function (users) {
        user = users[0];		
    })   
    .then(function(){
        res.status(200).json(user);
    })
    .catch(function (error) {
        next(error);
    })
    .done(function () {
        ctx.release();
    });
});

router.get('/menu', auth.checkAuthentication(), function (req, res, next) {
	//console.log('get current menu ...');
	var menu = userService.getMenu();
	res.status(200).json(menu);	
});

router.post('/create', auth.checkAuthentication(), function (req, res, next) {
	// create user;
});

router.put('/update', auth.checkAuthentication(), function (req, res, next) {
	// edit user;
});

router.delete('/delete', auth.checkAuthentication(), function (req, res, next) {
	// edit user;
});

// return Router
module.exports = router;
