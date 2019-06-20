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
    }
    catch(err){        
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
    }
    catch(err){
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

Factory.prototype.saveUserGroupPermission = Q.async(function* (groupPermission){
    try
    {
        let result = [];
        for(let group of groupPermission){
            group.ModuleId = group.GroupId; 
            group.IsCreate = group.IsCreate === true ? 1 : 0;
            group.IsUpdate = group.IsUpdate === true ? 1 : 0;
            group.IsDelete = group.IsDelete === true ? 1 : 0;
            group.IsDisplay = group.IsDisplay === true ? 1 : 0;                    
            let sqlQuery = `SELECT UserGroupId FROM UserGroup WHERE UserId = @UserId AND GroupId = @GroupId AND ModuleId = @ModuleId`;
            let UserGroup = yield dbContext.queryItem(sqlQuery, {
                ModuleId: group.GroupId, // now, ModuleId = GroupId
                GroupId: group.GroupId,
                UserId: group.UserId,
            });
            if(UserGroup && UserGroup.UserGroupId){
                let sqlUpdate = `
                    UPDATE UserGroup 
                    SET IsCreate = @IsCreate, IsUpdate = @IsUpdate, IsDelete = @IsDelete, IsDisplay = @IsDisplay 
                    WHERE UserId = @UserId AND GroupId = @GroupId AND ModuleId = @ModuleId
                `;
                let data = yield dbContext.queryExecute(sqlUpdate, group);
                result.push(data);
            }            
        }
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

module.exports = new Factory;