// Dependencies
var jwt = require('jsonwebtoken');
var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;

// Authenticate Service
var auth = {};
auth.setup = function (app) {
    app.use(passport.initialize());    
};

auth.checkAuthentication = function () {    
    return function (req, res, next) {
        console.log('checkAuthentication() ...');
        next();
    };
};

module.exports = auth;
