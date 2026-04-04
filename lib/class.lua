local Class = {}
Class.__index = Class

function Class:init() end

function Class:didInit() end

function Class:new(tbl)
	tbl = tbl or {}
	setmetatable(tbl, self)
	tbl:init()
	tbl:didInit()
	return tbl
end

function Class:extend(tbl)
	tbl = tbl or {}
	tbl.__index = tbl
	return setmetatable(tbl, {
		__index = self,
		__call = function(class, ...)
			return class:new(...)
		end
	})
end

return Class
