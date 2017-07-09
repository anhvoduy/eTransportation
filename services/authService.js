const _ = require('lodash');
const Q = require('q');
const jwt = require('jsonwebtoken');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const dbContext = require('../lib/dbContext');

// Authenticate Service
const auth = {};
auth.setup = function (app) {
    app.use(passport.initialize());    
};

auth.checkAuthentication = function () {    
    return function (req, res, next) {
        console.log('checkAuthentication() ...');
        next();
    };
};

auth.getInformationSchema = function(){
    let deferred  = Q.defer();
    let tables;

    Q.when()
    .then(function(){
        return dbContext.openConnection();
    })
    .then(function(pool){
		let sql = 'SELECT * FROM INFORMATION_SCHEMA.TABLES';
        return dbContext.queryData(pool, sql)
		.then(function(data){
			tables = data;
		});
    })
    .then(function(data){
        dbContext.closeConnection();
    })
    .then(function(){
        deferred.resolve(tables);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
}

module.exports = auth;
