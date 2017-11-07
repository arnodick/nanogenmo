supper = require("supper")
nano = require("nano")

math.randomseed(os.time())

local g={}

local f=io.open("nanogenmo.txt","a")

nano.book(f,4)

--nano.chapter(f,4)


--[[
local t=sentence.names[math.random(#sentence.names)]
g.sentence=sentence[t]({"jeep","moss","person","bulk","rest","boar","crisis"})
print(g.sentence)
--]]

f:close()