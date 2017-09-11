const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function(){	
}

Factory.prototype.getList = Q.async(function* (){
    try
    {
        let sql = `
            SELECT * 
            FROM Product
            WHERE Deleted = 0 
            ORDER BY ProductId DESC
        `;
        yield dbContext.openConnection();
        let products = yield dbContext.queryList(sql);
        yield dbContext.closeConnection();
        return products;
    }
    catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
})

Factory.prototype.getItem = Q.async(function* (ProductKey){
    try
    {        
        let sql = `
            SELECT *
            FROM Product
            WHERE ProductKey = @ProductKey AND Deleted = 0
        `;
        yield dbContext.openConnection();
        let product = yield dbContext.queryItem(sql, { ProductKey: ProductKey });
        yield dbContext.closeConnection();
        return product;
    }
    catch(err){
        yield dbContext.closeConnection();        
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (product){
    try
    {        
        let sql = `
            INSERT INTO Product(ProductKey, ProductCode, ProductName, Description, BrandId, Price, Colour, Status, Author, Editor)
            VALUES (NEWID(), @ProductCode, @ProductName, @Description, 2, 100, 'Black', 2,'SYSTEM','SYSTEM');
        `;
        yield dbContext.openConnection();
        let result = yield dbContext.queryItem(sql, product);
        yield dbContext.closeConnection();
        return result;
    }
    catch(err){
        yield dbContext.closeConnection();        
        throw err;
    }
});

Factory.prototype.update = Q.async(function* (product){
    try
    {        
        let sql = `
            UPDATE Product
            SET ProductCode = @ProductCode, 
                ProductName = @ProductName, 
                Description = @Description
            WHERE ProductKey = @ProductKey
        `;
        yield dbContext.openConnection();
        let result = yield dbContext.queryItem(sql, product);
        yield dbContext.closeConnection();
        return result;
    }
    catch(err){
        yield dbContext.closeConnection();        
        throw err;
    }
});

Factory.prototype.delete = Q.async(function* (ProductKey){
    return true;
});

// Export
module.exports = new Factory;
