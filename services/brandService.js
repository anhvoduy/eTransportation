const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function(){	
}

Factory.prototype.getList = Q.async(function* (){
    try
    {
        let sql = `
            SELECT BrandId, BrandKey, BrandName, Description, Author, Editor 
            FROM Brand
            WHERE Deleted = 0 
            ORDER BY BrandId DESC
        `;
        return dbContext.queryList(sql);
    }
    catch(err){
        throw err;
    }
})

Factory.prototype.getItem = Q.async(function* (BrandKey){
    try
    {        
        let sql = `
            SELECT BrandId, BrandKey, BrandName, Description, Author, Editor
            FROM Brand
            WHERE BrandKey = @BrandKey AND Deleted = 0
        `;
        return dbContext.queryItem(sql, { BrandKey: BrandKey });
    }
    catch(err){
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (brand){
    try
    {        
        let sql = `
            INSERT INTO Brand(BrandKey, BrandName, Description, Author, Editor)
            VALUES (NEWID(), @BrandName, @Description, 'SYSTEM', 'SYSTEM');
        `;        
        let result = yield dbContext.queryExecute(sql, brand);        
        return result;
    }
    catch(err){        
        throw err;
    }
});

Factory.prototype.update = Q.async(function* (brand){
    try
    {        
        let sql = `
            UPDATE Brand
            SET BrandName = @BrandName,                 
                Description = @Description
            WHERE BrandKey = @BrandKey
        `;        
        let result = yield dbContext.queryExecute(sql, brand);        
        return result;
    }
    catch(err){        
        throw err;
    }
});

module.exports = new Factory;