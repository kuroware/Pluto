Coordinate = require("Coordinate")
RoadHelper = {}

function RoadHelper.connectRoad(road1, road2)
	--Connects to perpindicular roads where road1 is north-south and road2 is east-west

	--Get intersection point of the roads, there are 4 cases

	--Road 2 is from the right of road1
	if road1.referencePoint + Coordinate:new(road1.width, -1*road2.height) == road2.referencePoint then
		local arcCenter = road1.referencePoint + Coordinate:new(road1.width, 0)
		--Draw the arc
		love.graphics.arc("fill", arcCenter.x, arcCenter.y, 10, -math.pi, -math.pi/2, 20)
	else

	end
end

return RoadHelper