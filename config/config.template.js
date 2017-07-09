const config = {
    user: 'sa',
    password: 's@',
    //server: 'localhost\\SQL_EXPRESS',
    server: 'SONYVAIO\\SQL_2014',
    database: 'ndemo',    
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    }
}

module.exports = config;