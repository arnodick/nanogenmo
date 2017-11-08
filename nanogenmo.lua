supper = require("supper")
nano = require("nano")

math.randomseed(os.time())

local g={}

local f=io.open("nanogenmo.txt","a")

nano.book(f,4)
--nano.sentence.build(f)

f:close()