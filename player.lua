player = {}
const = 7 -- 350
g = 9.81

function player.init()
	player.w = 0.6-1/50
	player.h = 0.8
	player.x = cur.s[1]
	player.y = cur.s[2]
	player.vx = 0
	player.vy = .5
	timeJump = 0
	player.safe = false
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
	terrain.collide(player)
	
	
	if love.keyboard.isDown("right") then
		--player.vx = player.vx + (1-player.vx) * 0.25
		player.vx = 1
	elseif love.keyboard.isDown("left") then
		--player.vx = player.vx + (-1-player.vx) * 0.25
		player.vx = -1
	else -- pas de touche de mouvement, mais peut-être saut en cours
		--if player.vy ~= 0 and player.vx ~= 0 then -- saut en cours
		if math.abs(player.vx) > 0 then
			player.vx = player.vx - (player.vx/math.abs(player.vx)) * (math.abs(player.vx)) * 0.25
		else -- par terre
			player.vx = 0
		end
	end
	
	if false then
		if love.keyboard.isDown("down","d") then
			player.vy = 1
		elseif love.keyboard.isDown("up") then
			player.vy = -1
		else player.vy = 0
		end
	else
		-- saut
		if love.keyboard.isDown("up") then
			if timeJump == 0 and player.vy == 0 then
				player.jump()
			end
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
	player.vy = -2.5
end

function player.draw()
	--if math.abs(player.vx) < 0.001 then
	--	love.graphics.draw(imgPerso, (player.x-camX)*tile, (player.y-camY-player.h)*tile )
	--else
	if player.safe then
		love.graphics.setColor(0,255,0)
	end
	anim:draw( (player.x-camX)*tile, (player.y-camY-player.h)*tile )
	--love.graphics.setColor(255,0,0)
	--love.graphics.rectangle("line",(player.x-camX)*tile, (player.y-camY-player.h)*tile, player.w*tile, player.h*tile)
	blanc()
	--end
	--love.graphics.setColor(255,0,0)
	--love.graphics.circle("fill", (player.x-camX)*tile, (player.y-camY)*tile, 10)
	
end

function player.keypressed(key)

end

