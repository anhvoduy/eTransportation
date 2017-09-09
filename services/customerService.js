const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function () {
}

Factory.prototype.getList = Q.async(function* (){
    try{        
        let sql = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE Deleted = 0 
            ORDER BY CustomerId DESC
        `;
        yield dbContext.openConnection();
        let customers = yield dbContext.queryList(sql);    
        yield dbContext.closeConnection();
        return customers;
    }
    catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
})

Factory.prototype.getItem = Q.async(function* (CustomerKey){
    try
    {        
        let sql = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE CustomerKey = @CustomerKey AND Deleted = 0
        `;
        yield dbContext.openConnection();
        let customer = yield dbContext.queryItem(sql, { CustomerKey: CustomerKey });
        yield dbContext.closeConnection();
        return customer;
    }catch(err){
        yield dbContext.closeConnection();        
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (customer){
    console.log('---- create()');
    console.log(customer);
    return true;
});

Factory.prototype.update = Q.async(function* (customer){    
    try
    {        
        let sql = `
            UPDATE Customer
            SET CustomerName = @CustomerName,
                Email = @Email,
                Mobile = @Mobile,
                Tel = @Tel,
                Fax = @Fax,
                Title = @Title,
                Address = @Address,
                Description = @Description
            WHERE CustomerKey = @CustomerKey
        `;
        yield dbContext.openConnection();        
        let data = yield dbContext.queryExecute(sql, customer);
        yield dbContext.closeConnection();        
        return data;
    }catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.delete = Q.async(function* (CustomerKey){
    console.log(customerKey);
    return true;
});

// Export
module.exports = new Factory;