local Class = require("lib.class")
local Entity = require("lib.entity")
local Timer = require("lib.timer")

local Scene = Class:extend({ current = nil })

function Scene:update(dt)
	Timer:update(dt)
	Entity:each(function(e) e:update(dt) end)
end

function Scene:draw()
	Entity:each(function(e) e:draw() end)
end

function Scene:destroy()
	Entity:each(function(e) e:destroy() end)
end

function Scene:load(next)
	if self.current == next then return end
	if self.current then self.current:destroy() end
	self.current = next()
end

return Scene
