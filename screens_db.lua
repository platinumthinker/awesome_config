local defaultOutput = 'eDP1'

outputMapping = {
    ['DP-1'] = 'DP1',
    ['DP-2'] = 'DP2',
    ['DP-3'] = 'DP3',
    ['VGA-1'] = 'VGA1',
    ['LVDS-1'] = 'LVDS1',
    ['HDMI-A-1'] = 'HDMI1',
    ['HDMI-A-2'] = 'HDMI2',
    ['HDMI-A-3'] = 'HDMI3',
    ['eDP-1'] = 'eDP1',
    ['eDP-2'] = 'eDP2',
    -- ['DP-4'] = 'DP1-2',
    -- ['DP-5'] = 'DP1-3',
}

screens = {
    ['2088484784921'] = { -- Home DELL 2k monitor, left (DP3)
        ['connected'] = function (xrandrOutput, count)
            local currentOut = '--output ' .. xrandrOutput .. ' --mode 1920x1080'
            local disablePrime = '--output ' .. defaultOutput .. ' --off'
            if count > 2 then
                return disablePrime
            else
                return currentOut .. ' --left-of ' .. defaultOutput .. ' --primary'
            end
        end,
        ['disconnected'] = function (xrandrOutput, count)
            if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
			end
			return nil
		end
    },
    ['2088490884821'] = { -- Home DELL 2k monitor, right (DP2)
        ['connected'] = function (xrandrOutput, count)
            local currentOut = '--output ' .. xrandrOutput .. ' --primary --mode 1920x1080'
            if count > 2 then
                return disablePrime
            else
                return currentOut .. ' --left-of ' .. defaultOutput
            end
        end,
        ['disconnected'] = function (xrandrOutput, count)
            if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
            end
            return nil
        end
    },
    ['2408376716826'] = { -- DELL FullHD monitor on work place, right
        ['connected'] = function (xrandrOutput, count)
            local currentOut = '--output ' .. xrandrOutput .. ' --mode 1920x1080'
            local disablePrime = '--output ' .. defaultOutput .. ' --off'
            if count > 2 then
                return disablePrime .. ' ' .. currentOut .. ' --left-of DP1-3'
            else
                return currentOut .. ' --left-of ' .. defaultOutput
            end
        end,
        ['disconnected'] = function (xrandrOutput, count)
            if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
            end
            return nil
        end
    },
    ['2408367846726'] = { -- DELL FullHD monitor on work place, left
        ['connected'] = function (xrandrOutput, count)
            local currentOut = '--output ' .. xrandrOutput .. ' --mode 1920x1080'
            return currentOut .. ' --right-of ' .. defaultOutput .. '--primary'
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
                return '--output ' .. xrandrOutput .. ' --off ' .. defaultOutput .. ' --auto'
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
