#!/usr/local/bin/lua52
io.write('Content-Type: text/plain\n\n', "Writing A Book!", '\n', '...', '\n')
if arg[1] then
	io.write(arg[1])
else
	io.wrote("nope")
end
require("nanogenmo")
io.write('Done!', '\n')