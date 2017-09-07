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
    }catch(err){
        yield dbContext.closeConnection();        
        throw err;
    }
});

Factory.prototype.create = function(brand){
    return true;
}

Factory.prototype.update = function(brand){
    return true;
}

Factory.prototype.delete = function(BrandKey){
    return true;
}

// Export
module.exports = new Factory;
