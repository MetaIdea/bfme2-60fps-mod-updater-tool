FPS = 60

TIMEFACTOR = FPS/30
SPEEDFACTOR = 1/(FPS/30)
SPEEDFACTOR_ = "*" .. SPEEDFACTOR
TIMEFACTOR_ = "*" .. TIMEFACTOR

dofile("ModDefinitionScript.lua")

function SwapNumbersInline(line)
	--return newline,count = string.gsub(line, '%s+(%d[%d.,]*)%s+(%d[%d.,]*)[%s]*', " %2 %1 ")
end

function WriteToFile(output, file)
  local filehandle = io.open(file, "w")
  if filehandle ~= nil then
    filehandle:write(output)
    filehandle:flush()
    filehandle:close()
  end
end

function WriteToFileAppend(output, file)
  local filehandle = assert(io.open(file, "a+"),"io.open: Cannot open file to write: "..file)
  if filehandle ~= nil then
    filehandle:write(output)
    filehandle:flush()
    filehandle:close()
  end
end

function WriteNewFile(output, file)
	local filehandle = io.open(file, "w")
    filehandle:write(output)
    filehandle:flush()
    filehandle:close()
end

function ParseTextFileIntoTable(file)
	local filehandle = assert(io.open(file, "r"),"io.open: Cannot open file to load: "..file)
	local LineTable = {}
	local LineCount = 0
	local FileSize = filehandle:seek("end")
	filehandle:seek("set")
	if FileSize ~= nil and FileSize ~= 0 then
		line = assert(filehandle:read("l"),"read: cannot read line from file: "..file)
		while line ~= nil do 
			LineCount=LineCount+1
			table.insert(LineTable, line) 
			line = filehandle:read("l")
		end
		filehandle:close()
		return LineTable, LineCount
	else
		return {}
	end
end

function ConvertLineTableToText(LineTable)
	return table.concat(LineTable, "\n")
end

