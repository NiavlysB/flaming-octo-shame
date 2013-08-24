player = {}
const = 7 -- 350
g = 9.81

function player.init()
	player.w = 0.6
	player.h = 0.8
	player.x = 3
	player.y = 6
	player.vx = 0
	player.vy = .5
	timeJump = 0
	--player.falling = true
end

function player.update(dt)
	
	-- gravité
	--if player.falling then
		player.vy = player.vy + g * dt
	--end
	
	-- mouvement	
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

	
	if love.keyboard.isDown("right") then
		player.vx = 1
	elseif love.keyboard.isDown("left") then
		player.vx = -1
	else player.vx = 0
	end
	
	-- 	player.vx = player.vx + (1-player.vx) * 2
	
	--[[
	if love.keyboard.isDown("down","d") then
		player.vy = 1
	elseif love.keyboard.isDown("up") then
		player.vy = -1
	else player.vy = 0
	end
	]]
	-- saut
	if love.keyboard.isDown("up") then
		if timeJump == 0 then
		player.jump()
		end
	end
	
	if timeJump > 0 then
		timeJump = timeJump - dt
	else
		timeJump = 0
	end
	
	anim:update(dt)

end

function player.jump()
	timeJump = .4
	player.vy = -2
end

function player.draw()
	
	--love.graphics.print("x "..(player.x),0,40)
	--love.graphics.print("x "..(player.x),0,40)
	--love.graphics.print("FPS:".. love.timer.getFPS(),0,100)
	
	love.graphics.setColor(180,255,180)
	--love.graphics.rectangle("fill", (player.x-camX)*tile, (player.y-camY-player.h)*tile, player.w*tile, player.h*tile)
	anim:draw( (player.x-camX)*tile, (player.y-camY-player.h)*tile )
	--love.graphics.setColor(255,0,0)
	--love.graphics.circle("fill", (player.x-camX)*tile, (player.y-camY)*tile, 10)
	
end

function player.keypressed(key)

end

