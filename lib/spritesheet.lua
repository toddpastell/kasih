local Class = require("lib.class")

local SpriteSheet = Class:extend({
	frameWidth = 16,
	frameHeight = 16,
})

function SpriteSheet:init()
	assert(self.filename, "SpriteSheet requires a filename")
	self.texture = love.graphics.newImage(self.filename)
	local width, height = self.texture:getDimensions()
	self.frames = {}
	local rows = math.floor(height / self.frameHeight)
	local cols = math.floor(width / self.frameWidth)
	for j = 0, rows - 1 do
		for i = 0, cols - 1 do
			table.insert(self.frames,
				love.graphics.newQuad(i * self.frameWidth, j * self.frameHeight, self.frameWidth, self.frameHeight, width,
					height))
		end
	end
end

function SpriteSheet:getFrame(index)
	return self.frames[index]
end

return SpriteSheet
