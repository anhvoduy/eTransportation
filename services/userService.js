const _ = require('lodash');
const Q = require('q');
const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
}

Factory.prototype.myProfile = function(){
    return data.myProfile();
}

Factory.prototype.authenticate = function(username, password){
    if(username && password){
        if(username === 'admin' && password === '@dmin'){
            return true;
        }
    }
    return false;
}

Factory.prototype.getUsers = function(){
    return data.getUsers();
}

Factory.prototype.getList = function(){
    return true;
}

Factory.prototype.getItem = function(){
    return true;
}

Factory.prototype.create = function(){
    return true;
}

Factory.prototype.update = function(){
    return true;
}

Factory.prototype.delete = function(){
    return true;
}

Factory.prototype.getMenus = function(){
    return data.getMenus();
}

// Export
module.exports = new Factory;
