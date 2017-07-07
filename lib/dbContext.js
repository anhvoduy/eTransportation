const mssql = require('mssql');
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
        return data.recordset;
    });
};

// Export
module.exports = new dbContext;