Coordinate = require("Coordinate")
RoadArcObject = require "RoadArcObject"
RoadHelper = {}

--Road helper that connects a road by giving back an arc that connects it
function RoadHelper.arcConnectRoads(road1, road2)
	--Connects to perpindicular roads where road1 is north-south and road2 is east-west

	--Get intersection point of the roads, there are 4 cases

	--Road 2 is from the right of road1
	if road1.referencePoint + Coordinate(road1.width, -1*road2.height) == road2.referencePoint then
		local arcCenter = road1.referencePoint + Coordinate(road1.width, 0)
		return RoadArcObject(arcCenter.x, arcCenter.y, -math.pi, -math.pi/2)
	else
		return nil
	end
end


return RoadHelper