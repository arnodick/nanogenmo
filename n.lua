local s="hey worky worky"
print(s)

local f=io.open("books/nanogenmo.txt","w")
f:write(s)
f:close()