game = {}

function game.init()
	state = "game"
	game.countdown = 10
end

function game.update(dt)
	count(dt)
end

function game.drawHUD()
	love.graphics.draw(imgOverlay,0,0)
end

function game.flash()
	love.graphics.rectangle("fill",0,0,800,450)
end

function count(dt)
	if game.countdown > 0 then
		game.countdown = game.countdown - dt
	else -- time's up
		game.flash()
		game.init()
		--love.event.push("quit")
	end
end
