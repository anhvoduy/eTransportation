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
		let sql = 'SELECT CustomerId, CustomerName, Address, Phone FROM Customer ORDER BY CustomerId DESC';        
        return dbContext.queryDatabase(pool, sql)
		.then(function(data){
			customers = data;
        })
        .then(function(){
            dbContext.closeConnection(pool);    
        });
    })    
    .then(function(){
        deferred.resolve(customers);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
}

// Export
module.exports = new Factory;