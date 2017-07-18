const mssql = require('mssql');
const Q = require('q');
const config = require('../config/config');

const dbContext = function() {
    this.mssql = mssql;    
}

dbContext.prototype.openConnection = function(){
    return this.mssql.connect(config);
}

dbContext.prototype.closeConnection = function(){
    return this.mssql.close();
}

dbContext.prototype.queryData = function(tr, sql){
    return tr.request()
    .query(sql)
    .then(function(data){
        console.log(data);
        return data.recordset;
    });
};



dbContext.prototype.openConnectionAzure = function(){
    return new mssql.ConnectionPool(config);
}

dbContext.prototype.closeConnectionAzure = function(connection){
    return connection.close();
}

dbContext.prototype.queryDatabase = function(connection, sql){
    let deferred  = Q.defer();
    
    Q.when()
    .then(function(){
        let req = new mssql.Request(connection, sql);
        return req.query(sql).then(function(data){
            return data.recordset;
        });
    })
    .then(function(recordset){
        connection.close();
        deferred.resolve(recordset);
    })
    .catch(function(err){
        connection.close();
        deferred.reject(err);
    });

    return deferred.promise;
};

// Export
module.exports = new dbContext;