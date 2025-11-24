#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import SimpleHTTPServer
import SocketServer

PORT = int(os.environ.get('PORT', 3000))

class MyHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/plain')
        self.end_headers()
        self.wfile.write('Hello from Python 2!\n')
        return

    def log_message(self, format, *args):
        print "%s - - [%s] %s" % (self.client_address[0],
                                  self.log_date_time_string(),
                                  format % args)

httpd = SocketServer.TCPServer(("", PORT), MyHandler)

print "Server running on port %s" % PORT
httpd.serve_forever()
