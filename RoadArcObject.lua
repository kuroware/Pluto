Coordinate = require "Coordinate"

RoadArcObject = {}
RoadArcObject.__index = RoadArcObject

function RoadArcObject.new(centerX, centerY, beginningAngle, endingAngle)
	local arcObject = { referencePoint = Coordinate(centerX, centerY), beginningAngle = beginningAngle, endingAngle = endingAngle }
	setmetatable(arcObject, RoadArcObject)
	return arcObject
end

-- Draw the road arc
function RoadArcObject:draw()
	love.graphics.arc("fill", self.referencePoint.x, self.referencePoint.y, 10, self.beginningAngle, self.endingAngle, 30)
end

--Overriding the metatable method for the string representation
function RoadArcObject.__tostring(arcObject)
	return "Road Arc Object centered at < " .. arcObject.referencePoint.x .. ", " .. arcObject.referencePoint.y .. " >"
end

setmetatable(RoadArcObject, { __call = function(_,...) return RoadArcObject.new(...) end })
return RoadArcObject
