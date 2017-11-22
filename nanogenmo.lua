LIP = require("library/LIP")
--hpdf = require("hpdf")
supper = require("library/supper")
nano = require("library/nano")

math.randomseed(os.time())

--Generator seed state thing
--it's where things like character names (main character, antagonist etc) go
local g={}
g.wordcount=0
g.chapter={}
g.chapter.lengthmin=1
g.chapter.lengthmax=10
g.paragraph={}
g.paragraph.lengthmin=1
g.paragraph.lengthmax=10
g.characters={}
g.characters.antagonist=arg[1]
g.characters.protagonist=arg[2]

local filename=supper.random(nano.sentence.parts.noun)
local f,error=io.open("books/"..filename..".txt","a")--open a text file and set it to be appended to

if f then
	f:write("Title: "..filename.."\n")

	--Book generator
	local wordamount=50000
	nano.book(f,g,wordamount)--f = file to be written to, g = the Generator, as defined above

	f:close()--close the file when we are done writing to it
	--io.write("<a href='https://www.ashleypringle.ca/nanogenmo/books/"..filename..".txt'>Link</a>")
	io.write("<a href='https://www.ashleypringle.ca/nanogenmo/books/"..filename..".txt'>Link</a>")
	return "successful yayyyy"
else
	return "not successful dannngggg \n"..error
end



--[[
f=io.open("vowelnounlistnum.txt","w")
local s=numberlines("vowelnounlist.txt")
f:write(s)
f:close()
--]]
--[[
local vowellines = function(filename)
	s=""
	for line in io.lines(filename) do
		local firstletter=string.lower(string.sub(line,1,1))
		if firstletter=="a" or firstletter=="e" or firstletter=="i" or firstletter=="o" or firstletter=="u" then
			s=s..line.."\n"
		end
	end
	return s
end

local consonantlines = function(filename)
	s=""
	for line in io.lines(filename) do
		local firstletter=string.lower(string.sub(line,1,1))
		if firstletter~="a" and firstletter~="e" and firstletter~="i" and firstletter~="o" and firstletter~="u" then
			s=s..line.."\n"
		end
	end
	return s
end

local numberlines = function(filename)
	local s=""
	local i=1
	for line in io.lines(filename) do
		s=s..i.."="..line.."\n"
		i=i+1
	end
	return s
end
--]]

--[[
f=io.open("books/nanogenmo.txt","r")
local pdf = hpdf.New()
if pdf then
	local page=hpdf.AddPage(pdf)
	hpdf.Page_SetWidth(page,300)
	hpdf.Page_SetHeight(page,200)
	local height=hpdf.Page_GetHeight(page)
	local width=hpdf.Page_GetWidth(page)
	local font=hpdf.GetFont(pdf,"Helvetica")
	hpdf.Page_SetFontAndSize(page,font,24)
	hpdf.Page_SetLineWidth(page,0.25)
	hpdf.Page_BeginText(page)
	hpdf.Page_TextOut(page,60,height-60,f:read("*a"))
	hpdf.Page_EndText(page)
	hpdf.SaveToFile(pdf,"test.pdf")
	hpdf.Free(pdf)
end
f:close()
--]]