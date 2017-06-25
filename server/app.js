var http = require('http');

http.createServer(server).listen(server.get('port'), function () {
    console.log('eInventory Web & API is running on port:' + server.get('port'));    
});