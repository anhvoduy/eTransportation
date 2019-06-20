const express = require('express');
const router = express.Router();
const _ = require('lodash');
const Q = require('q');
const errorHelper = require('../lib/errorHelper');
const userService = require('../services/userService');

// Routers
router.get('/profile', Q.async(function* (req, res, next) {
    var myProfile = userService.myProfile();
    res.status(200).json(myProfile);
    next();
}));

router.get('/menu', Q.async(function* (req, res, next) {
	var menus = userService.getMenus();
	res.status(200).json(menus);
	next();
}));



router.get('/list', Q.async(function* (req, res, next) {
	try
	{
		let query = _.pick(req.query, ['PageCurrent', 'PageSize']);
		let data = yield userService.getList(query);
		res.status(200).json(data);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.get('/item', Q.async(function* (req, res, next) {
	try
	{
		let query = _.pick(req.query, ['UserKey']);
		var user = yield userService.getItem(query.UserKey);
		res.status(200).json(user);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/update', Q.async(function* (req, res, next) {
	try
	{
		let user = _.pick(req.body, ['UserKey', 'UserName', 'DisplayName', 'Email', 'Mobile', 'Tel', 'Title', 'DateOfBirth']);
		if(!user) throw errorHelper.ERROR_INVALID_USER;
				
		let result;
		if(user.UserKey){
			let data = yield userService.update(user);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		else {
			let data = yield userService.create(user);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		res.status(200).json(result);
	}catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.delete('/delete', Q.async(function* (req, res, next) {
	res.status(200).json(true);
	next();
}));

// export Router
module.exports = router;
