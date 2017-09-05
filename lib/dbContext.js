const _ = require('lodash');
const Q = require('q');
const config = require('../config/config');

const dbContext = function() {    
    this.mssql = config.provider;
    this.logSql = false;
    console.log('system is running on Server:', config.server);
}

dbContext.prototype.openConnection = function(){    
    return this.mssql.connect(config);
}

dbContext.prototype.closeConnection = function(pool){
    pool.close();
    return this.mssql.close();
}

dbContext.prototype.queryDatabase = function(pool, sql){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){
        let req = new self.mssql.Request(pool, sql);
        return req.query(sql).then(function(data){
            return data.recordset;
        });
    })
    .then(function(recordset){
        deferred.resolve(recordset);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
};

dbContext.prototype.queryList = function(pool, sql){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){
        let req = new self.mssql.Request(pool, sql);
        return req.query(sql).then(function(data){
            return data.recordset;
        });
    })
    .then(function(recordset){
        deferred.resolve(recordset);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
};

dbContext.prototype.queryItem = function(pool, sql){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        sql = `SELECT TOP 1 TMP.*  FROM (${sql}) TMP`;
        if(self.logSql) console.log(sql);        
    })
    .then(function(){        
        let req = new self.mssql.Request(pool, sql);
        return req.query(sql).then(function(data){
            return data.recordset[0];
        });
    })
    .then(function(recordset){
        deferred.resolve(recordset);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
};

dbContext.prototype.queryExecute = function(pool, sql){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){
        let req = new self.mssql.Request(pool, sql);
        return req.execute(sql).then(function(data){
            return data.recordset[0];
        });
    })
    .then(function(recordset){
        deferred.resolve(recordset);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
};

// Export
module.exports = new dbContext;