local nano =
{
	_VERSION        = 'nano v1.0',
    _DESCRIPTION    = 'A thing that makes books!',
    _LICENSE        = [[
Copyright (c) 2017 Ashley Pringle

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]
}

local sentence={}
sentence.parts=LIP.load("library/sentenceparts.ini")
supper.names(sentence.parts)
sentence.parts.verb.tenses=LIP.load("library/verbtenses.ini")
sentence.parts.question.tenses=LIP.load("library/questiontenses.ini")
sentence.parts.conclusion.tenses=LIP.load("library/conclusiontenses.ini")

sentence.parts.beginning.rules={"articlevowel","articleconsonant","propernoun","question"}
sentence.parts.question.rules={"articlevowel","articleconsonant","propernoun"}
sentence.parts.articlevowel.rules={"adjectivevowel","nounvowel"}
sentence.parts.articleconsonant.rules={"adjectiveconsonant","nounconsonant"}
sentence.parts.adjectivevowel.rules={"noun"}
sentence.parts.adjectiveconsonant.rules={"noun"}
sentence.parts.noun.rules={"verb","adverb","nounconjunction"}
sentence.parts.nounvowel.rules={"verb","adverb","nounconjunction"}
sentence.parts.nounconsonant.rules={"verb","adverb","nounconjunction"}
sentence.parts.propernoun.rules={"verb","adverb","nounconjunction"}
sentence.parts.verb.rules={"verbconjunction","comma","conclusion"}
sentence.parts.adverb.rules={"verb"}
sentence.parts.nounconjunction.rules={"articlevowel","articleconsonant","propernoun"}
sentence.parts.verbconjunction.rules={"articlevowel","articleconsonant","verb","adverb"}
sentence.parts.commaconjunction.rules={"articlevowel","articleconsonant","propernoun"}
sentence.parts.comma.rules={"commaconjunction"}

sentence.build = function(f,g,tense,s)
	s=s or {}--first time in, make a new sentence, otherwise inherit unfinshed sentence from last iteration of sentence.build

	if #s==0 then--if this is the first iteration, make a sentence beginning
		local part=supper.random(sentence.parts.beginning.rules)
		table.insert(s,part)--behaves like a beginning part ie: inserts one of the parts that follows a beginning
		if part=="question" then
			tense=tense.."question"
		end
	else--otherwise make a sentence part based on the rules of the last part of the sentence ie: if last part is "comma", only option is "commaconjunction"
		local part=supper.random(sentence.parts[s[#s]].rules)
		table.insert(s,part)
		if part=="question" then
			tense=tense.."question"
		end
	end
	local lastpart=s[#s]
	if lastpart~="conclusion" then--if we haven't reached the end of the sentence, keep making new sentence parts
		if lastpart~="comma" and lastpart~="beginning" then g.wordcount=g.wordcount+1 end
		sentence.build(f,g,tense,s)
	else--otherwise, go through all the sentence parts and insert a random word of that part type into the string
		local p=""
		for i,v in ipairs(s) do
			local space=" "--just boring stuff to make spaces look right
			if v=="conclusion" or v=="comma" then
				space=""
			end
			local w=""
			if sentence.parts[v].tenses then
				w=supper.random(sentence.parts[v].tenses[tense])
			else
				w=supper.random(sentence.parts[v])--this is the random word of type v ie: "verb" > "killed"
			end
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

local paragraph = function(f,g,length,tense,depth)
	local d=depth or 1
	if d==1 then
		f:write(sentence.build(f,g,tense))--TODO insert beginning here (this is always just a space? then don't have to manually make space?)
	else
		f:write(sentence.build(f,g,tense,{"beginning"}))--TODO change this to "connective" or something, and insert it here
	end
	d=d+1
	if d<=length then
		nano.paragraph(f,g,length,tense,d)
	else
		f:write("\n\n")
	end
end
nano.paragraph=paragraph

local chapter = function(f,g,length,number,tense,depth)
	local d=depth or 1
	if d==1 then
		f:write("CHAPTER "..number..": ")
		sentence.build(f,g,tense)
		f:write("\n")
	end
	local paragraphlength=math.random(g.paragraph.lengthmin,g.paragraph.lengthmax)
	nano.paragraph(f,g,paragraphlength,tense)
	d=d+1
	if d<=length then
		nano.chapter(f,g,length,number,tense,d)
	end
end
nano.chapter=chapter

local title = function(f,g)
	local titles =
	{
		function(g) return "The Adventures of "..g.characters.protagonist end,
		function(g) return "The "..string.gsub(supper.random(sentence.parts.noun),"^%l",string.upper) end,
		function(g) return g.characters.protagonist.." versus "..g.characters.antagonist end,
	}

	f:write(supper.random(titles)(g)..'\n')
	f:write("Written Entirely By: Ashley Pringle\n\n")
end

local book = function(f,g,length,depth)
	local d=depth or 1
	if d==1 then
		title(f,g)
	end
	local chapterlength=math.random(g.chapter.lengthmin,g.chapter.lengthmax)
	local tenses={"past","present"}
	local tense=supper.random(tenses)
	nano.chapter(f,g,chapterlength,d,tense)
	d=d+1
	if g.wordcount<=length then
		nano.book(f,g,length,d)
	else
		f:write("LE FIN")
	end
end
nano.book=book

local character = function(t)

end
nano.character=character

return nano
