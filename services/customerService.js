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
        let customers = yield dbContext.queryList(sql);
        return customers;
    }
    catch(err){        
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
        let customer = yield dbContext.queryItem(sql, { CustomerKey: CustomerKey });        
        return customer;
    }catch(err){        
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (customer){
    try
    {        
        let sql = `
            INSERT INTO [dbo].[Customer] (CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address, Author, Editor)
            VALUES (NEWID(), @CustomerName, @Description, 
                @Email, @Mobile, @Tel, @Fax, @Title, @Address, 'SYSTEM', 'SYSTEM')
        `;                
        let data = yield dbContext.queryExecute(sql, customer);        
        return data;
    }catch(err){        
        throw err;
    }
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
        let data = yield dbContext.queryExecute(sql, customer);        
        return data;
    }catch(err){        
        throw err;
    }
});

Factory.prototype.delete = Q.async(function* (CustomerKey){
    console.log(customerKey);
    return true;
});

// Export
module.exports = new Factory;