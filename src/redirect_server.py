#!/usr/bin/env python

import http.server
import socketserver
import sys

PORT = int(sys.argv[1])

from kolibri.utils import server


def kolibri_port():
    code, _ = server.get_urls()
    if code == server.STATUS_RUNNING:
        _, _, port = server.get_status()
        return port
    else:
        return None


class RedirectHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        port = kolibri_port()
        if port:
            return self.redirect(port)
        else:
            return http.server.SimpleHTTPRequestHandler.do_GET(self)

    def redirect(self, port):
        self.send_response(302)
        self.send_header("Location", "http://127.0.0.1:{}/".format(port))
        self.end_headers()


socketserver.TCPServer.allow_reuse_address = True
with socketserver.TCPServer(("", PORT), RedirectHandler) as httpd:
    print("serving at port", PORT)
    httpd.serve_forever()
