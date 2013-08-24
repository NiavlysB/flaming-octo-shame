terrain = {}
levels = {}

-- coordonnées écran par rapport au terrain
camX = 0
camY = 0

function loadLevel(file)
	newlevel = {}
	--if love.filesystem.exists(file) and love.filesystem.isFile(file) then
	--	love.filesystem.read(file)
	--end	
end

levels[0] = {
	w: 60
	h: 12
	s: (4,5)
	d: [ [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	     [0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
	     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0],
	     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0],
	     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	     [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] ]

function renderLevel(num)
	
end

function terrain.collide()

end

function terrain.update(dt)

end

function terrain.draw()
	
