local log = {}

log.outfilepath = os.date('.\\session_log_%H_%M_%S.txt') -- character ':' not accepted in file names

local categories = {
	['debug'] = true,
	['host'] = true,
	['item'] = true,
	['messenger'] = true
}

local function writetofile(cat, txt)
	if log.outfilepath ~= '' then
	local f, err = io.open(log.outfilepath, 'a')
		if f then
			f:write(os.date("[%X] ") .. "[" .. cat .. "] " .. txt .. "\n")
			f:close()
		else
			print(err)
		end
	end
end

function log.message(category, text)
	if categories[category] then
		writetofile(category, text)
	end
end

return log