LIP = require("LIP")
supper = require("supper")
nano = require("nano")

local numberfiles = function(filename)
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

local f=io.open("nanogenmo.txt","a")

nano.book(f,4)
--nano.sentence.build(f)

f:close()