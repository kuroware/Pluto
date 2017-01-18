InGameMemoryMap = require("InGameMemoryMap")
--The GameGrid that has the draw stack (what to draw) and what is currently exisitng in memory inside of the InGameMemoryMap

GameGrid = {}
GameGrid.__index = GameGrid

function GameGrid.new()
