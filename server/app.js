const http = require('http');
const server = require('./server');

http.createServer(server).listen(server.get('port'), function () {
    console.log('eInventory Web & API is running on port:' + server.get('port'));    
});

// const http = require('http');
// const server = http.createServer(function(request, response) {
//     response.writeHead(200, {"Content-Type": "text/plain"});
//     response.end("Hello Azure!");
// });

// const port = process.env.PORT || 1337;
// server.listen(port);
// console.log("Server running at http://localhost:%d", port);
