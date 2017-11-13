local nano={}

local sentence={}
sentence.parts=LIP.load("library/sentenceparts.ini")

supper.names(sentence.parts)

--sentence.parts.article.rules={"adjective","noun"}
sentence.parts.articlevowel.rules={"adjectivevowel"}
sentence.parts.articleconsonant.rules={"adjectiveconsonant"}
--sentence.parts.adjective.rules={"noun"}
sentence.parts.adjectivevowel.rules={"noun"}
sentence.parts.adjectiveconsonant.rules={"noun"}
--sentence.parts.noun.rules={"verb","adverb","nounconjunction","conclusion"}
sentence.parts.noun.rules={"verb","adverb","nounconjunction"}
sentence.parts.propernoun.rules={"verb","adverb","nounconjunction"}
sentence.parts.verb.rules={"verbconjunction","comma","conclusion"}
sentence.parts.adverb.rules={"verb"}
sentence.parts.nounconjunction.rules={"articlevowel","articleconsonant","adjectivevowel","adjectiveconsonant","noun","propernoun"}
sentence.parts.verbconjunction.rules={"articlevowel","articleconsonant","verb","adverb"}
sentence.parts.commaconjunction.rules={"articlevowel","articleconsonant","propernoun"}
sentence.parts.comma.rules={"commaconjunction"}

sentence.build = function(f,s)
	s=s or {}
	if #s==0 then
		local r=math.random(3)
		if r==1 then
			table.insert(s,"articlevowel")
		elseif r==2 then
			table.insert(s,"articleconsonant")
		else
			table.insert(s,"propernoun")
		end
	else
		table.insert(s,supper.random(sentence.parts[s[#s]].rules))
	end
	if s[#s]~="conclusion" then
		sentence.build(f,s)
	else
		local p=""
		for i,v in ipairs(s) do
			local space=" "
			if v=="conclusion" or v=="comma" then
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

local book = function(f,g,length,depth)
	local d=depth or 1
	if d==1 then
		f:write("BOOK TITLE\n")
	end
	nano.chapter(f,4,d)
	d=d+1
	if d<=length then
		nano.book(f,g,length,d)
	end
end
nano.book=book

local character = function(t)

end
nano.character=character

return nano
