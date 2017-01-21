Coordinate = require "Coordinate"
GreenDotPlayer = {}
GreenDotPlayer.__index = GreenDotPlayer

--Create a new green dot player with initial x and y position
function GreenDotPlayer.new(x, y)
	local greenDot = { currentPosition = Coordinate(x, y) }
	return setmetatable(greenDot, GreenDotPlayer)
end

--Helper functions, set the coordinate positions of this player
--Sets the current position of a green dot to the given x and y, called by greenDotObj:setPosition(newx, newy)
function GreenDotPlayer:setPosition(x, y)
	self.currentPosition.x = x
	self.currentPosition.y = y
end

--Draws the green dot on the screen with reference to its instance coordinates
function GreenDotPlayer:draw()
	love.graphics.setColor(46, 204, 113)
	love.graphics.circle("fill", self.currentPosition.x, self.currentPosition.y, 5)
	love.graphics.circle("line", self.currentPosition.x, self.currentPosition.y, 5)
end

setmetatable(GreenDotPlayer, { __call = function(_,...) return GreenDotPlayer.new(...) end })
return GreenDotPlayer

