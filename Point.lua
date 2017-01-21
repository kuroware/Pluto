Point = {}

function Point.new(x, y)
	local somePoint = { x = x, y = y }
	Point.__index = Point
	return setmetatable(somePoint, Point)
end

function Point.__tostring(ptObject)
	return "Point object at <" .. ptObject.x .. ", " .. ptObject.y .. ">"
end

function Point:distance() -- a = Point:distance(a, ...)
	return math.sqrt(self.x^2 + self.y^2)
end

function Point.__add(point1, point2)
	local result = Point.new(point1.x + point2.x, point1.y + point2.y)
	return result
end

a = Point.new(3, 4)
b = Point.new(5, 6)
c = a + b
print(c:distance())
print(c)

return Point