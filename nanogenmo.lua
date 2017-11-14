LIP = require("library/LIP")
--hpdf = require("hpdf")
supper = require("library/supper")
nano = require("library/nano")

local numberlines = function(filename)
	local s=""
	local i=1
	for line in io.lines(filename) do
		s=s..i.."="..line.."\n"
		i=i+1
	end
	return s
end

math.randomseed(os.time())

--Generator seed state thing
--it's where things like character names (main character, antagonist etc) go
local g={}
g.chapter={}
g.chapter.lengthmin=1
g.chapter.lengthmax=10
g.paragraphs={}
g.paragraphs.lengthmin=1
g.paragraphs.lengthmax=10
g.characters={}

local f=io.open("books/nanogenmo.txt","a")--open a text file and set it to be appended to

print("Please enter a name for the main character! ")
g.characters.main=io.read("*line")
print(g.characters.main.." is good!")
print("Please enter a name for the antagonist! ")
g.characters.antagonist=io.read("*line")
print(g.characters.antagonist.." is BAD >(")

--Book generator
--f = file to be written to
--g = the Generator, as defined above
nano.book(f,g,4)

f:close()--close the file when we are done writing to it

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