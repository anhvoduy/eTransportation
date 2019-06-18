const _ = require('lodash');
const Q = require('q');
const config = require('../config/config');

const dbContext = function() {    
    this.mssql = config.provider;
    this.logSql = false;
    console.log('System is running on:', config.server);

    new this.mssql.ConnectionPool(config).connect().then(pool => {
        this.pool = pool;
    });
}

dbContext.prototype.beginTransaction = function(){
    return true;
}

dbContext.prototype.commitTransaction = function(){
    return true;
}

dbContext.prototype.rollbackTransaction = function(){
    return true;
}

dbContext.prototype.prepareInputParameters = function(request, parameterNames, parameterValues){
    let self = this;
    for(let i=0; i< parameterNames.length; i++){
        if(typeof parameterValues[i] === 'number' && parameterValues[i] <= 999){
            request.input(parameterNames[i], self.mssql.Int, parameterValues[i]);
        } 
        else if(typeof parameterValues[i] === 'number' && parameterValues[i] > 999){
            request.input(parameterNames[i], self.mssql.Decimal, parameterValues[i]);
        } 
        else if(typeof parameterValues[i] === 'datetime'){
            request.input(parameterNames[i], self.mssql.DateTime, parameterValues[i]);
        }
        else if(typeof parameterValues[i] === 'string' && parameterValues[i].length <= 20){
            request.input(parameterNames[i], self.mssql.VarChar(20), parameterValues[i]);
        }
        else if(typeof parameterValues[i] === 'string' && parameterValues[i].length <= 50){
            request.input(parameterNames[i], self.mssql.VarChar(50), parameterValues[i]);
        } 
        else if(typeof parameterValues[i] === 'string' && parameterValues[i].length <= 250){
            request.input(parameterNames[i], self.mssql.VarChar(250), parameterValues[i]);        
        }
        else {
            request.input(parameterNames[i], self.mssql.NVarChar, parameterValues[i]);
        }
    }
    return request;
}

dbContext.prototype.prepareOutputParameters = function(request, parameterNames, parameterValues){
    let self = this;
    for(let i=0; i< parameterNames.length; i++){
        request.output(parameterNames[i], self.mssql.VarChar(50), parameterValues[i]);    
    }    
    return request;
}

dbContext.prototype.queryList = Q.async(function* (sql, obj){
    try
    {
        if(this.logSql) console.log(sql);

        // prepare command
        let parameterNames = _.keys(obj);
        let parameterValues = _.values(obj);

        // query database        
        let request = this.pool.request();
        this.prepareInputParameters(request, parameterNames, parameterValues);
        let result = yield request.query(sql);
        return result.recordset;
    }
    catch(err){
        throw err;
    }
    finally{        
        //console.log('finally');
    }
});

dbContext.prototype.queryItem = Q.async(function* (sql, obj){    
    try
    {
        if(this.logSql) console.log(sql);

        // query one item
        sql = `SELECT TOP 1 TMP.*  FROM (${sql}) TMP`; // only Ms-Sql

        // prepare command
        let parameterNames = _.keys(obj);
        let parameterValues = _.values(obj);

        // query database        
        let request = this.pool.request();
        this.prepareInputParameters(request, parameterNames, parameterValues);
        let result = yield request.query(sql);
        return result.recordset[0];
    }
    catch(err){
        throw err;
    }
    finally{
        //console.log('finally');
    }
});

dbContext.prototype.queryExecute = Q.async(function* (sql, obj){
    try
    {
        if(this.logSql) console.log(sql);        

        // prepare command
        let parameterNames = _.keys(obj);
        let parameterValues = _.values(obj);

        // query database        
        let request = this.pool.request();
        this.prepareInputParameters(request, parameterNames, parameterValues);
        let result = yield request.query(sql);
        return result;
    }
    catch(err){
        throw err;
    }
    finally{
        //console.log('finally');
    }
})





/*
dbContext.prototype.queryList = function(sql, obj){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){
        let parameterNames = _.keys(obj);
        let parameterValues = _.values(obj);
        let request = self.connection.request();
        request = self.prepareInputParameters(request, parameterNames, parameterValues);
        return request.query(sql).then(function(data){
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
*/



/*
dbContext.prototype.queryItem = function(sql, obj){
    let self = this;
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){
        // query one item
        sql = `SELECT TOP 1 TMP.*  FROM (${sql}) TMP`; // only Ms-Sql
    })
    .then(function(){
        let parameterNames = _.keys(obj);
        let parameterValues = _.values(obj);
        let request = self.connection.request();
        request = self.prepareInputParameters(request, parameterNames, parameterValues);
        return request.query(sql).then(function(data){
            return data.recordset[0];
        });
    })
    .then(function(record){
        deferred.resolve(record);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
};
*/



/*
dbContext.prototype.queryExecute = function(sql, obj){
    let self = this;    
    let deferred  = Q.defer();

    Q.when()
    .then(function(){
        if(self.logSql) console.log(sql);
    })
    .then(function(){
        let parameterNames = _.keys(obj);
        let parameterValues = _.values(obj);
        let request = self.connection.request();
        request = self.prepareInputParameters(request, parameterNames, parameterValues);
        return request.query(sql);
    })
    .then(function(record){
        deferred.resolve(record);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
};
*/



// Export
module.exports = new dbContext;