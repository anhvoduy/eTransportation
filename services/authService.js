const Q = require('q');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const dbContext = require('../lib/dbContext');
const userService = require('./userService');

// Authenticate Service
// https://scotch.io/tutorials/easy-node-authentication-setup-and-local
const auth = {};

auth.setup = function (app) {
    app.use(passport.initialize());    
    passport.use(new LocalStrategy(
        function (username, password, done) {
            var data = {
                success: userService.authenticate(username, password),
                user: { username: username, password: password }
            };
            //console.log('Verify Username & Password ...');
            return done(null, data);
        }
    ));   
};

auth.getInformationSchema = function(){
    let deferred  = Q.defer();
    let tables;

    Q.when()    
    .then(function(){
		let sql = 'SELECT * FROM INFORMATION_SCHEMA.TABLES';
        return dbContext.queryList(sql)
		.then(function(data){
			tables = data;
        });
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