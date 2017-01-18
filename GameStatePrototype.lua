InGameMemoryMap = require("InGameMemoryMap")
ArrayPrototype = require("ArrayPrototype")
--The GameStatePrototype is a ultimate wrapper class over the game. 
--Has the draw stack (what to draw)
-- Has what is currently exisitng in memory inside of the InGameMemoryMap

GameStatePrototype = {}
GameStatePrototype.__index = GameStatePrototype

function GameStatePrototype.new()
	local gameStateObject = {}
	gameStateObject.grid = InGameMemoryMap() --Create the in game memory map
	gameStateObject.drawArray = ArrayPrototype()

	return setmetatable(gameStateObject, GameStatePrototype)
end

--Put some object into the GameState
function GameStatePrototype:put(inGameObject)
	self.drawArray:push(inGameObject) --Push into the draw stack
	self.grid:put(inGameObject) --Put into the in game memory
end

setmetatable(GameStatePrototype, { __call = function(_,...) return GameStatePrototype.new(...) end })
--return GameStatePrototype
AppGameState = GameStatePrototype.new()
return AppGameState