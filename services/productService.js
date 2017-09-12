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
        return dbContext.queryList(sql);
    }
    catch(err){
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
        return dbContext.queryItem(sql, { ProductKey: ProductKey });
    }
    catch(err){
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (product){
    try
    {        
        let sql = `
            INSERT INTO Product(ProductKey, ProductCode, ProductName, Description, BrandId, Price, Colour, Status, Author, Editor)
            VALUES (NEWID(), @ProductCode, @ProductName, @Description, @BrandId, @Price, @Colour, 2, 'SYSTEM', 'SYSTEM');
        `;        
        let result = yield dbContext.queryExecute(sql, product);        
        return result;
    }
    catch(err){        
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
                BrandId     = @BrandId, 
                Price       = @Price, 
                Colour      = @Colour,
                Description = @Description
            WHERE ProductKey = @ProductKey
        `;        
        let result = yield dbContext.queryExecute(sql, product);        
        return result;
    }
    catch(err){        
        throw err;
    }
});

Factory.prototype.delete = Q.async(function* (ProductKey){
    return true;
});

// Export
module.exports = new Factory;
