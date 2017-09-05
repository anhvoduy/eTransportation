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
        let sql = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE Deleted = 0 
            ORDER BY CustomerId DESC
        `;
        return dbContext.queryList(pool, sql)
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

Factory.prototype.getCustomerByKey = Q.async(function* (customerKey){
    try
    {        
        let sql = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE CustomerId = 1 AND Deleted = 0
        `;        
        let pool = yield dbContext.openConnection();
        let customer = yield dbContext.queryItem(pool, sql);
        yield dbContext.closeConnection(pool);
        return customer;        
    }catch(err){        
        return err;
    }
});

Factory.prototype.createCustomer = Q.async(function* (customer){
    return true;
});

Factory.prototype.editCustomer = Q.async(function* (customer){
    return true;
});

Factory.prototype.deleteCustomer = Q.async(function* (customerKey){
    return true;
});

// Export
module.exports = new Factory;