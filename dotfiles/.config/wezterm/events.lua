local wezterm = require("wezterm")
local constants = require("constants")
local M = {}

M.configurate = function(config)
	wezterm.on("window-resized", function(window, pane)
		-- Remove opacity when entering non native fullscreen.
		local dimensions = window:get_dimensions()
		local is_full_screen = dimensions.is_full_screen
		local overrides = window:get_config_overrides() or {}

		if is_full_screen and overrides.window_background_opacity ~= constants.preferred_opacity_when_maximized then
			overrides.window_background_opacity = constants.preferred_opacity_when_maximized
		elseif not is_full_screen and overrides.window_background_opacity ~= constants.preferred_opacity then
			overrides.window_background_opacity = constants.preferred_opacity
		end

		window:set_config_overrides(overrides)
	end)
end

return M
