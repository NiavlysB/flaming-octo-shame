require "player"
require "bg"
require "game"
require "terrain"

window = {}
window.w = love.graphics.getWidth()
window.h = love.graphics.getHeight()

function love.load()
	state = "game"
	
	--loadLevel("level0")
	renderLevel(0)
	
	player.init()
end

function love.update(dt)
	if state == "game" then
		player.update(dt)
	end
end

function love.draw()
	if state == "game" then
		player.draw()
	end
end


function love.keyreleased(key)
	if key == "f" then
		love.graphics.toggleFullscreen()
	end
end

function love.keypressed(key)
	player.keypressed(key)
end
