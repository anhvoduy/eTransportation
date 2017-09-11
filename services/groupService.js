const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function () { 
}

Factory.prototype.getList = Q.async(function* (){
    try
    {        
        let sql = `
            SELECT GroupId, GroupKey, GroupName, Description
            FROM [Group]
            WHERE Deleted = 0
            ORDER BY GroupId DESC
        `;
        yield dbContext.openConnection();
        let truck = yield dbContext.queryList(sql);
        yield dbContext.closeConnection();
        return truck;
    }catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.getItem = Q.async(function* (GroupKey){
    try
    {        
        let sql = `
            SELECT GroupId, GroupKey, GroupName, Description
            FROM [Group]
            WHERE GroupKey = @GroupKey AND Deleted = 0
        `;
        yield dbContext.openConnection();
        let truck = yield dbContext.queryItem(sql, { GroupKey: GroupKey });
        yield dbContext.closeConnection();
        return truck;
    }catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (group){
    try
    {        
        let sql = `
            INSERT INTO [Group](GroupKey, GroupName, Description, Author, Editor)
            VALUES (NEWID(), @GroupName, @Description, 'SYSTEM', 'SYSTEM');
        `;
        yield dbContext.openConnection();
        let result = yield dbContext.queryExecute(sql, group);
        yield dbContext.closeConnection();
        return result;
    }
    catch(err){
        yield dbContext.closeConnection();        
        throw err;
    }
});

Factory.prototype.update = Q.async(function* (group){
    try
    {        
        let sql = `
            UPDATE [Group]
            SET GroupName = @GroupName,                 
                Description = @Description
            WHERE GroupKey = @GroupKey
        `;
        yield dbContext.openConnection();
        let result = yield dbContext.queryExecute(sql, group);
        yield dbContext.closeConnection();
        return result;
    }
    catch(err){
        yield dbContext.closeConnection();        
        throw err;
    }
});

Factory.prototype.delete = function(GroupKey){
    return true;
}

// Export
module.exports = new Factory;