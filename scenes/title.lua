local Scene = require("lib.scene")

local Hand = require("entities.hand")
local Mouse = require("entities.mouse")

local TitleScene = Scene:extend()

function TitleScene:init()
	self.hand = Hand()
	Mouse({ x = 100, y = 100, frame = 2 })
	Mouse({ x = 100, y = 120, frame = 2 })
end

function TitleScene:update(dt)
	Scene.update(self, dt)

	Mouse:each(function(e)
		if e:overlaps(self.hand) then print("HIT") end
	end)
end

function TitleScene:draw()
	Scene.draw(self)

	love.graphics.push()
	love.graphics.origin()
	love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
	love.graphics.pop()
end

return TitleScene
