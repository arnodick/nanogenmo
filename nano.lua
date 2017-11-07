local nano={}

local sentence={}
sentence.declarative = function(words)
	local n1,n2=math.random(#words),math.random(#words)
	return "The "..words[n1].." is not like the "..words[n2]..". "
end

sentence.exclamatory = function(words)
	return "Exclamatory! "
end
supper.names(sentence)
nano.sentence=sentence

local paragraph = function(f,length,depth)
	local d=depth or 1
	local t=sentence.names[math.random(#sentence.names)]
	f:write( sentence[t]({"jeep","moss","person","bulk","rest","boar","crisis"}) )
	d=d+1
	if d<=length then
		nano.paragraph(f,length,d)
	else
		f:write("\n\n")
	end
end
nano.paragraph=paragraph

local chapter = function(f,length,number,depth)
	local d=depth or 1
	if d==1 then
		f:write("CHAPTER "..number.."\n")
	end
	nano.paragraph(f,4)
	d=d+1
	if d<=length then
		nano.chapter(f,length,number,d)
	end
end
nano.chapter=chapter

local book = function(f,length,depth)
	local d=depth or 1
	if d==1 then
		f:write("BOOK TITLE\n")
	end
	nano.chapter(f,4,d)
	d=d+1
	if d<=length then
		nano.book(f,length,d)
	end
end
nano.book=book

return nano