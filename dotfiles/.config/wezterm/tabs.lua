local wezterm = require("wezterm")
local M = {}

M.configurate = function(config)
	config.use_fancy_tab_bar = true
	config.tab_bar_at_bottom = false
	config.show_new_tab_button_in_tab_bar = false
	config.tab_and_split_indices_are_zero_based = false
	config.hide_tab_bar_if_only_one_tab = true

	config.window_frame.inactive_titlebar_bg = config.colors.background
	config.window_frame.active_titlebar_bg = config.colors.background

	--  -- Powerline semi circles.
	-- local LEFT_END = utf8.char(0xE0B6)
	-- local RIGHT_END = utf8.char(0xE0B4)

	-- Powerline semi triangles.
	local LEFT_END = utf8.char(0xE0B2)
	local RIGHT_END = utf8.char(0xE0B0)

	-- local active_tab_bg_color = "#6e43e5" or config.colors.tab_bar.active_tab.bg_color
	local active_tab_bg_color = config.colors.tab_bar.inactive_tab.fg_color
	local active_tab_fg_color = config.colors.tab_bar.inactive_tab.bg_color
	local inactive_tab_bg_color = config.colors.tab_bar.inactive_tab.bg_color
	local inactive_tab_text_color = config.colors.tab_bar.inactive_tab.fg_color

	function tab_title(tab_info)
		local title = tab_info.tab_title

		-- if the tab title is explicitly set, take that
		if title and #title > 0 then
			return title
		end

		-- Otherwise, use the title from the active pane
		-- in that tab
		return tab_info.active_pane.title
	end

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local title = tab_title(tab)
		local effective_max_width = max_width - 2

		if #title > effective_max_width then
			title = wezterm.truncate_right(title, effective_max_width) .. "…"
		end

		-- Background colors here don't support transparency, so bar must be kept opaque.
		local main_bg_color = config.colors.tab_bar.background
		local background = config.colors.tab_bar.background
		local tab_icon_inactive = inactive_tab_text_color
		local tab_icon_inactive_icon = wezterm.nerdfonts.md_ghost_off_outline --wezterm.nerdfonts.oct_square
		local tab_icon_active_icon = wezterm.nerdfonts.md_ghost
		local icon_text = ""
		local tab_icon_color = ""
		local tab_text_color = ""

		if tab.is_active then
			tab_icon_color = active_tab_fg_color
			tab_text_color = active_tab_fg_color
			tab_background_color = active_tab_bg_color
			icon_text = tab_icon_active_icon
		else
			tab_icon_color = tab_icon_inactive
			tab_text_color = inactive_tab_text_color
			icon_text = tab_icon_inactive_icon
			tab_background_color = inactive_tab_bg_color
		end

		-- Ensure that the titles fit in the available space,
		-- and that we have room for the edges.
		return {
			{ Background = { Color = main_bg_color } },
			{ Foreground = { Color = tab_background_color } },
			{ Text = LEFT_END },
			-- { Text = "" },
			{ Background = { Color = tab_background_color } },
			{ Foreground = { Color = tab_icon_color } },
			-- { Text = " " .. icon_text },
			-- { Background = { Color = tab_background_color } },
			-- { Foreground = { Color = tab_text_color } },
			{ Text = " " .. title .. "  " },
			{ Background = { Color = background } },
			{ Foreground = { Color = tab_background_color } },
			{ Text = RIGHT_END },
			-- { Text = "" },
		}
	end)
end

return M
