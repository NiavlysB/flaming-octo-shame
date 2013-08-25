function drawBg()
	love.graphics.draw(imgBg, 0, 0)
	love.graphics.setColor(255,0,0,90)
	love.graphics.setFont(font)
	love.graphics.printf(math.abs(math.ceil(game.countdown)), 0, 50, 800, "center")
	love.graphics.setFont(defaultfont)
	blanc()
end

