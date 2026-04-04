local Sprite = require("lib.sprite")
local SpriteSheet = require("lib.spritesheet")

local Hand = Sprite:extend({
	sheet = SpriteSheet({ filename = 'assets/hand.png', frameWidth = 8, frameHeight = 8 }),
	idle = { interval = 2, 1 },
	grab = { interval = 2, 2 },
})

function Hand:update(dt)
	Sprite.update(self, dt)

	self.x = love.mouse.getX() * 0.25
	self.y = love.mouse.getY() * 0.25

	local down = love.mouse.isDown(1)
	self:setState(down and "grab" or "idle")
end

return Hand
