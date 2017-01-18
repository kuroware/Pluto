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

setmetatable(ArrayPrototype, { __call = function(_,...) return ArrayPrototype.new() end })
return ArrayPrototype