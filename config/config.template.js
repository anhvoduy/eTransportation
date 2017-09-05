const mssql = require('mssql');

const configMySql = {
    provider: 'mysql'
}

const configMsSql = {
    provider: mssql,
    user: 'sa',
    password: 's@',    
    server: 'SONYVAIO\\SQL_2014',
    database: 'ndemo',    
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    }
}

const configAzure = {
    provider: mssql,
    user: 'invdemo',
    password: 'inv@demo2017',
    server: 'invdemo.database.windows.net',
    database: 'ndemo',
    port: 1433,
    options: {        
        encrypt: true
    }
}

module.exports = configAzure;