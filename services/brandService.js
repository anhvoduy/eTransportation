const _ = require('lodash');
const Q = require('q');
const data = require('../database/sampleData');

// Constructor
const Factory = function(){	
}

Factory.prototype.getList = function(){
    return true;
}

Factory.prototype.getItem = function(BrandKey){
    return true;
}

Factory.prototype.create = function(brand){
    return true;
}

Factory.prototype.update = function(brand){
    return true;
}

Factory.prototype.delete = function(BrandKey){
    return true;
}

// Export
module.exports = new Factory;
