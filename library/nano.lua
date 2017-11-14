local nano={}

local sentence={}
sentence.parts=LIP.load("library/sentenceparts.ini")
supper.names(sentence.parts)

sentence.parts.beginning.rules={"articlevowel","articleconsonant","propernoun"}
sentence.parts.articlevowel.rules={"adjectivevowel"}
sentence.parts.articleconsonant.rules={"adjectiveconsonant"}
sentence.parts.adjectivevowel.rules={"noun"}
sentence.parts.adjectiveconsonant.rules={"noun"}
sentence.parts.noun.rules={"verb","adverb","nounconjunction"}
sentence.parts.propernoun.rules={"verb","adverb","nounconjunction"}
sentence.parts.verb.rules={"verbconjunction","comma","conclusion"}
sentence.parts.adverb.rules={"verb"}
sentence.parts.nounconjunction.rules={"articlevowel","articleconsonant","adjectivevowel","adjectiveconsonant","noun","propernoun"}
sentence.parts.verbconjunction.rules={"articlevowel","articleconsonant","verb","adverb"}
sentence.parts.commaconjunction.rules={"articlevowel","articleconsonant","propernoun"}
sentence.parts.comma.rules={"commaconjunction"}

sentence.build = function(f,s)
	s=s or {}--first time in, make a new sentence, otherwise inherit unfinshed sentence from last iteration of sentence.build

	if #s==0 then--if this is the first iteration, make a sentence beginning
		table.insert(s,supper.random(sentence.parts.beginning.rules))
	else--otherwise make a sentence part based on the rules of the last part of the sentence ie: if last part is "comma", only option is "commaconjunction"
		table.insert(s,supper.random(sentence.parts[s[#s]].rules))
	end
	if s[#s]~="conclusion" then--if we haven't reached the end of the sentence, keep making new sentence parts
		sentence.build(f,s)
	else--otherwise, go through all the sentence parts and insert a random word of that part type into the string
		local p=""
		for i,v in ipairs(s) do
			local space=" "--just boring stuff to make spaces look right
			if v=="conclusion" or v=="comma" then
				space=""
			end
			local w=supper.random(sentence.parts[v])--this is the random word of type v ie: "verb" > "killed"
			if i==1 then--makes first letter of a sentence uppercase
				w=string.gsub(w,"^%l",string.upper)
			end
			p=p..space..w--put the word in the string
		end
		--print(p)
		f:write(p)--put the string in the txt file
	end
end
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

local chapter = function(f,g,length,number,depth)
	local d=depth or 1
	if d==1 then
		f:write("CHAPTER "..number.."\n")
	end
	local chapterlength=math.random(g.chapter.lengthmin,g.chapter.lengthmax)
	nano.paragraph(f,chapterlength)
	d=d+1
	if d<=length then
		nano.chapter(f,g,length,number,d)
	end
end
nano.chapter=chapter

local book = function(f,g,length,depth)
	local d=depth or 1
	if d==1 then
		f:write("BOOK TITLE\n")
	end
	nano.chapter(f,g,4,d)
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
