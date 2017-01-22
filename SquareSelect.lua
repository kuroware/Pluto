initialx = 0
initialy = 0
newx = 0
newy = 0
down = false
selected = false

function love.mousepressed(ix, iy, button)
	down = true
	initialx = ix
	initialy = iy
	newx = 0
	newy = 0
end

function love.mousemoved(x,y,dx,dy)
	if(down == true) then
		-- makes newx and newy the 
		newx = newx + dx
		newy = newy + dy
	end
end

function love.mousereleased(ox, oy, button)
	down = false
end

arrInside = {}
insidelen = 0

-- deals with initialx, initialy, newx, newy
function DotsinRect()
	selected = false
	for index, dot in pairs(arrInside) do
		-- quadrant 1
		if newx > 0 and newy > 0 then
			if players[index].currentPosition.x > initialx and 
				players[index].currentPosition.x < initialx + newx and
				players[index].currentPosition.y < initialy + newy and
				players[index].currentPosition.y > initialy then
					insidelen = insidelen + 1
					arrInside[insidelen] = players[index]
					selected = true
			end
		-- quadrant 2
		elseif newx > 0 and newy < 0 then
			if players[index].currentPosition.x > initialx and 
				players[index].currentPosition.x < initialx + newx and
				players[index].currentPosition.y < initialy and
				players[index].currentPosition.y > initialy - newy then
					insidelen = insidelen + 1
					arrInside[insidelen] = players[index]
					selected = true
			end
		-- quadrant 3
		elseif newx < 0 and newy < 0 then
			if players[index].currentPosition.x < initialx and 
				players[index].currentPosition.x > initialx - newx and
				players[index].currentPosition.y < initialy and
				players[index].currentPosition.y > initialy - newy then
					insidelen = insidelen + 1
					arrInside[insidelen] = players[index]
					selected = true
			end	 
		-- quadrant 4
		elseif newx < 0 and newy > 0 then
			if players[index].currentPosition.x < initialx and 
				players[index].currentPosition.x > initialx - newx and
				players[index].currentPosition.y > initialy and
				players[index].currentPosition.y < initialy + newy then
					insidelen = insidelen + 1
					arrInside[insidelen] = players[index]
					selected = true
			end
		end
	end
end