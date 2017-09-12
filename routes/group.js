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
		let group = _.pick(req.body, ['GroupKey', 'GroupName', 'Description']);
		if(!group) throw errorHelper.ERROR_INVALID_GROUP;

		let result;
		if(group.GroupKey){
			let data = yield groupService.update(group);
			if(data.rowsAffected.length > 0) result = true;
			else result = false;
		}
		else {
			let data = yield groupService.create(group);
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

router.delete('/delete', Q.async(function* (req, res, next) {
	res.status(200).json(true);
	next();
}));

router.get('/permission', Q.async(function* (req, res, next) {
	try
	{
		let query = _.pick(req.query, ['GroupKey']);
		let permission = yield groupService.getUserGroupPermission(query.GroupKey);
		res.status(200).json(permission);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

router.post('/assignPermission', Q.async(function* (req, res, next) {
	try
	{
		let groupPermission = _.map(req.body);
		let result = false;
		if(groupPermission && Array.isArray(groupPermission) && groupPermission.length > 0){
			result = yield groupService.saveUserGroupPermission(groupPermission);			
		}		
		res.status(200).json(result);
	}
	catch(err){
		res.status(500).json(err);
		next(err);
	}
}));

// return Router
module.exports = router;
