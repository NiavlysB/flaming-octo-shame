player = {}
const = 2 -- 350

function player.init()
	player.w = 0.5
	player.h = 1.5
	player.x = 3
	player.y = 6
	player.vx = 0
	player.vy = 0
	player.jumping = false
end

function player.update(dt)
	
	-- gravité
	--player.y = player.y + 9.81*dt
	
	-- déplacement de base	
	player.x = player.x + const * player.vx * dt
	player.y = player.y + const * player.vy * dt
	
	terrain.collide(player)
	
		
	--[[ -- Déplacement caméra
	if love.keyboard.isDown("right","d") then
		camX = camX + 1
	elseif love.keyboard.isDown("left") then
		camX = camX - 1
	end
	]]

	

	if love.keyboard.isDown("right","d") then
		player.vx = 1
	elseif love.keyboard.isDown("left") then
		player.vx = -1
	else player.vx = 0
	end
	
	if love.keyboard.isDown("down","d") then
		player.vy = 1
	elseif love.keyboard.isDown("up") then
		player.vy = -1
	else player.vy = 0
	end

	-- saut
	if love.keyboard.isDown("up") then
		--print(player.vy)
		player.jump()
	end

end

function player.jump()
	-- TODO: permettre des petits sauts (détecter la longueur de l'appui sur la touche)
	if not player.jumping then
		player.vy = -.5
		player.jumping = true
		--player.y = player.y -0.01
	end
end

function player.draw()
	
	love.graphics.print("x "..(player.x),0,40)
	love.graphics.print("y "..(player.y),0,60)
	love.graphics.setColor(180,255,180)
	love.graphics.rectangle("fill", (player.x-camX)*tile, (player.y-camY-player.h)*tile, player.w*tile, player.h*tile)
	love.graphics.setColor(255,0,0)
	love.graphics.circle("fill", (player.x-camX)*tile, (player.y-camY)*tile, 10)
end

function player.keypressed(key)

end

