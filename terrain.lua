terrain = {}
levels = {}
numCurrentLevel = 0

-- coordonnées écran par rapport au terrain
camX = 1.5
camY = 1.5

camH = 9 -- (coordonnées tiles)
camW = 16

offset = 1.5

-- taille d'une tile en pixels
tile = 50 -- 50

function loadLevel(file)
	newlevel = {}
	--if love.filesystem.exists(file) and love.filesystem.isFile(file) then
	--	love.filesystem.read(file)
	--end
end

levels[0] = {
	w = 17,
	h = 10,
	s = {3,3},
	d = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
	     {1,0,0,0,0,0,0,0,0,0,0,0,1,9,0,0,1},
	     {1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,1},
	     {1,1,1,1,0,1,0,0,0,0,0,0,1,0,0,0,1},
	     {1,0,0,0,0,1,0,0,0,0,0,0,1,0,1,1,1},
	     {1,0,1,1,1,1,0,0,1,1,1,0,1,0,0,0,1},
	     {1,0,0,0,0,1,1,0,0,1,1,0,1,1,1,0,1},
	     {1,1,1,1,0,1,1,1,0,1,1,0,1,0,0,0,1},
	     {1,1,1,1,0,0,0,0,0,1,1,0,0,0,1,1,1},
	     {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}
}

function renderLevel(num)
	numCurrentLevel = num
	cur = levels[numCurrentLevel]
	tile = 50 -- window.h/levels[num].h
end


function terrain.update(dt)
	--camX = player.x - camW/2
	animSafe:update(dt)
	if terrain.isSafe(math.floor(player.x), math.floor(player.y)) and player.vy == 0 and math.floor(player.x + player.w - 0.001) == math.floor(player.x) then
		player.safe = true
	else
		player.safe = false
	end
	
end

function terrain.draw()
	y = 1
	while y <= cur.h do
		x = 1
		while x <= cur.w do
			if terrain.isWall(x,y) then
				love.graphics.draw(imgTile, (x-offset)*tile, (y-offset)*tile)
			elseif terrain.isSafe(x,y) then
				--animSafe:draw((x-offsetX)*tile, (y-offset)*tile)
				if player.safe then
					love.graphics.draw(imgSafesafe, (x-offset)*tile, (y-offset)*tile)
				else
					love.graphics.draw(imgSafeunsafe, (x-offset)*tile, (y-offset)*tile)
				end
			end
			x = x+1
		end
		y = y+1
	end
	
	--love.graphics.print("X "..player.x,0,0)
	--love.graphics.print("w "..player.w,0,20)
	--love.graphics.print(math.floor(player.x + player.w - 0.001),0,40)
	--love.graphics.print(math.floor(player.x),0,60)
	--love.graphics.print(tostring(terrain.isSafe(math.floor(player.x), math.floor(player.y))), 0,80)
	--love.graphics.print(tostring(player.vy == 0), 0,100)
	--love.graphics.print(tostring(math.floor(player.x + player.w - 0.001) == math.floor(player.x)), 0,120)
	--[[if player.safe then
		love.graphics.print("safe",0,40)
	else
		love.graphics.print("unsafe",0,40)
	end]]
	--love.graphics.print("x "..player.x,0,20)
	--love.graphics.print("y "..player.y,0,40)
	
	
end

if false then

--[[function terrain.collide(player)
	-- check des y
	-- quatre points :
	-- 		player.x, player.y
	-- 		player.x+player.w, player.y
	-- 		player.x, player.y-player.h
	--		player.x+player.w, player.y-player.h
	if terrain.isWall(math.floor(player.x), math.floor(player.y) then
		if player.vy > 0 then -- vers le bas
			player.y = player.y - math.floor(player.y)
		else -- vers le haut (ou horiz)
			player.y = player.y + 
	terrain.isWall(math.floor(player.x+player.w), math.floor(player.y) or
	terrain.isWall(math.floor(player.x), math.floor(player.y-player.h) or
	terrain.isWall(math.floor(player.x+player.w), math.floor(player.y-player.h) then
		-- collision
		if 
	
end]]

else

function terrain.collide(player)
	collide = false
	
	-- Limites terrain (sera superflu si je résous les collisions contre un mur)
	if player.x > 16.4 then
		player.x = 16.4
		--player.vx = -player.vx
	elseif player.x <= 2 then
		player.x = 2.000001
		--player.vx = -player.vx
	end
	
	if terrain.isWall(math.floor(player.x),math.floor(player.y)) then -- en bas à gauche
		--print("cas1")
		dx = 1-math.mod(player.x,1)
		dy = math.mod(player.y,1)
		
		--print("dx"..dx)
		--print("dy"..dy)
		if dy <= dx then
		collide = true
			if (dy > 0.00001) then
				player.y = math.floor(player.y) - 0.0001
			end
		else
			player.x = player.x + dx
		end
	elseif terrain.isWall(math.floor(player.x+player.w),math.floor(player.y)) then -- en bas à droite
		--print("cas2")
		dx = math.mod(player.x+player.w,1)
		dy = math.mod(player.y,1)
		if dy <= dx then
		collide = true
			if (dy > 0.00001) then
				player.y = math.floor(player.y)
			end
		else
			player.x = player.x - dx - .000001
		end
	elseif terrain.isWall(math.floor(player.x),math.floor(player.y-player.h+0.2)) then -- en haut à gauche
		--print("cas3")
		dx = 1-math.mod(player.x,1)
		--dy = math.mod(player.y-player.h,1)
		dy = 1-math.mod(player.y-player.h,1)
		if dy <= dx then
		collide = true
			player.y = player.y + dy + 0.00001
		else
			player.x = player.x + dx
		end
	elseif terrain.isWall(math.floor(player.x+player.w),math.floor(player.y-player.h+0.2)) then -- en haut à droite
		--print("cas4")
		dx = math.mod(player.x+player.w,1)
		--dy = math.mod(player.y-player.h,1)
		dy = 1-math.mod(player.y-player.h,1)
		if dy <= dx then
		collide = true
			player.y = player.y + dy
		else
			player.x = player.x - dx -.000001
		end
	end
	if collide then
		love.graphics.print("collide",0,60)
		player.vy = 0
	else
		love.graphics.print("clear", 0, 60)
	end
end

end

function terrain.val(x,y)
	return cur.d[y][x] or 0
end

function terrain.isWall(x,y)
	return terrain.val(x,y) == 1
end

function terrain.isSafe(x,y)
	return terrain.val(x,y) == 9
end

function terrain.isEmpty(x,y)
	return terrain.val(x,y) == 0
end

