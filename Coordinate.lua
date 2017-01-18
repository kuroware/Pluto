Coordinate = {}

--Constructor for the Coordinate
function Coordinate:new(x, y)
	coordObject = { x = x, y = y }
	self.__index = self
	return setmetatable(coordObject, self)

--R2 arithmetic
function 