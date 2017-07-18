const configMySql = {
    user: 'sa',
    password: 's@',    
    server: 'SONYVAIO\\SQL_2014',
    database: 'estore',    
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    }
}

const configAzure = {
    user: 'invdemo',
    password: 'inv@demo2017',
    server: 'invdemo.database.windows.net',
    database: 'estore',
    port: 1433,
    options: {        
        encrypt: true
    }
}

module.exports = configAzure;