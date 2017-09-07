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
            FROM Brand
            WHERE Deleted = 0 
            ORDER BY BrandId DESC
        `;
        yield dbContext.openConnection();
        let brands = yield dbContext.queryList(sql);    
        yield dbContext.closeConnection();
        return brands;
    }
    catch(err){
        yield dbContext.closeConnection();
        return err;
    }
})

Factory.prototype.getItem = function(BrandKey){
    return true;
}

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
