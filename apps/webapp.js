var http = require('http');
var args = process.argv.slice(2);
http.createServer(function (req, res) {
	var status = 200;
	res.writeHead(status, {'Content-Type': 'text/plain'});
	res.end('Hello World\n' + args[0]);
	console.log(req.method + ' ' + req.url + ' ' + status);
}).listen(args[1]);
console.log('Server running at http://' + args[0] + ':' + args[1] + '/');