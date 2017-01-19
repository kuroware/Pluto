Coordinate = {}
Coordinate.__index = Coordinate

--Constructor for the Coordinate
function Coordinate.new(x, y)
	local coordObject = { x = x, y = y }
	return setmetatable(coordObject, Coordinate)
end

--R2 arithmetic
function Coordinate.__add(p1, p2)
	local result = Coordinate(p1.x + p2.x, p1.y + p2.y)
	return result
end

--Overiding the eq behaviour for more desirable results
-- Two points are equal if x1 == x2 and y1 == y2
function Coordinate.__eq(p1, p2)
	return p1.x == p2.x and p1.y == p2.y
end

function Coordinate.__tostring(coordinate)
	return "< " .. coordinate.x .. ", " .. coordinate.y .. " >"
end


setmetatable(Coordinate, { __call = function(_, ...) return Coordinate.new(...) end })
return Coordinate