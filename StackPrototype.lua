--A dead simple Stack class
StackPrototype = {}
StackPrototype.__index =StackPrototype

function StackPrototype.new()
	return setmetatable({ items = {}, length = 0, isEmpty = true }, StackPrototype)
end

function StackPrototype:push(value)
	self.items[self.length + 1] = value
	self.length = self.length + 1
	self.isEmpty = false
end

function StackPrototype:pop()
	if not self.isEmpty then
		local popped = self.items[self.length]
		self.items[self.length] = nil
		self.length = self.length - 1

		--Check if empty now
		if self.length == 0 then self.isEmpty = true end

		return popped
	else
		return nil
	end
end

function StackPrototype:empty()
	return self.isEmpty
end

setmetatable(StackPrototype, { __call = function(_, ...) return StackPrototype.new(...) end })
return StackPrototype