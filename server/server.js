var express = require('express');
var http = require('http');
var path = require("path");

var server = express();
//server.set('port', process.env.PORT || 3000);
server.set('port', 3000);

server.use('/', express.static(path.join(__dirname, 'publish'), { index: 'default.html' }));
server.use('/admin', express.static(path.join(__dirname, 'admin'), { index: 'default.html' }));

module.exports = server;