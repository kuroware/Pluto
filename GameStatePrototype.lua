InGameMemoryMap = require("InGameMemoryMap")
Stack = require("StackPrototype")
--The GameStatePrototype is a ultimate wrapper class over the game. 
--Has the draw stack (what to draw)
-- Has what is currently exisitng in memory inside of the InGameMemoryMap

GameStatePrototype = {}
GameStatePrototype.__index = GameStatePrototype

function GameStatePrototype.new()
	local gameStateObject = {}
	gameStateObject.grid = InGameMemoryMap() --Create the in game memory map
end