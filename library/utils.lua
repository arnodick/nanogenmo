local utils = {}

--[[
--use these functions like this
f=io.open("/wordlists/vowelnounlistnum.txt","w")
local s=numberlines("vowelnounlist.txt")
f:write(s)
f:close()
--]]

utils.vowellines = function(filename)
	s=""
	for line in io.lines(filename) do
		local firstletter=string.lower(string.sub(line,1,1))
		if firstletter=="a" or firstletter=="e" or firstletter=="i" or firstletter=="o" or firstletter=="u" then
			s=s..line.."\n"
		end
	end
	return s
end

utils.consonantlines = function(filename)
	s=""
	for line in io.lines(filename) do
		local firstletter=string.lower(string.sub(line,1,1))
		if firstletter~="a" and firstletter~="e" and firstletter~="i" and firstletter~="o" and firstletter~="u" then
			s=s..line.."\n"
		end
	end
	return s
end

utils.numberlines = function(filename)
	local s=""
	local i=1
	for line in io.lines(filename) do
		s=s..i.."="..line.."\n"
		i=i+1
	end
	return s
end

utils.fileexists = function(name)
	local f=io.open(name,"r")
	if f~=nil then
		io.close(f)
		return true
	else
		return false
	end
end

return utils