#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import http.server
import os
import socketserver

PORT = int(os.environ.get("PORT", 3000))


class MyHandler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello from Python 3.9!\n")
        return

    def log_message(self, format, *args):
        print(
            f"{self.client_address[0]} - - [{self.log_date_time_string()}] {format % args}"
        )


with socketserver.TCPServer(("", PORT), MyHandler) as httpd:
    print(f"Server running on port {PORT}")
    httpd.serve_forever()
