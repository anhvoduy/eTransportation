const config = {
    user: 'sa',
    password: 's@',
    server: 'localhost\\SQL_EXPRESS',
    database: 'ndemo',    
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    }
}

module.exports = config;