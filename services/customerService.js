const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');
const data = require('../database/sampleData');

// Constructor
const Factory = function () {
}

Factory.prototype.getList = Q.async(function* (){
    let customers;
    try{        
        let sql = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE Deleted = 0 
            ORDER BY CustomerId DESC
        `;
        yield dbContext.openConnection();
        customers = yield dbContext.queryList(sql);    
        yield dbContext.closeConnection();
        return customers;
    }
    catch(err){
        return err;
    }
})

Factory.prototype.getItem = Q.async(function* (CustomerKey){
    let customer;
    try
    {        
        let sql = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE CustomerKey = @CustomerKey AND Deleted = 0
        `;
        yield dbContext.openConnection();
        customer = yield dbContext.queryItem(sql, CustomerKey);
        yield dbContext.closeConnection();
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