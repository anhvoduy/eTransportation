var _ = require('lodash');
var Q = require('q');
var data = require('../database/sampleData');

// Constructor
var Factory = function () { 
}

Factory.prototype.myProfile = function(){
    return data.myProfile();
}

Factory.prototype.getUser = function(){
    return data.getUser();
}

Factory.prototype.getUsers = function(){
    return data.getUsers();
}

Factory.prototype.getUsers = function(){
    return data.getUsers();
}

Factory.prototype.getMenus = function(){
    return data.getMenus();
}

// Export
module.exports = new Factory;
