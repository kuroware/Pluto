Dot = {}
Dot.__index = Dot

--Constructor for some dot player
function Dot.new()
	return setmetatable({}, Dot)
end

--Sets the new position of this DotPlayer
-- function DotPlayer:setPosition(x, y)
-- 	self.currentPosition.x = x
-- 	self.currentPosition.y = y
-- end

-- --A function that moves the dot in the direction of its current direction vector (typically a unit vector) (i.e. updates its current position)
-- function DotPlayer:move()
-- 	if not self.currentDirectionVector == nil then
-- 		--Not nill, so there is a current direction vector
-- 		self.currentPosition = self.currentPosition + STEP_SIZE*self.currentDirectionVector
-- 	end
-- end

-- --Sets a target position for the dot player to move tos
-- function DotPlayer:setTargetPosition(x, y)
-- 	self.targetPosition = Coordinate(x, y)
-- 	--Set the new direction vector
-- 	self.currentDirectionVector = UnitVector(Coordinate(x, y) - self.currentPosition)
-- end


-- function DotPlayer:draw()
-- 	love.graphics.setColor(self.color[1], self.color[2], self.color[3])
-- 	love.graphics.circle("fill", self.currentPosition.x, self.currentPosition.y, 5)
-- 	love.graphics.circle("line", self.currentPosition.x, self.currentPosition.y, 5)
-- end

setmetatable(Dot, { __call = function(_,...) return Dot(...) end })
return Dot