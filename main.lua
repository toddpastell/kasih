local Scene = require("lib.scene")

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	local font = love.graphics.newFont("assets/monogram.ttf", 32)
	love.graphics.setFont(font)
	Scene:load(require("scenes.title"))
end

function love.update(dt)
	Scene.current:update(dt)
end

function love.draw()
	love.graphics.scale(4)
	Scene.current:draw()
end
