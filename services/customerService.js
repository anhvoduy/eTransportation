const _ = require('lodash');
const Q = require('q');
const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
}

Factory.prototype.getCustomer = function(){
    let sql = `SELECT * FROM Customer ORDER BY CustomerId DESC`;
    
}

// Export
module.exports = new Factory;