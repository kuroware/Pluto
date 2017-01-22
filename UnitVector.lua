-- Coordinate = require "Coordinate"

-- UnitVector = {}
-- UnitVector.__index = UnitVector

-- --Given some coordinate, converts it into a unit vector, but still returns a coordinate object
-- function UnitVector.new(coord)
-- 	local unitVec = Coordinate(coord.x/coord:distance(), coord.y/coord:distance())
-- 	return unitVec
-- end

-- return UnitVector