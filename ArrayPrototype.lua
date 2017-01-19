--Dead simple Array... in lua, I'm starting to like this language less and less
ArrayPrototype = {}
ArrayPrototype.__index = ArrayPrototype

function ArrayPrototype.new()
	local arrayImplementation = { items = {}, length = 0, currentIndex = 1 }
	return setmetatable(arrayImplementation, ArrayPrototype)
end

function ArrayPrototype:push(value)
	self.items[self.currentIndex] = value
	self.currentIndex = self.currentIndex + 1
	self.length  = self.length + 1
end

--Print to representable form
-- function ArrayPrototype.__tostring(arr)
-- 	string = ""
-- 	for i=1,arr.length do
-- 		string = string .. arr.items[i].__tostring()
-- 	return string
-- end

setmetatable(ArrayPrototype, { __call = function(_,...) return ArrayPrototype.new() end })
return ArrayPrototype	