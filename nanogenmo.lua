LIP = require("library/LIP")
--hpdf = require("hpdf")
supper = require("library/supper")
nano = require("library/nano")
--utils = require("library/utils")

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
g.characters.antagonist=arg[1] or "NO_NAME_PROTAGONIST"
g.characters.protagonist=arg[2] or "NO_NAME_ANTAGONIST"

--for i=1,10 do
	table.insert(nano.sentence.parts.propernoun,g.characters.protagonist)
	table.insert(nano.sentence.parts.propernoun,g.characters.antagonist)
--end

local filename=arg[3] or supper.random(nano.sentence.parts.noun)
local f,error=io.open("books/"..filename..".txt","a")--open a text file and set it to be appended to
g.title=filename

if f then
	--Book generator
	local wordamount=50000
	nano.book(f,g,wordamount)--f = file to be written to, g = the Generator, as defined above

	f:close()--close the file when we are done writing to it
	io.write("<a href='https://www.ashleypringle.ca/nanogenmo/books/"..filename..".txt'>Link</a>")
	return "successful yayyyy"
else
	return "not successful dannngggg \n"..error
end