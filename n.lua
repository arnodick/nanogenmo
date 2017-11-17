local s="hey worky worky"
print(s)

local f=assert(io.open("nanogenmo.txt","w"), "Nope")
f:write(s)
f:close()