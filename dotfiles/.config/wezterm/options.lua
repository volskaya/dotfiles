local constants = require("constants")
local M = {}

M.configurate = function(config)
	-- config.front_end = "WebGpu"
	-- config.webgpu_power_preference = 'HighPerformance'
	-- config.term = "wezterm"

	config.default_cursor_style = "BlinkingUnderline"
	config.cursor_blink_rate = 800
	config.cursor_blink_ease_in = "EaseIn"
	config.cursor_blink_ease_out = "EaseOut"

	config.exit_behavior = "Close"
	config.macos_window_background_blur = 40
	config.adjust_window_size_when_changing_font_size = false

	config.initial_cols = 80
	config.initial_rows = 12

	config.window_close_confirmation = "AlwaysPrompt"
	config.window_decorations = "RESIZE"
	config.window_background_opacity = constants.preferred_opacity
	config.window_frame = {}
	config.window_padding = {
		left = "12pt",
		right = "12pt",
		top = "9pt",
		bottom = "9pt",
	}
end

return M
