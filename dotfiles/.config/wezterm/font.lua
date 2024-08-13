local wezterm = require("wezterm")
local M = {}

-- local font = { family = "Maple Mono NF", size = 18, height = -1, features = { "ss01" }, it = true }
-- local font = { family = "MonoLisa", size = 17, cell_size = 0.8, height = 0 }
-- local font = { family = "Cartograph CF", size = 18, height = 1, features = { "ss02", "ss03" } }
-- local font = { family = "CartographCF Nerd Font", size = 18, height = -2, features = { "ss02", "ss03" }, it = true }
-- local font = { family = "Input Mono Narrow", size = 18, height = 0, weight = "Medium" }
-- local font = { family = "Fira Code", size = 18, height = 0, weight = "Medium" }
-- local font = { family = "Monaspace Neon", size = 18, height = 0, weight = "Medium" }
-- local font = { family = "Victor Mono", size = 18, height = -1, weight = "Bold" } -- Looks better with HorizontalLcd.
-- local font = { family = "JetBrainsMono Nerd Font", size = 18, height = -1 }
-- local font = { family = "FantasqueSansM Nerd Font", size = 19 }
-- local font = { family = "Comic Code Ligatures", size = 17, height = 1 }
-- local font = { family = "Comic Shanns", size = 18, height = 0 }
-- local font = { family = "Office Code Pro", cell_size = 0.8, size = 18, height = 0, weight = 500 }
-- local font = { family = "Operator Mono", size = 19, height = 0 }
-- local font = { family = "Dina", size = 18, height = 0 }
-- local font = { family = "PragmataPro Liga", size = 19, features = { "ss08" } }
-- local font = { family = "PragmataPro Mono", size = 19 }
-- local font = { family = "Cascadia Code", size = 18 }
-- local font = { family = "Iosevka", size = 20, cell_size = 1.0, height = -1, it = true }
-- local font = { family = "Volskaya Nerd Font", cell_size = 0.8, size = 20, height = -1, it = true }
-- local font = { family = "RecMonoCasual Nerd Font", size = 18, height = -1 }
-- local font = { family = "RecMonoSmCasual Nerd Font", size = 18, height = 0, it = true }

local font = {
	family = "Recursive Monospace Casual",
	size = 18,
	height = 0,
	weight = 600,
	it = true,
	features = { "dlig", "ss12" }, -- Small Casual looking features.
}

local font_italic = {
	family = "CartographCF Nerd Font",
	size = font.size,
	height = font.height,
	weight = 700,
	features = { "ss02", "ss03_" },
	it = true,
}

M.configurate = function(config)
	local is_subpixel_rgb_enabled = false

	local font_family = font.family or "monospace"
	-- local font_family_italic = font.family_italic or "Maple Mono NF"
	local font_weight = font.weight or "Bold"
	local font_size = font.size or 18
	local font_line_height = font.height or 0
	local font_features = font.features or {}
	local font_cell_size = font.cell_size or 0.9 -- Matched with Alacritty.
	local font_italics = font.italics or font.it or false

	-- config.font = wezterm.font({ family = font_family, weight = font_weight, style = "Normal" })
	config.font = wezterm.font_with_fallback({
		{ family = font_family, weight = font_weight, style = "Normal" },
		{ family = font_italic.family, weight = font_weight, style = "Normal" },
		{ family = "Symbols Nerd Font Mono", scale = 0.66, style = "Normal" },
	})

	config.font_size = font_size
	config.line_height = 1.0 + (font_line_height / 10)
	config.cell_width = font_cell_size
	config.harfbuzz_features = font_features
	config.freetype_interpreter_version = 40 -- 35 | 38 | 40
	config.freetype_load_target = "Light" -- "Light" | "Normal" | "Mono" | "HorizontalLcd"
	config.freetype_render_target = is_subpixel_rgb_enabled and "HorizontalLcd" or nil
	config.underline_thickness = "2pt"
	config.underline_position = "-2pt"
	config.use_cap_height_to_scale_fallback_fonts = false
	config.enable_kitty_graphics = false
	config.native_macos_fullscreen_mode = false
	config.macos_fullscreen_extend_behind_notch = true
	config.allow_square_glyphs_to_overflow_width = "Always"

	config.window_frame.font = wezterm.font(font_family, { weight = font_weight })
	config.window_frame.font_size = 17
	config.font_rules = {
		-- Disable italics in the font.
		{
			italic = true,
			font = wezterm.font({
				family = font_italic.family,
				weight = font_italic.weight or "Bold",
				style = "Normal",
				italic = font_italics,
			}),
		},

		-- Make bolds the same weight as the current font.
		{
			intensity = "Bold",
			italic = false,
			font = wezterm.font({
				family = font_family,
				weight = font_weight,
				style = "Normal",
			}),
		},
	}
end

return M
