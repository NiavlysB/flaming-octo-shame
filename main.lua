
function love.draw()
    love.graphics.print('Hello World!', 400, 300)
end

function love.load()
	success = love.graphics.setMode(1600, 900, false)
end
