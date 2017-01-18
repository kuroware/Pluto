Coordinate = {}

--Constructor for the Coordinate
function Coordinate:new(x, y)
	local coordObject = { x = x, y = y }
	self.__index = self
	return setmetatable(coordObject, self)
end

--R2 arithmetic
function Coordinate.__add(p1, p2)
	local result = Coordinate:new(p1.x + p2.x, p1.y + p2.y)
	return result
end

--Overiding the eq behaviour for more desirable results
-- Two points are equal if x1 == x2 and y1 == y2
function Coordinate.__eq(p1, p2)
	return p1.x == p2.x and p1.y == p2.y
end

function Coordinate:__str()
	return "< " .. self.x .. ", " .. self.y .. " >"
end

return Coordinate