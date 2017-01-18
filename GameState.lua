--Coord defiition

Coord = {}
function Coord:new(x, y)
	point = { x = x, y = y }
	self.__index = self
	return setmetatable(point, self)
end

function Coord.__add(p1, p2)
	result = Coord:new(p1.x + p2.x, p1.y + p2.y)
	return result
end

function Coord:distance(referencePoint)
	if referencePoint then
		return math.sqrt((self.x - referencePoint.x)^2 + (self.y - referencePoint.y)^2)
	else
		return math.sqrt(self.x^2 + self.y^2)
	end
end

--GameState defintions
GameState = {}

function GameState:new()
	gameStateTree = {
		particle = Coord:new(0, 0)
	}
	self.__index = self
	return setmetatable(gameStateTree, self)
end



App = GameState:new()
A = Coord:new(3, 0)
B = Coord:new(0, 4)
C = A + B
print("<" .. C.x .. ", " .. C.y .. ">")
print(C:distance())