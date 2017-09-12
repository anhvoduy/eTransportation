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
        return dbContext.queryList(sql);
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
        return dbContext.queryItem(sql, { GroupKey: GroupKey });
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
        return dbContext.queryList(sql, { GroupKey: GroupKey });        
    }
    catch(err){
        throw err;
    }
});

Factory.prototype.saveUserGroupPermission = Q.async(function* (Permission){
    try
    {
        return true;
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

Factory.prototype.create = Q.async(function* (group){
    try
    {        
        let sql = `
            INSERT INTO [Group](GroupKey, GroupName, Description, Author, Editor)
            VALUES (NEWID(), @GroupName, @Description, 'SYSTEM', 'SYSTEM');
        `;
        return dbContext.queryExecute(sql, group);
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
        return dbContext.queryExecute(sql, group);        
    }
    catch(err){
                
        throw err;
    }
});

Factory.prototype.delete = Q.async(function* (GroupKey){
    return true;
});

// Export
module.exports = new Factory;