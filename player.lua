player = {}
const = 350

function player.init()
	player.w = 20
	player.h = 30
	player.x = window.w/2
	player.y = window.h-150
	player.vx = 0
	player.vy = 0
	player.jumping = false
end

function player.update(dt)
	-- déplacement de base	
	player.x = player.x + const * player.vx * dt
	player.y = player.y + const * player.vy * dt

	if love.keyboard.isDown("right","d") then
		player.vx = 1
	elseif love.keyboard.isDown("left") then
		player.vx = -1
	else player.vx = 0
	end

	-- saut
	if love.keyboard.isDown("up") then
		--print(player.vy)
		player.jump()
	end
	
	-- gravité
	if not player.ground() then
		player.vy = player.vy + 9.81*dt
	elseif not player.jumping then
		player.vy = 0
	end
	
end

function player.jump()
	if not player.jumping then
		player.vy = -2
		player.jumping = true
	end
end

function player.draw()
	love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
	love.graphics.print(tostring(player.ground()), 400, 300)
end

function player.ground()
	if player.y + player.h > window.h-150 then -- on touche
		player.jumping = false
		player.y = window.h - 150 - player.h
		return true
	else
		return false
	end
end

function player.keypressed(key)

end

