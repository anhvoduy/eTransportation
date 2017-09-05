const _ = require('lodash');
const Q = require('q');
const config = require('../config/config');

const dbContext = function() {    
    this.mssql = config.provider;
    this.logSql = false;
    console.log('system is running on Server:', config.server);
}

dbContext.prototype.openConnection = function(){
    let self = this;
    return this.mssql.connect(config).then(function(pool){
        self.pool = pool;
    });
}

dbContext.prototype.closeConnection = function(){
    let self = this;
    if(self.pool){
        return self.pool.close().then(function(){
            return self.mssql.close();
        });
    }    
}

dbContext.prototype.prepareParameters = function(parameters){
    return true;
}

dbContext.prototype.queryList = function(sql){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){
        return self.pool.request()
        .query(sql).then(function(data){
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

dbContext.prototype.queryItem = function(sql, CustomerKey){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        sql = `SELECT TOP 1 TMP.*  FROM (${sql}) TMP`; // only Ms-Sql
        if(self.logSql) console.log(sql);        
    })
    .then(function(){        
        return self.pool.request()
        .input('CustomerKey', self.mssql.VarChar(50), CustomerKey)
        .query(sql)
        .then(function(data){
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

dbContext.prototype.queryExecute = function(sql){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){        
        return self.pool.request()
        .execute(sql)
        .then(function(data){
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