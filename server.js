const express = require('express');
const http = require('http');
const path = require("path");

const server = express();
//server.set('port', process.env.PORT || 3000);
server.set('port', 3000);

server.use('/admin', express.static(path.join(__dirname, 'admin'), { index: 'default.html' }));
server.use('/publish', express.static(path.join(__dirname, 'publish'), { index: 'default.html' }));
server.use('/transport', express.static(path.join(__dirname, 'transport'), { index: 'default.html' }));

server.use('/', express.static(path.join(__dirname, 'publish'), { index: 'default.html' }));

module.exports = server;