InGameMemoryMap = require("InGameMemoryMap")
ArrayPrototype = require("ArrayPrototype")
--The GameStatePrototype is a ultimate wrapper class over the game. 
--Has the draw stack (what to draw)
-- Has what is currently exisitng in memory inside of the InGameMemoryMap

GameStatePrototype = {}
GameStatePrototype.__index = GameStatePrototype

GameStateWrapperSingleton = nil

--The game state wrapper object, should only be instantiated in love.load
function GameStatePrototype.new()
	if not GameStateWrapperSingleton then	
		--First instantiation
		GameStateWrapperSingleton = {}
		GameStateWrapperSingleton.grid = InGameMemoryMap() --Create the in game memory map
		GameStateWrapperSingleton.drawArray = ArrayPrototype()
		setmetatable(GameStateWrapperSingleton, GameStatePrototype)
	end
	return GameStateWrapperSingleton
end

--Put some object into the GameState
function GameStatePrototype:put(inGameObject)
	self.drawArray:push(inGameObject) --Push into the draw stack
	self.grid:put(inGameObject) --Put into the in game memory
end

function GameStatePrototype.getInstance()
	return GameStatePrototype()
end

setmetatable(GameStatePrototype, { __call = function(_,...) return GameStatePrototype.new(...) end })
return GameStatePrototype
-- AppGameState = GameStatePrototype.new()
-- return AppGameState