const _ = require('lodash');
const Q = require('q');
const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
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
