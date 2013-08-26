game = {}


function game.init()
	played = false
	state = "game"
	game.doingflash = false
	game.countdown = 10
	love.audio.play(sonRepos)
end

function game.update(dt)
	count(dt)
end

function game.drawHUD()
	if state == "end" then
		love.graphics.draw(screenshot)
		if victory then
			love.graphics.draw(imgVictory,0,0)
			if not played then
				love.audio.play(sonVic)
				played = not played
			end
		else
			love.graphics.draw(imgFailure,0,0)
			if not played then
				love.audio.play(sonMort)
				played = not played
			end
		end
	elseif game.doingflash then
		love.graphics.rectangle("fill",0,0,800,450)
	end
	love.graphics.draw(imgOverlay,0,0)
end

function game.checkVictory()
	return player.safe
end

function count(dt)
	if game.countdown <= 0 then -- time's up
		screenshot = love.graphics.newImage(love.graphics.newScreenshot())
		if game.checkVictory() then
			state = "end"
			victory = true
		else
			state = "end"
			victory = false
		end
	else
		if game.countdown <= 0.25 then
			if game.countdown > 0.1 then
				game.doingflash = true
			else
				game.doingflash = false
			end
		end

		game.countdown = game.countdown - dt
	end
end
