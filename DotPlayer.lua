Coordinate = require "Coordinate"
DotPlayer = {}
DotPlayer.__index = DotPlayer

--Constructor for some dot player
function DotPlayer.new(x, y, color)
	local dotObject = { currentPosition = Coordinate(x, y), color = color or {46, 204, 113}, currentDirectionVector = nil, currentVelocity = nil, targetPosition = nil }
	return setmetatable(dotObject, DotPlayer)
end

--Sets the new position of this DotPlayer
function DotPlayer:setPosition(x, y)
	self.currentPosition.x = x
	self.currentPosition.y = y
end

--A function that moves the dot in the direction of its current direction vector (typically a unit vector) (i.e. updates its current position)
function DotPlayer:move()
	if not self.currentDirectionVector == nil then
		--Not nill, so there is a current direction vector
		self.currentPosition = self.currentPosition + STEP_SIZE*self.currentDirectionVector
	end
end

--Sets a target position for the dot player to move tos
function DotPlayer:setTargetPosition(x, y)
	self.targetPosition = Coordinate(x, y)
	--Set the new direction vector
	self.currentDirectionVector = UnitVector(Coordinate(x, y) - self.currentPosition)
end


function DotPlayer:draw()
	love.graphics.setColor(self.color[1], self.color[2], self.color[3])
	love.graphics.circle("fill", self.currentPosition.x, self.currentPosition.y, 5)
	love.graphics.circle("line", self.currentPosition.x, self.currentPosition.y, 5)
end

setmetatable(DotPlayer, { __call = function(_,...) return DotPlayer.new(...) end })
return DotPlayer