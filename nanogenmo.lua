local supper = require("supper")

math.randomseed(os.time())

local g={}

local sentence={}
sentence.declarative = function(words)
	local n1,n2=math.random(#words),math.random(#words)
	return "The "..words[n1].." is not like the "..words[n2].."."
end

sentence.exclamatory = function(words)
	return "Exclamatory!"
end
supper.names(sentence)

local t=sentence.names[math.random(#sentence.names)]
--g.sentence=supper.run(sentence,{t},{"jeep","moss","person","bulk","rest","boar","crisis"})
g.sentence=sentence[t]({"jeep","moss","person","bulk","rest","boar","crisis"})
print(g.sentence)

local f=io.open("nanogenmo.txt","a")
f:write(g.sentence)
f:close()