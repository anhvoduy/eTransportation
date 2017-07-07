const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');
const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
}

Factory.prototype.getCustomer = function(){
    let deferred  = Q.defer();
    let customers;

    Q.when()
    .then(function(){
        return dbContext.openConnection();
    })
    .then(function(pool){
        return dbContext.queryData(pool,'SELECT * FROM Customer ORDER BY CustomerId DESC;');
    })
    .then(function(data){
        customers = data;
        dbContext.closeConnection();                
    })
    .then(function(){
        deferred.resolve(customers);
    });

    return deferred.promise;
}

// Export
module.exports = new Factory;