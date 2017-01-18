--A dead simple Stack class
StackPrototype = {}
StackPrototype.__index =StackPrototype

function StackPrototype.new()
	return setmetatable({ items = {}, length = 0, emty = true }, StackPrototype)
end

function StackPrototype:push(value)
	self.items[self.length + 1] = value
	self.length = self.length + 1
	self.empty = false
end

function StackPrototype:pop()
	if not stack.empty then
		local popped = self.items[self.length]
		self.items[self.length] = nil
		self.length = self.length - 1
		return popped
	else
		return nil
end

setmetatable(StackPrototype, { __call = function(_, ...) return StackPrototype.new(...) end})
return StackPrototype