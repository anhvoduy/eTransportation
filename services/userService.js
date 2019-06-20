const Q = require('q');
const crypto = require('crypto');
const dbContext = require('../lib/dbContext');
const data = require('../database/sampleData');

const Factory = function () {};

Factory.prototype.myProfile = Q.async(function* (UserKey){
    try{        
        let sql = `
            SELECT *
            FROM User
            WHERE UserKey = @UserKey
        `;
        yield dbContext.openConnection();
        let profile = yield dbContext.queryItem(sql);    
        yield dbContext.closeConnection();
        return profile;
    }
    catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.authenticate = function(username, password){
    if(username && password){
        if(username === 'admin' && password === '@dmin'){
            return true;
        }
    }
    return false;
}

Factory.prototype.getUsers = function(){
    return data.getUsers();
}

Factory.prototype.getList = Q.async(function* (query){
    try
    {
        let TotalSize = 0;
        let PageTotal = 0;
        let PageCurrent = parseInt(query.PageCurrent) - 1;
        let PageSize = parseInt(query.PageSize);
        let PageOffset = PageCurrent * PageSize;

        // get hits total
        let sqlTotal = `
            SELECT COUNT(*) AS Total
            FROM [User]
            WHERE Deleted = 0
        `;
        let totalRows = (yield dbContext.queryItem(sqlTotal)).Total;

        // get data
        let sqlQuery = `
            SELECT UserId, UserKey, UserType, UserName, DisplayName, Email, Mobile, Title, DateOfBirth, Author, Editor
            FROM [User]
            WHERE Deleted = 0 
            ORDER BY UserId DESC
            OFFSET (@PageOffset) ROWS
            FETCH NEXT @PageSize ROWS ONLY
        `;
        let users = yield dbContext.queryList(sqlQuery, {
            PageOffset: PageOffset,
            PageSize: PageSize
        });

        let result = {
            HitsTotal: parseInt(totalRows),
            PageTotal: parseInt(Math.ceil(totalRows / PageSize)),
            PageSize: parseInt(PageSize),
            PageCurrent: parseInt(PageCurrent) + 1,
            PageData: users
        }
        return result;
    }
    catch(err){
        throw err;
    }
});

Factory.prototype.getItem = Q.async(function* (UserKey){
    try{        
        let sql = `
            SELECT UserId, UserKey, UserType, UserName, DisplayName, Email, Mobile, Title, DateOfBirth, Author, Editor
            FROM [User]
            WHERE UserKey = @UserKey AND Deleted = 0
        `;        
        let user = yield dbContext.queryItem(sql, {UserKey: UserKey});
        return user;
    }
    catch(err){
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (user){
    try
    {        
        let sql = `
            INSERT INTO [User] (UserKey, UserName, DisplayName, UserType, 
                Hash, Email, Mobile, Title, Author, Editor)
            VALUES (NEWID(), @UserName, @DisplayName, @UserType,
                @Hash, @Email, @Mobile, @Title, 'SYSTEM', 'SYSTEM')
        `;
        user.Hash = crypto.createHash('sha1');
        user.UserType = 'USER';
        return yield dbContext.queryExecute(sql, user);
    }catch(err){
        throw err;
    }
});

Factory.prototype.update = Q.async(function* (user){
    try
    {        
        let sql = `
            UPDATE [User]
            SET UserName = @UserName,
                DisplayName = @DisplayName,
                Email = @Email,
                Mobile = @Mobile,
                Title = @Title,
                DateOfBirth = @DateOfBirth                                
            WHERE UserKey = @UserKey
        `;
        return yield dbContext.queryExecute(sql, user);
    }catch(err){        
        throw err;
    }
});

Factory.prototype.getMenus = function(){
    return data.getMenus();
};

module.exports = new Factory;