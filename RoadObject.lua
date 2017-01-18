RoadObject = {}

function RoadObject:new(topLeftX, topLeftY, width, height)
	local roadObject = { referencePoint = Coordinate:new(topLeftX, topLeftY), width = width, height = height, drawn = false } --Minimal storage
	self.__index = self
	return setmetatable(roadObject, self)
end

--Draws the road
function RoadObject:draw()
	if not self.drawn then
		--print("Drawing " .. self:__str())
		love.graphics.rectangle("fill", self.referencePoint.x, self.referencePoint.y, self.width, self.height)
		love.graphics.rectangle("line", self.referencePoint.x, self.referencePoint.y, self.width, self.height) --Antialias
		self.drawn = true
	end
end

--A string method for the RoadObject that prints out useful information
function RoadObject:__str()
	return "RoadObject at coordinate " .. self.referencePoint:__str()
end

return RoadObject