Coordinate = require("Coordinate")
RoadObject = {}
RoadObject.__index = RoadObject

--Constructor of the road object
--@param topLeftX - int, the top left 
-- @parm topLeftY
-- @param color, the color of the road, a array of { r, g, b }
function RoadObject.new(topLeftX, topLeftY, width, height, color)
	local roadObject = { referencePoint = Coordinate(topLeftX, topLeftY), width = width, height = height, color = color or { 125, 129, 130}} --Minimal storage
	return setmetatable(roadObject, RoadObject)
end

--Draws the road
function RoadObject:draw()
	love.graphics.setColor(self.color[1], self.color[2], self.color[3])
	love.graphics.rectangle("fill", self.referencePoint.x, self.referencePoint.y, self.width, self.height)
	love.graphics.rectangle("line", self.referencePoint.x, self.referencePoint.y, self.width, self.height) --Antialias
end



--A string method for the RoadObject that prints out useful information
function RoadObject:__str()
	return "RoadObject at coordinate " .. self.referencePoint:__str()
end


setmetatable(RoadObject, { __call = function(_, ...) return RoadObject.new(...) end })

return RoadObject