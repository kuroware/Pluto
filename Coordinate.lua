Coordinate = {}

--Constructor for the Coordinate
function Coordinate:new(x, y)
	local coordObject = { x = x, y = y }
	self.__index = self
	return setmetatable(coordObject, self)
end

--R2 arithmetic
function Coordinate.__add(p1, p2)
	local result = Coordiante:new(p1.x + p2.x, p1.y + p2.y)
	return result
end

function Coordinate:__str()
	return "< " .. self.x .. ", " .. self.y .. " >"
end
return Coordinate