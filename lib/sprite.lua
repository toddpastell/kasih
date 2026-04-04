local Entity = require("lib.entity")

local Sprite = Entity:extend({
	frame = 1,
	state = "idle",
	idle = { interval = 8, 1 },
	tick = 0,
	step = 1,
})

function Sprite:init()
	Entity.init(self)
	assert(self.sheet, "Sprite requires a SpriteSheet")
end

function Sprite:update(dt)
	self.tick = self.tick + 1
	local animation = self[self.state]
	if self.tick > animation.interval then
		self.tick = 0
		self.step = self.step + 1
		if self.step > #animation then
			self.step = 1
			if animation.next then
				self:setState(animation.next)
			end
		end
	end
	self.frame = animation[self.step]
end

function Sprite:draw()
	love.graphics.draw(self.sheet.texture, self.sheet:getFrame(self.frame), self.x, self.y)
end

function Sprite:setState(state)
	self.state = state
	self.tick = 0
	self.step = 1
	-- maybe set the frame?
end

return Sprite
