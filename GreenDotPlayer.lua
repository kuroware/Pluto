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

function GreenDotPlayer:lastClicked()
	if love.mouse.isDown(1) then
		d, e = love.mouse.getPosition( )
		a = GreenDotPlayer.new(d,e)
		a = a.currentPosition
		return a
	end
end

function GreenDotPlayer.__tostring(obj)
	return "GreenDotPlayer at <" .. obj.currentPosition.x .. ", " .. obj.currentPosition.y .. ">"
end

function basicmove(gbI)
	oldwaypoint = waypoint
	print(players[gbI])
	waypoint = players[gbI]:lastClicked()
	-- Subtract previous vector
	g,h = players[gbI].currentPosition.x, players[gbI].currentPosition.y
	previous = GreenDotPlayer.new(g,h)
	
	-- Can't find waypoint
	if waypoint == nil then
		-- Assign old waypoint as waypoint
		waypoint = oldwaypoint
		-- If no existing waypoint, then do not move
		if oldwaypoint == nil then
			return 0
		end
	end
	-- Both are currentPosition
	if (waypoint - previous.currentPosition):distance() <= 8 then
		print("Close enough")
		return 2
	end
	calculate = waypoint - previous.currentPosition
	distance = math.sqrt(waypoint.x^2 + waypoint.y^2)
	unx = calculate.x / distance * 2
	uny = calculate.y / distance * 2
	x = x + unx
	y = y + uny
	players[gbI]:setPosition(x,y)
end

setmetatable(GreenDotPlayer, { __call = function(_,...) return GreenDotPlayer.new(...) end })
return GreenDotPlayer

