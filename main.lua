Coordinate = require("Coordinate")
RoadObject = require("RoadObject")
RoadHelper = require "RoadHelper"
GameStatePrototype = require("GameStatePrototype")
SingleCurveRoadObject = require "SingleCurveRoadObject"

AppGameState = nil --By default, this is the global singleton

function love.load()
	love.window.setMode(1366, 768, { highdpi = true})

	--Create the ingamegrid
	AppGameState = GameStatePrototype.getInstance()
	--Set it to our default map

	-- local arcHighway = SingleCurveRoadObject(Coordinate(100, 100), Coordinate(300, 400))
	-- AppGameState:put(arcHighway)

	-- local arcHighway2 = SingleCurveRoadObject(Coordinate(500, 500), Coordinate(600, 400))
	-- AppGameState:put(arcHighway2)

	local arcHighway3 = SingleCurveRoadObject(Coordinate(300, 300), Coordinate(500, 500), "concave")
	AppGameState:put(arcHighway3)
end

function love.update()

end

function love.draw()
	--Draw the GameGrid by iterating theough the AppGameState
	for i=1,AppGameState.drawArray.length do
		AppGameState.drawArray.items[i]:draw()
	end

	-- love.graphics.rectangle("fill", 1000, 1000, 10, 500)

end



