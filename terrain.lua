terrain = {}
levels = {}
numCurrentLevel = 0

-- coordonnées écran par rapport au terrain
camX = 1 -- TODO: devrait être en coordonnées pixels si on veut un truc continu (?)
camY = 1

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
	h = 9,
	s = {4,5},
	d = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,0},
	     {0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0},
	     {0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0},
	     {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}
}

function renderLevel(num)
	numCurrentLevel = num
	cur = levels[numCurrentLevel]
	tile = window.h/levels[num].h
end

function terrain.collide()

end

function terrain.update(dt)

end

function terrain.draw()
	
	j = 0
	y = camY
	while y <= camY+camH and y <= cur.h do
		x = camX
		i = 0
		while x <= camX+camW and x <= cur.w do
			if terrain.isEmpty(x,y) then
				love.graphics.setColor(100,100,100)
				love.graphics.rectangle("fill", i*tile, j*tile, tile, tile)
			
			elseif terrain.isWall(x,y) then
				love.graphics.setColor(240,240,240)
				love.graphics.rectangle("fill", i*tile, j*tile, tile, tile)
			end
			i = i+1
			x = x+1
		end
		j = j+1
		y = y+1
	end
	love.graphics.setColor(255,255,255)
	love.graphics.print("camX "..camX,0,0)
	love.graphics.print("camY "..camY,0,20)
	
end

function terrain.collide(player)
	--[
	if terrain.isWall(math.floor(player.x),math.floor(player.y)) then -- en bas à gauche
	print("cas1")
		dx = 1-math.mod(player.x,1)
		dy = math.mod(player.y,1)
		print("dx"..dx)
		print("dy"..dy)
		if dy <= dx then
			print("cas1a")
			player.y = player.y - dy
			player.jumping = true
			collide = true
		else
			print("cas1b")
			player.x = player.x + dx
			player.jumping = true
			collide = true
		end
	elseif terrain.isWall(math.floor(player.x+player.w),math.floor(player.y)) then -- en bas à droite
	print("cas2")
		dx = math.mod(player.x+player.w,1)
		dy = 1-math.mod(player.y,1)
		if dy <= dx then
			player.y = player.y - dy
			player.jumping = true
			collide = true
		else
			player.x = player.x - dx
			player.jumping = true
			collide = true
		end
	elseif terrain.isWall(math.floor(player.x),math.floor(player.y-player.h)) then -- en haut à gauche
	print("cas3")
		dx = 1-math.mod(player.x,1)
		dy = math.mod(player.y+player.h,1)
		if dy <= dx then
			player.y = player.y + dy
			player.jumping = true
		else
			player.x = player.x + dx
			player.jumping = true
		end
	elseif terrain.isWall(math.floor(player.x+player.w),math.floor(player.y-player.h)) then -- en haut à droite
	print("cas4")
		dx = math.mod(player.x+player.w,1)
		dy = math.mod(player.y+player.h,1)
		if dy <= dx then
			player.y = player.y + dy
			player.jumping = true
		else
			player.x = player.x - dx
			player.jumping = true
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

