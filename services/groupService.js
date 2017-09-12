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
        let truck = yield dbContext.queryList(sql);        
        return truck;
    }catch(err){
        
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
        let truck = yield dbContext.queryItem(sql, { GroupKey: GroupKey });        
        return truck;
    }catch(err){
        
        throw err;
    }
});

Factory.prototype.getUserGroupPermission = Q.async(function* (GroupKey){
    try
    {        
        let sql = `
            SELECT G.GroupKey, G.GroupName, 
                UG.GroupId, UG.UserId, U.UserName, U.DisplayName,
                UG.IsCreate, UG.IsUpdate, UG.IsDelete, UG.IsDisplay
            FROM [Group] G 
                INNER JOIN [UserGroup] UG ON G.GroupId = UG.GroupId
                INNER JOIN [User] U ON UG.UserId = U.UserId
            WHERE G.GroupKey = @GroupKey
            ORDER BY U.UserId        
        `;
        return yield dbContext.queryList(sql, { GroupKey: GroupKey });        
    }catch(err){        
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
        let result = yield dbContext.queryExecute(sql, group);
        return result;
    }
    catch(err){
                
        throw err;
    }
});

Factory.prototype.linkUserToGroup = Q.async(function* (groupKey, userKey){
    try
    {        
        return true;
    }
    catch(err){
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
        let result = yield dbContext.queryExecute(sql, group);
        return result;
    }
    catch(err){
                
        throw err;
    }
});

Factory.prototype.delete = function(GroupKey){
    return true;
}

// Export
module.exports = new Factory;