// Dependencies
var Q = require('q');
var dbHelper = require('../config/dbHelper');

// Constructor
var Factory = function () { 
}

Factory.prototype.getCustomers = function (ctx) {
	var sql = dbHelper.prepareQueryCommand('', []);
	return ctx.queryCommand(sql);
}

Factory.prototype.getCustomerById = function (ctx, customerId) {
	var sql = dbHelper.prepareQueryCommand('', [customerId]);
	return ctx.queryCommand(sql);
}

Factory.prototype.createCustomer = function (ctx, customer) {
	var sql = dbHelper.prepareQueryCommand('', []);
	return ctx.queryCommand(sql);
}

Factory.prototype.updateCustomer = function (ctx) {
	var sql = dbHelper.prepareQueryCommand('', []);
	return ctx.queryCommand(sql);
}

Factory.prototype.deleteCustomer = function (ctx) {
	var sql = dbHelper.prepareQueryCommand('', []);
	return ctx.queryCommand(sql);
}
// Export
module.exports = new Factory;