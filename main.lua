
Coordinate = require("Coordinate")

function love.load()
	love.window.setMode(800, 600, {fullscreen = true, highdpi = true})
end

function love.update()
end

function love.draw()
	-- love.graphics.setColor( 189, 195, 199 )
	-- love.graphics.arc( "fill", 400, 300, 10, -math.pi, -math.pi/2)
	-- love.graphics.arc( "line", 400, 300, 10, -math.pi, -math.pi/2) --Anti-aliasing

	-- --Draw the recentalge for the road leading up to it
	-- love.graphics.rectangle("fill", 390, 300, 11, 500)
	-- love.graphics.rectangle("line", 390, 300, 10, 500)

	-- -- --Draw the rectangle leading out of the arc
	-- love.graphics.rectangle("fill", 400, 290, 500, 10)


	-- love.graphics.arc( "fill", 800, 300, 50, -math.pi, -math.pi/2)
	-- love.graphics.arc( "line", 800, 300, 50, -math.pi, -math.pi/2) --Anti-aliasing

	-- --Draw the recentalge for the road leading up to it
	-- love.graphics.rectangle("fill", 750, 300, 50, 500)
	-- love.graphics.rectangle("line", 750, 300, 50, 500)
	--Create a road
	highway404 = RoadObject:new(390, 300, 10, 500)
	highway404:draw()
end

RoadObject = {}
function RoadObject:new(topLeftX, topLeftY, width, height)
	roadObject = { referencePoint = Coordinate:new(topLeftX, topLeftY), width = width, height = height } --Minimal storage
	self.__index = self
	return setmetatable(roadObject, self)
end

--Draws the road
function RoadObject:draw()
	love.graphics.rectangle("fill", self.referencePoint.x, self.referencePoint.y, self.width, self.height)
	love.graphics.rectangle("line", self.referencePoint.x, self.referencePoint.y, self.width, self.height) --Antialias
end

--A string method for the RoadObject that prints out useful information
function RoadObject:__str()
	return "RoadObject at coordinate " .. self.referencePoint:__str()
end


RoadHelper = {}
function RoadHelper.connectRoad(road1, road2)
	--Connects to perpindicular roads where road1 is north-south and road2 is east-west

	--Get intersection point of the roads, there are 4 cases

	if road2.topLeftX + road2.width == road1.topLeftX and road2.topLeftY - road2.height == road1.topLeftY then
		--Then the road2 is from the left and hitting road1 at the top
		print("Road from the left")
	elseif road2.topLeftX == road1.topLeftX + road1.width and road2.topLeftY - road2.height == road1.topLeftY then
		print("Road from the right")
	else
		print("not found")
	end

end
