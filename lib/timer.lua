local Class = require("lib.class")

local Timer = Class:extend({
	pool = {}
})

function Timer:update(dt)
	for job, _ in pairs(self.pool) do
		job.time = job.time - dt
		if job.time <= 0 then
			job.fn()
			if job.period then
				job.time = job.period
			else
				self.pool[job] = nil
			end
		end
	end
end

function Timer:after(delay, fn)
	local job = { time = delay, fn = fn }
	self.pool[job] = true
	return job
end

function Timer:every(period, fn)
	local job = { time = period, period = period, fn = fn }
	self.pool[job] = true
	return job
end

function Timer:cancel(job)
	self.pool[job] = nil
end

function Timer:clear()
	self.pool = {}
end

return Timer
