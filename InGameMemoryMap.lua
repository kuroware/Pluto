--The in game memory map used to compare the hidden map inside the code and the rendered map, also for collision checking
--Should be used as a singelton

InGameMemoryMap = {}
InGameMemoryMap.__index = InGameMemoryMap

function InGameMemoryMap.new()
	local inGameGrid = {}
	--Set the 1366 x 768 bit mask
	for i=1,768 do
		inGameGrid[i] = {}
		for j=1,1366 do
			inGameGrid[i][j] = 0
		end
	end

	--Set its metatable
	return setmetatable(inGameGrid, InGameMemoryMap)
end

--Put some GameObject into the InGameMemoryMap
function InGameMemoryMap:put()

end

setmetatable(InGameMemoryMap, { __call = function(_, ...) return InGameMemoryMap.new(...) end})
return InGameMemoryMap
