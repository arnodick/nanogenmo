#!/usr/local/bin/lua52
io.write('Content-Type: text/plain\n\n', "Writing A Book!", '\n', '...')
args=cgi.FieldStorage()
io.write(args["name"])
require("nanogenmo")
io.write('Done!', '\n')