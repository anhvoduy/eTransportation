const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function () { 
}

Factory.prototype.getList = Q.async(function* (query){
    try{
        let TotalSize = 0;
        let PageTotal = 0;
        let PageCurrent = parseInt(query.PageCurrent) - 1;
        let PageSize = parseInt(query.PageSize);
        let PageOffset = PageCurrent * PageSize;

        // get hits total
        let sqlTotal = `
            SELECT COUNT(*) AS Total
            FROM Truck
            WHERE Deleted = 0
        `;
        let totalRows = (yield dbContext.queryItem(sqlTotal)).Total;

        // get data
        let sqlQuery = `
            SELECT TruckId, TruckKey, TruckName, TruckNumber, Description
            FROM Truck
            WHERE Deleted = 0
            ORDER BY TruckId DESC
            OFFSET (@PageOffset) ROWS
            FETCH NEXT @PageSize ROWS ONLY
        `;
        let trucks = yield dbContext.queryList(sqlQuery, {
            PageOffset: PageOffset,
            PageSize: PageSize
        });

        let result = {
            HitsTotal: parseInt(totalRows),
            PageTotal: parseInt(Math.ceil(totalRows / PageSize)),
            PageSize: parseInt(PageSize),
            PageCurrent: parseInt(PageCurrent) + 1,
            PageData: trucks
        }
        return result;
    }
    catch(err){
        throw err;
    }    
});

Factory.prototype.getItem = Q.async(function* (TruckKey){
    try
    {        
        let sql = `
            SELECT TruckId, TruckKey, TruckName, TruckNumber, Description
            FROM Truck
            WHERE TruckKey = @TruckKey AND Deleted = 0
        `;        
        let truck = yield dbContext.queryItem(sql, { TruckKey: TruckKey });        
        return truck;
    }catch(err){        
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (truck){
    try
    {        
        let sql = `
            INSERT INTO Truck(TruckKey, TruckName, TruckNumber, Description, Author, Editor)
            VALUES (NEWID(), @TruckName, @TruckNumber, @Description, 'SYSTEM', 'SYSTEM');
        `;
        let data = yield dbContext.queryExecute(sql, truck);
        return data;
    }catch(err){
        throw err;
    }    
});

Factory.prototype.update = Q.async(function* (truck){
    try
    {        
        let sql = `
            UPDATE Truck
            SET TruckName = @TruckName, 
                TruckNumber = @TruckNumber, 
                Description = @Description            
            WHERE TruckKey = @TruckKey
        `;
        let data = yield dbContext.queryExecute(sql, truck);
        return data;
    }catch(err){
        throw err;
    }
});

Factory.prototype.delete = function(TruckKey){
    return true;
}

// Export
module.exports = new Factory;
