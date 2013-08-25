require("player")
require("bg")
require("game")
require("terrain")
require("AnAL")

window = {}
window.w = love.graphics.getWidth()
window.h = love.graphics.getHeight()

function blanc()
	love.graphics.setColor(255,255,255,255)
end

function love.load()
	--love.graphics.setColorMode("replace")
	local perso = love.graphics.newImage("img/animp.png")
	anim = newAnimation(perso, 30, 40, 0.125, 0)
	local safe = love.graphics.newImage("img/animSafe.png")
	animSafe = newAnimation(safe, 50, 50, 0.01, 0)
	imgSafesafe = love.graphics.newImage("img/safesafe.png")
	imgSafeunsafe = love.graphics.newImage("img/safeunsafe.png")
	imgBg = love.graphics.newImage("img/bg.png")
	imgTile = love.graphics.newImage("img/tile.png")
	imgPerso = love.graphics.newImage("img/p1.png")
	imgOverlay = love.graphics.newImage("img/overlay.png")
	
	defaultfont = love.graphics.newFont(15)
	font = love.graphics.newFont("LCD_Solid.ttf",400)
	
	game.init()
	
	--loadLevel("level0")
	renderLevel(0)
	player.init()
end

function love.update(dt)
    --dt = math.min(dt, 1/10)
	if state == "game" then
		game.update(dt)
		player.update(dt)
		terrain.update(dt)
	end
end

function love.draw()
	if state == "game" then
		drawBg()
		terrain.draw()
		player.draw()
		game.drawHUD()
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
