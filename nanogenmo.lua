--[[
Copyright (c) 2017 Ashley Pringle

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
--]]

LIP = require("library/LIP")
--hpdf = require("hpdf")
supper = require("library/supper")
nano = require("library/nano")
utils = require("library/utils")

math.randomseed(os.time())

--Generator seed state thing
--it's where things like character names (main character, antagonist etc) go so they can be used when generating a book
local g={}
g.wordcount=0
g.chapter={}
g.chapter.lengthmin=1
g.chapter.lengthmax=10
g.paragraph={}
g.paragraph.lengthmin=1
g.paragraph.lengthmax=10
g.characters={}
g.characters.antagonist=string.gsub(arg[1],"^%l",string.upper) or "NO_NAME_PROTAGONIST"
g.characters.protagonist=string.gsub(arg[2],"^%l",string.upper) or "NO_NAME_ANTAGONIST"

table.insert(nano.sentence.parts.propernoun,g.characters.protagonist)
table.insert(nano.sentence.parts.propernoun,g.characters.antagonist)

local filename=arg[3] or supper.random(nano.sentence.parts.noun)
local filepath="books/"..filename..".txt"

if not utils.fileexists(filepath) then
	local f,error=io.open(filepath,"w")--open a text file and set it to be written to
	if f then
		--Book generator
		local wordamount=50000
		nano.book(f,g,wordamount)--f = file to be written to, g = the Generator, as defined above

		f:close()--close the file when we are done writing to it
		//io.write("<a href='https://www.ashleypringle.ca/nanogenmo/"..filepath.."'>Link</a>")
		return "successful yayyyy! here's <a href='https://www.ashleypringle.ca/nanogenmo/"..filepath.."'>your link!</a>"
	else
		return "not successful dannngggg \n"..error
	end
else
	io.write("That book already exists! \n")
	io.write("<a href='https://www.ashleypringle.ca/nanogenmo/"..filepath.."'>Link</a>")
end
