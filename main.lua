Coordinate = require("Coordinate")
RoadObject = require("RoadObject")
RoadHelper = require("RoadHelper")
GameStatePrototype = require("GameStatePrototype")


function love.load()
	love.window.setMode(1366, 768, { highdpi = true})

	--Creaate the ingamegrid
	AppGameState = GameStatePrototype.getInstance()
	--Set it to our default map
	AppGameState:put(RoadObject(500, 500, 10, 400))
	AppGameState:put(RoadObject(510, 490, 200, 10))
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
	-- highway404 = RoadObject(500, 500, 10, 400)
	-- highway404:draw()

	-- --Draw the next highway
	-- continuedHighway = RoadObject(510, 490, 200, 10)
	-- continuedHighway:draw()

	-- --Connect them
	-- RoadHelper.connectRoad(highway404, continuedHighway)

	--Draw the GameGrid by iterating theough the AppGameState
	for i=1,AppGameState.drawArray.length do
		AppGameState.drawArray.items[i]:draw()
	end

end



