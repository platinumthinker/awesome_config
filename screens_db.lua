local naughty = require("naughty")

local defaultOutput = 'eDP1'

outputMapping = {
    ['DP-1'] = 'DP1',
    ['DP-2'] = 'DP2',
    ['DP-3'] = 'DP3',
    ['VGA-1'] = 'VGA1',
    ['LVDS-1'] = 'LVDS1',
    ['HDMI-A-1'] = 'HDMI1',
    ['HDMI-A-2'] = 'HDMI2',
    ['eDP-1'] = 'eDP1',
    ['eDP-2'] = 'eDP2',
}

screens = {
    ['2088484784921'] = { -- DP1
        ['connected'] = function (xrandrOutput, count)
            return '--output ' .. xrandrOutput .. ' --left-of ' .. defaultOutput .. ' --primary'
        end,
		['disconnected'] = function (xrandrOutput, count)
            if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
			end
			return nil
		end
    },
  	['2088490884821'] = { -- HDMI1
  		['connected'] = function (xrandrOutput, count)
            return '--output ' .. xrandrOutput .. ' --right-of ' .. defaultOutput
  		end,
  		['disconnected'] = function (xrandrOutput, count)
  			if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
  			end
            return nil
  		end
  	},
	['default'] = {
		['connected'] = function (xrandrOutput, count)
            if count > 1 then
                return '--output ' .. xrandrOutput .. ' --off --same-as' .. defaultOutput .. ' --auto'
            elseif xrandrOutput ~= defaultOutput then
                return '--output  --primary ' .. xrandrOutput .. ' --same-as' .. defaultOutput
            else
                return nil
            end
		end,
		['disconnected'] = function (xrandrOutput, count)
            if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
            end
            return nil
		end
	},
}