function IsLineCommented(line)
	local SubStr = string.sub(line, 1, string.find(line, string.match(line, "%w+")))
	if string.find(SubStr,";") or string.find(SubStr,[[//]]) then return true
	else return false end
end

function UncommentIniLine(line, Keyword)
	if string.find(line, Keyword) then
		local SubStr = string.sub(line, 1, string.find(Keyword))
		if string.find(SubStr,";") or string.find(SubStr,[[//]]) then
			local SubStrNew = string.gsub(string.gsub(SubStr,";",""),[[//]],"")
			return string.gsub(line, SubStr, SubStrNew)
		end
	end
end

function UncommentIniLines(TextFileTable, Keyword)
	for i=1,#TextFileTable,1 do
		if string.find(line, Keyword) then
			local SubStr = string.sub(line, 1, string.find(Keyword))
			if string.find(SubStr,";") or string.find(SubStr,[[//]]) then
				local SubStrNew = string.gsub(string.gsub(SubStr,";",""),[[//]],"")
				TextFileTable[i]=string.gsub(TextFileTable[i], SubStr, SubStrNew)
			end
		end
	end
end

function CheckForEntry(TextFileTable, Keyword)
	for i=1,#TextFileTable,1 do
		if (string.find(TextFileTable[i], Keyword)) then return true end
	end
end

function findnth(str, nth)
	local array = {}
	for i in string.gmatch(str, '%s+%d[%d.,]*') do
		table.insert(array, string.gsub(i, "%s+", ""))
	end
	return array[nth]
end

function ExtractNumbersFromLine(str)
	local array = {}
	for i in string.gmatch(str, '%s+%d[%d.,]*') do
	local Extract = string.gsub(i, "%s+", "")
		table.insert(array, Extract)
	end
	return array
end

function ExtractNumbersIniFromLine(line)
	local NumberTable = {}
	--local SubString = string.sub(line,string.find(line,string.gmatch(line, '%s+%d[%d.,]*')))
	if string.find(line, "//") then
		line=string.sub(line,1,string.find(line, [[//]])-1)
	elseif string.find(line, ";") then
		line=string.sub(line,1,string.find(line, ";")-1)
	end
	for Number in string.gmatch(line, '%s+%d[%d.,]*') do
		local Extract = string.gsub(Number, "%s+", "")
		table.insert(NumberTable, Extract)
	end
	return NumberTable
end
	
function DoMathOperationsOnNumbersInLines(file, KeyWordTable)
	print(file)
	local TextFileTable = ParseTextFileIntoTable(file) 
	local LineMatch = false
	local NumberKeyWords = 0
	local NumberMatches = 0
	for i=1,#TextFileTable,1 do
		for k=1,#KeyWordTable,1 do
			for n=2,#KeyWordTable[k],1 do
				if (string.find(TextFileTable[i], KeyWordTable[k][n])) then
					NumberMatches=NumberMatches+1
				end
			end
			if NumberMatches==#KeyWordTable[k]-1 and NumberMatches~=0 and #KeyWordTable[k]~=0 then 
				local line = TextFileTable[i]		
				local ValueExtract = string.match(line, '%s+%d[%d.,]*')  --%s+ one or more white spaces before number
				if ValueExtract~=nil then
				local newline = string.gsub(line, ValueExtract, " " .. ExecuteMathOperation(string.sub(KeyWordTable[k][1], 1, 1),tonumber(ValueExtract),string.sub(KeyWordTable[k][1],2)))
					TextFileTable[i] = newline
					print("REPLACED LINE:\n" .. line .. "\nWITH NEW LINE:\n" .. newline)				
				end			
			end
			NumberMatches = 0
		end
	end
	WriteToFile(ConvertLineTableToText(TextFileTable), file)	
end

function ChangeINIValues(ValueChangeTable)
	local TextFileTable = {}
	for k=1,#ValueChangeTable,1 do
		TextFileTable = ParseTextFileIntoTable(ValueChangeTable[k][1])
		print(ValueChangeTable[k][1])
		for i=1,#TextFileTable,1 do
			for n=2,#ValueChangeTable[k],1 do
				local line = TextFileTable[i]	
				if string.find(line, ValueChangeTable[k][n][1]) then
					local ValueExtract = string.sub(line, string.find(line, "=")+1)
					ValueExtract = string.match(ValueExtract, "%w+")
					if ValueExtract~=nil then
						local newline = string.gsub(line, ValueExtract, ValueChangeTable[k][n][2])
						TextFileTable[i] = newline
						print("REPLACED LINE:\n" .. line .. "\nWITH NEW LINE:\n" .. newline)				
					end
				end
			end
		end
		WriteToFile(ConvertLineTableToText(TextFileTable), ValueChangeTable[k][1])			
	end
end

function ExecuteMathOperation(math_operation,operand1,operand2)
	if math_operation == "*" then 
		return tonumber(operand1)*tonumber(operand2)
	elseif math_operation == "+" then 
		return tonumber(operand1)+tonumber(operand2)			
	elseif math_operation == "-" then 
		return tonumber(operand1)-tonumber(operand2)			
	elseif math_operation == "/" or math_operation == ":" then 
		return tonumber(operand1)/tonumber(operand2)
	else
		return 1
	end
end

function DoMathOperationsOnMultipleNumbersInLines2(file, KeyWordTable)
	print(file)
	local TextFileTable = ParseTextFileIntoTable(file) 
	local LineMatch = false
	local NumberKeyWords = 0
	local NumberMatches = 0
	for i=1,#TextFileTable,1 do
		for k=1,#KeyWordTable,1 do
			for n=2,#KeyWordTable[k],1 do
				if (string.find(TextFileTable[i], KeyWordTable[k][n])) then
					NumberMatches=NumberMatches+1
				end
			end
			if NumberMatches==#KeyWordTable[k]-1 and NumberMatches~=0 and #KeyWordTable[k]~=0 then 
				local line = TextFileTable[i]
				local newline,count
				local oldline = line
				local ValueTable = ExtractNumbersIniFromLine(line)
				local ValueTableMod = {}
				for z=1,#ValueTable,1 do
					if string.sub(KeyWordTable[k][1], 1, 1) == nil or tonumber(ValueTable[z]) == nil or string.sub(KeyWordTable[k][1],2) == nil then
						print("nil value detected in line " .. i .. ": " .. TextFileTable[i])
						print(string.sub(KeyWordTable[k][1], 1, 1),tonumber(ValueTable[z]),string.sub(KeyWordTable[k][1],2))
					end
					table.insert(ValueTableMod, ExecuteMathOperation(string.sub(KeyWordTable[k][1], 1, 1),tonumber(ValueTable[z]),string.sub(KeyWordTable[k][1],2)))
				end
				if #ValueTable>0 then
					for g=1,#ValueTable,1 do
						newline,count = string.gsub(line, ValueTable[g], ValueTableMod[g])
						--newline,count = string.gsub(line, '%s+%d[%d.,]*', %1)
						line = newline
						print("oldline: " .. oldline .. " newline: " .. newline)
						if count>1 then break end
					end	
					TextFileTable[i] = newline					
					print("REPLACED LINE:\n" .. oldline .. "\nWITH NEW LINE:\n" .. newline)					
				end
				--local ValueExtract = string.match(line, '%s+%d[%d.,]*')  --%s+ one or more white spaces before number	
			end
			NumberMatches = 0
		end
	end
	WriteToFile(ConvertLineTableToText(TextFileTable), file)	
end

function DoMathOperationsOnMultipleNumbersInLines(file, KeyWordTable)
	print(file)
	local TextFileTable = ParseTextFileIntoTable(file) 
	local LineMatch = false
	local NumberKeyWords = 0
	local NumberMatches = 0
	for i=1,#TextFileTable,1 do
		for k=1,#KeyWordTable,1 do
			for n=2,#KeyWordTable[k],1 do
				if (string.find(TextFileTable[i], KeyWordTable[k][n])) then
					NumberMatches=NumberMatches+1
				end
			end
			if NumberMatches==#KeyWordTable[k]-1 and NumberMatches~=0 and #KeyWordTable[k]~=0 then 
				local line = TextFileTable[i]
				local newline,count
				local oldline = line
				local ValueTable = ExtractNumbersIniFromLine(line)
				local ValueTableMod = {}
				for z=1,#ValueTable,1 do
					if string.sub(KeyWordTable[k][1], 1, 1) == nil or tonumber(ValueTable[z]) == nil or string.sub(KeyWordTable[k][1],2) == nil then
						print("nil value detected in line " .. i .. ": " .. TextFileTable[i])
						print(string.sub(KeyWordTable[k][1], 1, 1),tonumber(ValueTable[z]),string.sub(KeyWordTable[k][1],2))
					end
					table.insert(ValueTableMod, ExecuteMathOperation(string.sub(KeyWordTable[k][1], 1, 1),tonumber(ValueTable[z]),string.sub(KeyWordTable[k][1],2)))
				end
				if #ValueTable>0 then
					local Number1 = string.match(line, "%s+(%d[%d.,]*)")
					newline = string.gsub(line, '%s+(%d[%d.,]*)', "XXXXXA", 1)
					if #ValueTable>1 then
						local Number2 = string.match(newline, '%s+(%d[%d.,]*)')
						newline = string.gsub(newline, '(%s+%d[%d.,]*)', "XXXXXB")
						newline = string.gsub(newline, "XXXXXB", " " .. ValueTableMod[2] .. " ")
					end
					newline = string.gsub(newline, "XXXXXA", " " .. ValueTableMod[1])
					line = newline
					TextFileTable[i] = newline					
					print("REPLACED LINE:\n" .. oldline .. "\nWITH NEW LINE:\n" .. newline)					
				end		
			end
			NumberMatches = 0
		end
	end
	WriteToFile(ConvertLineTableToText(TextFileTable), file)	
end

--DoMathOperationsOnMultipleNumbersInLines(GameSlowDownValueContainerAll[9][1][1], GameSlowDownValueContainerAll[9][2])

function AddLineAfterKeywords(file, Keywords, NewLine)
	local TextFileTable = ParseTextFileIntoTable(file)
	local LineMatch = false
	for i=1,#TextFileTable,1 do
		for n=1,#Keywords,1 do
			if (string.find(TextFileTable[i], Keywords[n])) then
				LineMatch = true
			end
			if LineMatch then
				print("Added line after line:\n" .. TextFileTable[i] .. "\n" .. NewLine) 
				TextFileTable[i]=TextFileTable[i] .. "\n" .. NewLine
			end
			LineMatch = false
		end
	end
	WriteToFile(ConvertLineTableToText(TextFileTable), file)
end

function AddLineAfterPrecedingKeywords(file, KeywordTable, LineToAdd)
	print(file)
	local TextFileTable = ParseTextFileIntoTable(file) 	
	if CheckForEntry(TextFileTable, "AnimationSpeedFactorRange") then 
		print("Entry already found")
		return 
	end
	local KeywordMatchCount = 0
	for i=1,#TextFileTable,1 do
		for n=1,#KeywordTable,1 do
			if string.find(TextFileTable[i], KeywordTable[n]) then 
				KeywordMatchCount=KeywordMatchCount+1
			end
		end
		if KeywordMatchCount == #KeywordTable then
			print("Added line after line:\n" .. TextFileTable[i] .. "\n" .. LineToAdd) 
			TextFileTable[i]=TextFileTable[i] .. "\n" .. LineToAdd
			KeywordMatchCount = 0
		end
	end
	WriteToFile(ConvertLineTableToText(TextFileTable), file)
end

function AddMissingLineIntoIniChunk(file, IniChunkName, LineToAdd) --also replaces commented lines 
	print(file)
	local TextFileTable = ParseTextFileIntoTable(file)
	local LockIniChunk = false
	local i = 1
	while i<=#TextFileTable do
		if string.match(TextFileTable[i], "%w+") and string.match(TextFileTable[i], "%w+") == IniChunkName and not IsLineCommented(TextFileTable[i]) then 
			for k=i,#TextFileTable,1 do
				if string.match(LineToAdd, "%w+") and string.find(TextFileTable[k], string.match(LineToAdd, "%w+")) then
					if IsLineCommented(TextFileTable[k]) then
						print("Replaced line:\n" .. TextFileTable[k] .. "\nWith line\n" .. LineToAdd)	
						TextFileTable[k]=LineToAdd --UncommentIniLine(TextFileTable[k], Keyword)
						--string.sub(TextFileTable[k-1], 1, string.find(TextFileTable[k-1], string.match(TextFileTable[k-1], "%w+")))
					end
					LockIniChunk = true
					i=i+1
				elseif string.match(TextFileTable[k], "%w+") == "End" then
					if not LockIniChunk then
						print("Added line after line:\n" .. TextFileTable[k-1] .. "\n" .. LineToAdd)				
						TextFileTable[k-1]=TextFileTable[k-1] .. "\n" .. LineToAdd 		
					end
					LockIniChunk = false
					i=k
					break
				else 
					i=i+1
				end
			end
		else
			i=i+1 
		end
	end
	WriteToFile(ConvertLineTableToText(TextFileTable), file)
end

function ApplyGameValueChangeContainer(ValueChangeContainer)
	for k=1,#ValueChangeContainer,1 do
		DoMathOperationsOnMultipleNumbersInLines(ValueChangeContainer[k][1][1], ValueChangeContainer[k][2])
	end
end

function ApplyValueChangeContainerOnFileList(filelist)
	local TextFileTable = ParseTextFileIntoTable(filelist) 
	for i=1,#TextFileTable,1 do
		for k=2,#GameSlowDownMultiObjectValueContainer[1],1 do
			DoMathOperationsOnMultipleNumbersInLines(TextFileTable[i], GameSlowDownMultiObjectValueContainer[1][k])
		end
		for k=2,#GameSlowDownObjectSingleValueContainer[1],1 do
			--DoMathOperationsOnNumbersInLines(TextFileTable[i], GameSlowDownObjectSingleValueContainer[1][k])
			DoMathOperationsOnMultipleNumbersInLines(TextFileTable[i], GameSlowDownObjectSingleValueContainer[1][k])
		end
		AddMissingLineIntoIniChunk(TextFileTable[i], "Animation", "\t\t\t\tAnimationSpeedFactorRange = " .. SPEEDFACTOR .. " " .. SPEEDFACTOR)		
		--AddMissingLineIntoIniChunk(TextFileTable[i], "LocomotorSet", "\t\t\t\tSpeed = " .. "50")
	end
end

function AddCodeToFiles(ValueChangeContainer)
	for k=1,#ValueChangeContainer,1 do
		print(ValueChangeContainer[k][1])
		io.open(ValueChangeContainer[k][1],"a"):write(ValueChangeContainer[k][2])
	end
end

function AddNewFile(ValueChangeContainer)
	for k=1,#ValueChangeContainer,1 do
		print(ValueChangeContainer[k][1])
		io.open(ValueChangeContainer[k][1],"w"):write(ValueChangeContainer[k][2])
	end
end



ApplyValueChangeContainerOnFileList("ObjectFileList.txt")
ApplyValueChangeContainerOnFileList("MapIniList.txt")
ChangeINIValues(INIValueChangeTable)
ApplyGameValueChangeContainer(GameSlowDownValueContainerAll)
AddCodeToFiles(AddCodeContainer)
AddNewFile(AddNewFilesContainer)
AddLineAfterKeywords(AddLineContainer[1][1], AddLineContainer[1][2], AddLineContainer[1][3])


--todo spellstore bug, upgrades crash, speed fix, Interval in objects, enter fps manually