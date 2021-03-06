Coordinate = require("Coordinate")
RoadObject = require("RoadObject")
RoadHelper = require "RoadHelper"
GameStatePrototype = require("GameStatePrototype")
SingleCurveRoadObject = require "SingleCurveRoadObject"
GreenDotPlayer = require "GreenDotPlayer"
AppGameState = nil --By default, this is the global singleton
DotPlayer = require "DotPlayer"
SquareSelect = require "SquareSelect"

function love.load()
	love.window.setMode(1366, 768, { highdpi = true})

	--Create the ingamegrid
	AppGameState = GameStatePrototype.getInstance()
	--Set it to our default map

	-- local arcHighway = SingleCurveRoadObject(Coordinate(100, 100), Coordinate(300, 400))
	-- AppGameState:put(arcHighway)

	-- local arcHighway2 = SingleCurveRoadObject(Coordinate(500, 500), Coordinate(600, 400))
	-- AppGameState:put(arcHighway2)

	local highwayComponents = {
		-- RoadObject(0, 700, 2000, 10),
		-- SingleCurveRoadObject(Coordinate(600, 1200), Coordinate(700, 200), "concave"),
		-- SingleCurveRoadObject(Coordinate(700, 200), Coordinate(900, 1200), "concave"),
		RoadObject(900, 100, 20, 1200, { 125, 129, 130} ), --The major road on the left
		RoadObject(1400, 100, 20, 1200, { 125, 129, 130} ), --The major road on the right
		RoadObject(200, 200, 1500, 10, { 125, 129, 130}), --Intersecting road at the top
		RoadObject(920, 600, 480, 10, { 125, 129, 130}), --Intersecting road at the middle
		SingleCurveRoadObject(Coordinate(700, 650), Coordinate(920, 600), "concave"), --Curving road that intersects with the middle road
		SingleCurveRoadObject(Coordinate(700, 650), Coordinate(1000, 800), "convex"), --Continuation that intersects back
		RoadObject(800, 100, 10, 1200), --Long intersecting one that hits arc
		RoadObject(710, 700, 200, 10)
	}

	player = DotPlayer.new(1, 1)

	for index, segment in pairs(highwayComponents) do
		AppGameState:put(segment)
	end

	x = 12
	y = 12

	players = {
		GreenDotPlayer(x, y),
		GreenDotPlayer(300, 123),
		GreenDotPlayer(290, 189),
		GreenDotPlayer(121, 422)
	}
	for i=1,4 do
		AppGameState:put(players[i])
	end
end


function love.update()
	AppGameState:put(player)
	DotsinRect()
	length = 0
	for index, spot in pairs(arrInside) do
		length = length + 1
	end
	if length > 0 then print("arr has length " .. length) end
	print("arr contents are for length more than 0")
	if length > 0 then 
		for index, spot in pairs(arrInside) do
			print(spot)
		end
	end

	-- Check if the rectangle drawn reaches the dots
	for index, spot in pairs(arrInside) do
		while(1) do
			print(index)
			saved = basicmove(index)
			if saved == 2 then
				break
			end
		end
	end
		selected = false
		arrInside = {}
		for index, spot in pairs(arrInside) do
			print("in array")
			print(spot)
		end
end

function love.draw()
	--Draw the GameGrid by iterating theough the AppGameState
	for i=1,AppGameState.drawArray.length do
		AppGameState.drawArray.items[i]:draw()
	end
	-- love.graphics.rectangle("fill", 1000, 1000, 10, 500)
	-- Draw the selection rectangle
	if(down == true) then
		love.graphics.rectangle("line", initialx, initialy, newx, newy)
	end
end



