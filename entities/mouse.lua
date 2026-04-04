local Sprite = require("lib.sprite")
local SpriteSheet = require("lib.spritesheet")

local Mouse = Sprite:extend({
	sheet = SpriteSheet({ filename = 'assets/mouse.png', frameWidth = 8, frameHeight = 8 }),
	body = { x = 0, y = 0, width = 8, height = 8 },
	idle = { interval = 2, 1, 2, 3, 4, 5, 6, }
})

function Mouse:update(dt)
	Sprite.update(self, dt)
	local dx = love.keyboard.isDown("d") and 1 or love.keyboard.isDown("a") and -1 or 0
	local dy = love.keyboard.isDown("s") and 1 or love.keyboard.isDown("w") and -1 or 0
	self.x = self.x + dx
	self.y = self.y + dy
end

return Mouse
