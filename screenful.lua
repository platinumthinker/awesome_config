----------------------------------------------------------------------------
---- @author dluksza &lt;dariusz@luksza.org&gt;
---- @copyright 2012 dluksza
------------------------------------------------------------------------------

-- Package envronment
local awful = require("awful")
local screen = require("awful.screen")
local io = require("io")
local os = require("os")
local awesome = awesome
require('screens_db')

local card = 'card0'
local dev = '/sys/class/drm/'
local configPath = awful.util.getdir("config") .. "/screens_db.lua"
local cardDev = dev .. card
local outputsCount = 0
local wallpaperPath = awful.util.getdir("config") .. "/wallpaper.png"

local function log(text)
	local log = io.open('/tmp/awesomewm-widget-screenful.error.log', 'a+')
	log:write(text .. "\n")
	log:flush()
	log:close()
end

local function isOutputConnected(path)
	local status = io.open(path .. '/status', 'r')
	local value = status:read('*all')

	return 'connected\n' == value
end

local function connectedOutputs(path, card)
	local result = {}
	local outputs = io.popen('ls -1 -d ' .. path .. '/' .. card .. '-*')
    outputsCount = 0
	while true do
		local output = outputs:read('*line')
		if not output then break end
		if isOutputConnected(output) then
            outputsCount = outputsCount + 1
			result[output] = true
		end
	end

	return result
end

local outputs = connectedOutputs(cardDev, card)

local function emptyStr(str)
	return str == nil or str == ''
end

local function getScreenId(output)
	local screenId = nil

    if isOutputConnected(output) then
		screenId = ''
		os.execute("udevadm settle")
		local edid = io.open(output .. '/edid', 'rb')
		local id = edid:read('*all')
        io.close(edid)
		if emptyStr(id) then
			log('cannot read EDID from ' .. output .. '/edid')
			return false
        end
        for i = 12, 17 do
            code = id:byte(i)
            if code then
                screenId = screenId .. code
            end
        end
    end
	return screenId
end

local function getXrandrOutput(outputPath, outCard)
	local regex = dev .. outCard .. '/' .. outCard .. '[-]'
	local drmName = string.gsub(outputPath, regex, '')

	if outputMapping[drmName] then
		return outputMapping[drmName]
	end

	return drmName
end

local function mergeTables(table1, table2)
	local result = {}
	for k,v in pairs(table1) do
		result[k] = v
	end
	for k,v in pairs(table2) do
		result[k] = v
	end

	return result
end

local function hasConfigurationFor(screenId)
	local file = io.open(configPath, 'r')
	local conf = file:read('*all')
	file:close()

	return string.find(conf, "['\"]" .. screenId .. "['\"]")
end

local function appendConfiguration(screenId, xrandrOut)
	local file = io.open(configPath, 'a')

	file:write("--\t['" .. screenId .. "'] = { -- " .. xrandrOut .. "\n")
	file:write("--\t\t['connected'] = function (xrandrOutput, outputCount)\n")
	file:write("--\t\t\tif xrandrOutput ~= defaultOutput then\n")
	file:write("--\t\t\t\treturn '--output ' .. xrandrOutput .. ' --auto --same-as ' .. defaultOutput\n")
	file:write("--\t\t\tend\n")
	file:write("--\t\t\treturn nil\n")
	file:write("--\t\tend,\n")
	file:write("--\t\t['disconnected'] = function (xrandrOutput, outputsCount)\n")
	file:write("--\t\t\tif xrandrOutput ~= defaultOutput then\n")
	file:write("--\t\t\treturn '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'\n")
	file:write("--\t\t\tend\n")
	file:write("--\t\t\treturn nil\n")
	file:write("--\t\tend\n")
	file:write("--\t}\n")
	file:flush()
	file:close()
end

local function setupScreen(xrandrParams)
    log('execute xrandr ' .. xrandrParams)
    -- Try to run XRandr command, redirect stderr to stdout and echo for catch
    -- all cases of errors
    -- It's very painful way to catch erorrs but i don't know better way
    local handle = io.popen('xrandr ' .. xrandrParams .. ' 2>&1 || echo ::ERROR::', 'r')
    if handle == nil then
        log('error execute cmd')
        return false
    end
    local result = handle:read("*all")
    handle:close()

    if result:find "::ERROR::" then
        log('error: ' .. result)
        return false
    end

    log('results: ' .. result)
    return true
end

local function performConfiguredAction(screenId, action, xrandrOut)
    log("Action: " .. action)
    log("xrandrOut: " .. xrandrOut)
    log("screenId: " .. tostring(screenId))
	local xrandrOpts = ''
    if screenId then
        local configuration = screens[screenId]
        if configuration then
            if configuration[action] then -- get xrandr options
                log("get xrandrOpts :".. xrandrOpts)
                log("for outCounts:".. tostring(outputsCount))
                xrandrOpts = configuration[action](xrandrOut, outputsCount)
            end
        else -- configuration not found, append configuration template
            if tostring(screenId):len() ~= 0 and not hasConfigurationFor(screenId) then
                appendConfiguration(screenId, xrandrOut)
            end
        end
    end

    -- Don't run xrandr if config empty
    if xrandrOpts:len() == 0 then
        return false
    end
    if xrandrOpts then
        return setupScreen(xrandrOpts)
    end
end

local function disableOutput(out, changedCard)
	local xrandrOut = getXrandrOutput(out, changedCard)
	local screenId = getScreenId(out)
    return performConfiguredAction(screenId, 'disconnected', xrandrOut)
end

local function enableOutput(out, changedCard)
	local xrandrOut = getXrandrOutput(out, changedCard)
	local screenId = getScreenId(out)
    return performConfiguredAction(screenId, 'connected', xrandrOut)
end

function updateScreens(changedCard)
	local newCardDev = dev .. changedCard
	local newOutputs = connectedOutputs(newCardDev, changedCard)
	local mergedOutputs = mergeTables(outputs, newOutputs)
    log("Update screens: " .. changedCard)

	for out in pairs(mergedOutputs) do
        local changeCfg
		if not outputs[out] then -- connected
            log("enable output: " .. out)
			changeCfg = enableOutput(out, changedCard)
            if not changeCfg then
                newOutputs[out] = nil
            end
		elseif not newOutputs[out] then -- disconnected
            log("disable output: " .. out)
			changeCfg = disableOutput(out, changedCard)
		end
        if changeCfg then
            mergedOutputs[out] = nil
        end
	end

    -- reinit awesome
    -- all code after restart don't be execute
    log("restart awesomewm")
    log("=================================================")
    log("")
    log("")
    log("")
    awesome.restart()
end

