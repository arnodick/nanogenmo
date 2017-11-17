local s="hey worky worky"
print(s)

local f=assert(io.open("nanogenmo.txt","r"))
f:write(s)
f:close()