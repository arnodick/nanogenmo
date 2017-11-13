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

--TODO this will be the generator seed state thing
--it's where things like character names (main character, antagonist etc) go
local g={}
g.names={}

local f=io.open("books/nanogenmo.txt","a")

print("Please enter a name for the main character! ")
g.names.maincharacter=io.read("*line")
print(g.names.maincharacter.." is good!")
print("Please enter a name for the antagonist! ")
g.names.antagonist=io.read("*line")
print(g.names.antagonist.." is BAD >(")

nano.book(f,g,4)
--nano.sentence.build(f)

f:close()

f=io.open("books/nanogenmo.txt","r")

---[[
local pdf = hpdf.New()
if pdf then
	local page=hpdf.AddPage(pdf)
	local height=hpdf.Page_GetHeight(page)
	local width=hpdf.Page_GetWidth(page)
	local font=hpdf.GetFont(pdf,"Helvetica")
	hpdf.Page_SetFontAndSize(page,font,24)
	hpdf.Page_BeginText(page)
	hpdf.Page_TextOut(page,60,height-60,f:read("*a"))
	hpdf.Page_EndText(page)
	hpdf.SaveToFile(pdf,"test.pdf")
	hpdf.Free(pdf)
end
--]]

f:close()


