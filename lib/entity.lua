local Class = require("lib.class")

local Entity = Class:extend({
	pool = {},
	x = 0,
	y = 0,
	body = { x = 0, y = 0, width = 1, height = 1 }
})

function Entity:extend(tbl)
	tbl = Class.extend(self, tbl)
	tbl.pool = {}
	return tbl
end

function Entity:init()
	Entity.pool[self] = true
	self.pool[self] = true
end

function Entity:destroy()
	Entity.pool[self] = nil
	self.pool[self] = nil
end

function Entity:update(dt) end

function Entity:draw() end

function Entity:each(fn, ...)
	for entity, _ in pairs(self.pool) do
		fn(entity, ...)
	end
end

function Entity:overlaps(other)
	return self.x + self.body.x < other.x + other.body.x + other.body.width
			and self.x + self.body.x + self.body.width > other.x + other.body.x
			and self.y + self.body.y < other.y + other.body.y + other.body.height
			and self.y + self.body.y + self.body.height > other.y + other.body.y
end

return Entity
