local M = {}

---@param config any - TODO: Get wezterm types.
M.configurate = function(config)
	local palette_name = "irrelevant-tiktok"
	local palette = require("palettes." .. palette_name)

	config.colors = {
		foreground = palette.foreground,
		background = palette.background,

		cursor_bg = palette.foreground,
		cursor_border = palette.foreground,

		selection_fg = "none",
		selection_bg = palette.selection,

		ansi = {
			palette.black,
			palette.red,
			palette.green,
			palette.yellow,
			palette.blue,
			palette.magenta,
			palette.cyan,
			palette.white,
		},

		brights = {
			palette.black_bright,
			palette.red_bright,
			palette.green_bright,
			palette.yellow_bright,
			palette.blue_bright,
			palette.magenta_bright,
			palette.cyan_bright,
			palette.white_bright,
		},

		tab_bar = {
			background = palette.background,

			inactive_tab_edge = "None",

			active_tab = {
				bg_color = palette.background,
				fg_color = palette.foreground,

				intensity = "Normal",
				underline = "None",
				italic = false,
				strikethrough = false,
			},

			inactive_tab = {
				bg_color = palette.background,
				fg_color = palette.muted,
			},

			inactive_tab_hover = {
				bg_color = palette.background,
				fg_color = palette.muted,
				italic = false,
			},
		},
	}
end

return M
