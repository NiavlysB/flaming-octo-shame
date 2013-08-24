player = {}

function player.init()
	player.w = 20
	player.h = 30
	player.x = window.w/2
	player.y = window.h-50
	player.vx = 0
	player.vy = 0
end

function player.update(dt)
	player.x = player.x + player.x * player.vx * dt
	player.y = player.y + player.y * player.vy * dt
	if love.keyboard.isDown("right","d") then
		player.vx = 1
	elseif love.keyboard.isDown("left") then
		player.vx = -1
	else player.vx = 0
	end
		
end

function player.draw()
	love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end

function player.keypressed()
	
end
