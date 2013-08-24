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
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
	     {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}}
}

function renderLevel(num)
	numCurrentLevel = num
	tile = window.h/levels[num].h
end

function terrain.collide()

end

function terrain.update(dt)

end

function terrain.draw()
	cur = levels[numCurrentLevel]
	
	j = 0
	y = camY
	while y <= camY+camH and y <= cur.h do
		x = camX
		i = 0
		while x <= camX+camW and x <= cur.w do
			if cur.d[y][x] == 0 then
				love.graphics.setColor(100,100,100)
				love.graphics.rectangle("fill", i*tile, j*tile, tile, tile)
			
			elseif cur.d[y][x] == 1 then
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
