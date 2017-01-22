Point = {}
Point.__index = Point
function Point.new(x, y)
	return setmetatable({x =x, y = y}, Point)
end

function Point.__tostring(pt)
	return "Point at <" .. pt.x .. ", " .. pt.y .. ">"
end

function Point.__mul(scalar, pt)
	return Point.new(scalar*pt.x, scalar*pt.y)
end

a = Point.new(1, 1)
print(5 * a)