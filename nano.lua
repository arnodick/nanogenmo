local nano={}


local sentence={}
sentence.parts={}
sentence.parts.article={"a","an","the"}
sentence.parts.adjective={"white","smelly","fortuitous"}
sentence.parts.noun={"Car","Ball","Donkey"}
sentence.parts.verb={"read","killed","peed"}
sentence.parts.adverb={"slowly","lugubriously","incrementally"}
sentence.parts.conjunction={"and","or"}
sentence.parts.conclusion={".","!","?"}
supper.names(sentence.parts)

sentence.declarative = function(words)
	local n1,n2=math.random(#words),math.random(#words)
	return "The "..words[n1].." is not like the "..words[n2]..". "
end

sentence.exclamatory = function(words)
	return "Exclamatory! "
end

sentence.build = function(f,s)
	s=s or {}
	table.insert(s,supper.random(sentence.parts.names))
	if s[#s]~="conclusion" then
		sentence.build(f,s)
	else
		local p=""
		for k,v in ipairs(s) do
			p=p..supper.random(sentence.parts[v]).." "
		end
		print(p)
		f:write(p)
	end
end
supper.names(sentence)
nano.sentence=sentence

local paragraph = function(f,length,depth)
	local d=depth or 1
	--local t=sentence.names[math.random(#sentence.names)]
	--f:write( sentence[t]({"jeep","moss","person","bulk","rest","boar","crisis"}) )
	f:write( sentence.build(f))
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