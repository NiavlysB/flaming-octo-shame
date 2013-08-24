require("player")
require("bg")
require("game")
require("terrain")
require("AnAL")

window = {}
window.w = love.graphics.getWidth()
window.h = love.graphics.getHeight()

function love.load()
	state = "game"
	love.graphics.setColorMode("replace")
	local perso = love.graphics.newImage("img/animp.png")
	anim = newAnimation(perso, 30, 40, 0.125, 0)
	imgBg = love.graphics.newImage("img/bg.png")
	imgTile = love.graphics.newImage("img/tile.png")

	--loadLevel("level0")
	renderLevel(0)
	player.init()
end

function love.update(dt)
    --dt = math.min(dt, 1/10)
	if state == "game" then
		player.update(dt)
	end
end

function love.draw()
	if state == "game" then
		drawBg()
		terrain.draw()
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
