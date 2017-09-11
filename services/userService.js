const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
}

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

Factory.prototype.getList = Q.async(function* (){
    try{        
        let sql = `
            SELECT UserId, UserKey, UserType, UserName, DisplayName, Email, Mobile, Tel, Title, DateOfBirth, Author, Editor
            FROM [User]
            WHERE Deleted = 0 
            ORDER BY UserId DESC
        `;
        yield dbContext.openConnection();
        let users = yield dbContext.queryList(sql);    
        yield dbContext.closeConnection();
        return users;
    }
    catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.getItem = Q.async(function* (UserKey){
    try{        
        let sql = `
            SELECT UserId, UserKey, UserType, UserName, DisplayName, Email, Mobile, Tel, Title, DateOfBirth, Author, Editor
            FROM [User]
            WHERE UserKey = @UserKey AND Deleted = 0
        `;
        yield dbContext.openConnection();
        let user = yield dbContext.queryItem(sql, {UserKey: UserKey});    
        yield dbContext.closeConnection();
        return user;
    }
    catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.create = function(){
    return true;
}

Factory.prototype.update = function(){
    return true;
}

Factory.prototype.delete = function(){
    return true;
}

Factory.prototype.getMenus = function(){
    return data.getMenus();
}

// Export
module.exports = new Factory;
