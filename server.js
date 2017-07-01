const express = require('express');
const http = require('http');
const path = require("path");

const server = express();
//server.set('port', process.env.PORT || 3000);
server.set('port', 3000);

server.use('/admin', express.static(path.join(__dirname, 'admin'), { index: 'default.html' }));
server.use('/publish', express.static(path.join(__dirname, 'publish'), { index: 'default.html' }));
server.use('/transport', express.static(path.join(__dirname, 'transport'), { index: 'default.html' }));


const webpath = path.join(__dirname, 'transport');
server.use('/', express.static(webpath, { index: 'default.html' }));
server.use('/about-us', express.static(webpath , { index: 'about-us.html' }));
server.use('/contact-us', express.static(webpath, { index: 'contact-us.html' }));
server.use('/login', express.static(webpath, { index: 'login.html' }));

module.exports = server;