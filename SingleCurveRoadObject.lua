RoadHelper = require "RoadHelper" --Require the helper class to connect roads together
RoadObject = require "RoadObject" --The road object
RoadArcObject = require "RoadArcObject"
DEFAULT_ROAD_WIDTH = require "Constants".DEFAULT_ROAD_WIDTH


-- OBJECT DEFINITION
--The union of a road, a second road and an arc connecting them. Meant to serve as road1 is a pivot point for a arc from its starting coord to the ending coord of road2
-- Combinations of SingleArcRoadObjects can create an elaborate road
SingleCurveRoadObject = {}
SingleCurveRoadObject.__index = SingleCurveRoadObject


--Constructor
-- @param beginningCoord - The coodindate of where to begin drawing the arc
-- @param endingCoord - The coordinate where the curve finishes
-- @param concavity - Needed in order to know whether or not the arc should be convex or concave
-- The beginning and ending is always seen from left to right
function SingleCurveRoadObject.new(beginningCoord, endingCoord, concavity)	

	local road1, road2, connectingArc = nil, nil, nil --Default properities

	--Attempt to construct the RoadObject by doing casework
	local referenceVector = beginningCoord - endingCoord
	--Do some case work, there are 4 cases
	if referenceVector.x < 0 and referenceVector.y < 0 then
		--Check concavity
		if concavity == "concave" then
			--Case 1, the beginningCoord is from the left and endingCoord is below the beginningCoord like so
			--
			--     Road1
			-- ______________ arc
			--                 |
			--                 |
			--                 |    Road2
			--                 |
			--                 |

			--Do a default width of 10 for road1
			road1 = RoadObject(beginningCoord.x, beginningCoord.y, math.abs(referenceVector.x), DEFAULT_ROAD_WIDTH)
			road2 = RoadObject(beginningCoord.x + math.abs(referenceVector.x), beginningCoord.y + DEFAULT_ROAD_WIDTH, DEFAULT_ROAD_WIDTH, math.abs(beginningCoord.y + DEFAULT_ROAD_WIDTH - endingCoord.y))

			--Create the arc
			connectingArc = RoadArcObject(beginningCoord.x + math.abs(referenceVector.x), beginningCoord.y + 10, 0, -math.pi/2)
		else
			--convex
			--Case 3, the beginningCoord is from the left and endingCoord is below the beginningCoord like so
			--
			--     
			-- | 
			-- |   Road1           
			-- |               
			-- |               
			-- |               
			-- arc____Road 2_______               
			road1 = RoadObject(beginningCoord.x, beginningCoord.y, DEFAULT_ROAD_WIDTH, math.abs(referenceVector.y))
			road2 = RoadObject(endingCoord.x, endingCoord.y, -math.abs(referenceVector.x) + 10, DEFAULT_ROAD_WIDTH)
			connectingArc = RoadArcObject(beginningCoord.x + 10, endingCoord.y, -math.pi, -3*math.pi/2)
		end
	elseif referenceVector.x < 0 and referenceVector.y > 0 then

		--Check for concavity
		if concavity == "convex" then
			--Case 2, the beginnningCoord is from the left again and below the endingCoord like so
			-- 			     |
			-- 			     |
			-- 			     |   Road 2
			-- 			     |
			-- ______________|
			--     Road 1    arc

			road1 = RoadObject(beginningCoord.x, beginningCoord.y, math.abs(referenceVector.x), DEFAULT_ROAD_WIDTH)
			road2 = RoadObject(endingCoord.x, endingCoord.y, DEFAULT_ROAD_WIDTH, math.abs(referenceVector.y))
			connectingArc = RoadArcObject(endingCoord.x, beginningCoord.y, 0, math.pi/2)
		else
			--Concave
			--Case 2, the beginnningCoord is from the left again and below the endingCoord like so
			-- arc _______Road 2_______
			-- |			     
			-- |			     
			-- |Road 1			     
			-- |		     
			-- |
			road1 = RoadObject(beginningCoord.x, beginningCoord.y, DEFAULT_ROAD_WIDTH, -math.abs(referenceVector.y) + 10)
			road2 = RoadObject(endingCoord.x, endingCoord.y, -math.abs(referenceVector.x)+10 , DEFAULT_ROAD_WIDTH)
			connectingArc = RoadArcObject(beginningCoord.x + 10, endingCoord.y + 10, -math.pi, -math.pi/2)
		end
	end

	--In this constructor, we try to figure out what the arc is, we get this by calling RoadHelper
	return setmetatable({ road1 = road1, road2 = road2, connectingArc = connectingArc }, SingleCurveRoadObject)
end

-- Draws the current instance onto the screen by the exposed love api
function SingleCurveRoadObject:draw()
	self.road1:draw()
	self.connectingArc:draw()
	self.road2:draw()
end

setmetatable(SingleCurveRoadObject, { __call = function(_,...) return SingleCurveRoadObject.new(...) end })
return SingleCurveRoadObject