local s="hey worky worky"
print(s)

local f,error=assert(io.open("nanogenmo.txt","r"))
print(error)
f:write(s)
f:close()