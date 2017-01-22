initialx = 0
initialy = 0
newx = 0
newy = 0
down = false

function love.mousepressed(ix, iy, button)
	down = true
	initialx = ix
	initialy = iy
	newx = 0
	newy = 0
	print("initial at ", initialx, " ", initialy)
end

function love.mousemoved(x,y,dx,dy)
	if(down == true) then
		newx = newx + dx
		newy = newy + dy
	end
end

function love.mousereleased(ox, oy, button)
	down = false
	print("Mouse Released", button, "at", ox, oy)
end