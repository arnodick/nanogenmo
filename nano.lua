local nano={}


local sentence={}
sentence.parts={}
sentence.parts.article={"a","an","the"}
sentence.parts.adjective={"white","smelly","fortuitous"}
sentence.parts.noun={"Car","Ball","Donkey"}
sentence.parts.verb={"read","killed","peed"}
sentence.parts.adverb={"slowly","lugubriously","incrementally"}
sentence.parts.nounconjunction={"and","or"}
sentence.parts.verbconjunction={"and","or"}
sentence.parts.conclusion={".","!","?"}

supper.names(sentence.parts)

sentence.parts.article.rules={"adjective","noun"}
sentence.parts.adjective.rules={"noun"}
sentence.parts.noun.rules={"verb","adverb","nounconjunction","conclusion"}
sentence.parts.verb.rules={"verbconjunction","conclusion"}
sentence.parts.adverb.rules={"verb"}
sentence.parts.nounconjunction.rules={"article","adjective","noun"}
sentence.parts.verbconjunction.rules={"article","verb","adverb"}
--sentence.parts.conclusion.rules={"verb","noun","adverb"}

sentence.declarative = function(words)
	local n1,n2=math.random(#words),math.random(#words)
	return "The "..words[n1].." is not like the "..words[n2]..". "
end

sentence.exclamatory = function(words)
	return "Exclamatory! "
end

sentence.build = function(f,s)
	s=s or {}
	if #s==0 then
		table.insert(s,"article")
	else
		table.insert(s,supper.random(sentence.parts[s[#s]].rules))
	end
	if s[#s]~="conclusion" then
		sentence.build(f,s)
	else
		local p=""
		for i,v in ipairs(s) do
			local space=" "
			if v=="conclusion" then
				space=""
			end
			local w=supper.random(sentence.parts[v])
			if i==1 then
				w=string.gsub(w,"^%l",string.upper)
			end
			p=p..space..w
		end
		--print(p)
		f:write(p)
	end
end
--supper.names(sentence)
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
