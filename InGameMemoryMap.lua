--Some requires in order to compare
RoadObject = require("RoadObject")

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
	return setmetatable({ grid = inGameGrid }, InGameMemoryMap)
end

--Put some GameObject into the InGameMemoryMap
function InGameMemoryMap:put(inGameObject)
	if getmetatable(inGameObject) == RoadObject then
		--Put it into the map
		local refI, refJ = RoadObject.referencePoint.x, RoadObject.referencePoint.y
		for i=refI, refI + RoadObject.height do
			for j=refJ,refJ+RoadObject.width do
				self.grid[i][j] = inGameObject
			end
		end
	end
end

setmetatable(InGameMemoryMap, { __call = function(_, ...) return InGameMemoryMap.new(...) end})
return InGameMemoryMap
