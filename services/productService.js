const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function(){	
}

Factory.prototype.getList = Q.async(function* (query){
    try
    {
        let TotalSize = 0;
        let PageTotal = 0;
        let PageCurrent = parseInt(query.PageCurrent) - 1;
        let PageSize = parseInt(query.PageSize);
        let PageOffset = PageCurrent * PageSize;

        // ------------ continue -------------------
        let sql = `
            SELECT P.ProductId, P.ProductName, P.ProductCode, P.Description,
                P.BrandId, B.BrandName, 
                P.Price, P.Colour, P.Status, P.LatestReviewInfo 
            FROM Product P INNER JOIN Brand B
                ON P.BrandId = B.BrandId
            WHERE P.Deleted = 0
            ORDER BY P.ProductId DESC
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
