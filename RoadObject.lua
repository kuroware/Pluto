Coordinate = require("Coordinate")
RoadObject = {}
RoadObject.__index = RoadObject

function RoadObject.new(topLeftX, topLeftY, width, height)
	local roadObject = { referencePoint = Coordinate(topLeftX, topLeftY), width = width, height = height } --Minimal storage
	return setmetatable(roadObject, RoadObject)
end

--Draws the road
function RoadObject:draw()
	love.graphics.setColor( 189, 195, 199 )
	love.graphics.rectangle("fill", self.referencePoint.x, self.referencePoint.y, self.width, self.height)
	love.graphics.rectangle("line", self.referencePoint.x, self.referencePoint.y, self.width, self.height) --Antialias
end

--A string method for the RoadObject that prints out useful information
function RoadObject:__str()
	return "RoadObject at coordinate " .. self.referencePoint:__str()
end


setmetatable(RoadObject, { __call = function(_, ...) return RoadObject.new(...) end })

return RoadObject