const _ = require('lodash');
const Q = require('q');
const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
}

Factory.prototype.getTrucks = function(){
    return data.myProfile();
}

Factory.prototype.getTruckById = function(){
    return data.getUser();
}

Factory.prototype.createTruck = function(){
    return data.getUsers();
}

Factory.prototype.updateTruck = function(){
    return data.getUsers();
}

Factory.prototype.deleteTruck = function(){
    return data.getMenus();
}

// Export
module.exports = new Factory;
