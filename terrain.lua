terrain = {}
levels = {}
numCurrentLevel = 0

-- coordonnées écran par rapport au terrain
camX = 1 -- TODO: devrait être en coordonnées pixels si on veut un truc continu (?)
camY = 6

camH = 9 -- (coordonnées tiles)
camW = 16

-- taille d'une tile en pixels
tile = 50 -- 50

function loadLevel(file)
	newlevel = {}
	--if love.filesystem.exists(file) and love.filesystem.isFile(file) then
	--	love.filesystem.read(file)
	--end
end

levels[0] = {
	w = 20,
	h = 14,
	s = {4,5},
	d = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,0},
	     {0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0},
	     {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}
}

function renderLevel(num)
	numCurrentLevel = num
	cur = levels[numCurrentLevel]
	tile = 50 -- window.h/levels[num].h
end

function terrain.collide()

end

function terrain.update(dt)
	--if player.x > camX+(camW*.75) then
	--	camX = player.x-(camW*.75) - (player.x-(camW*.75) % tile)
	--end
end

function terrain.draw()
	j = 0
	y = camY
	while y <= camY+camH and y <= cur.h do
		x = camX
		i = 0
		while x <= camX+camW and x <= cur.w do
			if terrain.isEmpty(x,y) then
				--love.graphics.setColor(240,240,240)
				--love.graphics.rectangle("fill", i*tile, j*tile, tile, tile)
			
			elseif terrain.isWall(x,y) then
				--love.graphics.setColor(100,100,100)
				--love.graphics.rectangle("fill", i*tile, j*tile, tile, tile)
				love.graphics.draw(imgTile, i*tile, j*tile)
				
			end
			i = i+1
			x = x+1
		end
		j = j+1
		y = y+1
	end
	love.graphics.setColor(255,255,255)
	love.graphics.print("camX "..camX,0,0)
	love.graphics.print("x "..player.x,0,20)
	love.graphics.print("y "..player.y,0,40)
	love.graphics.print("camW/2 "..camW/2,0,60)
	
	
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
	elseif terrain.isWall(math.floor(player.x),math.floor(player.y-player.h)) then -- en haut à gauche
		--print("cas3")
		dx = 1-math.mod(player.x,1)
		dy = 1-math.mod(player.y+player.h,1)
		if dy <= dx then
		collide = true
			player.y = player.y + dy + 0.00001
		else
			player.x = player.x + dx
		end
	elseif terrain.isWall(math.floor(player.x+player.w),math.floor(player.y-player.h)) then -- en haut à droite
		--print("cas4")
		dx = math.mod(player.x+player.w,1)
		dy = 1-math.mod(player.y+player.h,1)
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

function terrain.isEmpty(x,y)
	return terrain.val(x,y) == 0
end

