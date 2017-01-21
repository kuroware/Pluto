	--The union of a road, a second road and an arc connecting them. Meant to serve as road1 is a pivot point for a arc from its starting coord to the ending coord of road2
-- Combinations of SingleArcRoadObjects can create an elaborate road

SingleArcRoadObject = {}
SingleArcRoadObject.__index = SingleArcRoadObject


--Constructor
-- @param beginningCoord - The coodindate of where to begin drawing the arc
-- @param endingCoord - The coordinate where the curve finishes
function SingleArcRoadObject.new()
