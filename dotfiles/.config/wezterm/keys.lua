local wezterm = require("wezterm")
local action = wezterm.action
local smart_splits = require("plugins/smart_splits")

local M = {}

M.configurate = function(config)
	-- config.enable_csi_u_key_encoding = false
	config.enable_kitty_keyboard = true -- To make super key work in nvim. Won't work through tmux.
	config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }

	config.keys = {
		{ key = "[", mods = "SUPER", action = action.ActivateTabRelative(-1) },
		{ key = "]", mods = "SUPER", action = action.ActivateTabRelative(1) },

		-- Pane movement.
		-- { key = "k", mods = "META", action = action.ActivatePaneDirection("Up") },
		-- { key = "j", mods = "META", action = action.ActivatePaneDirection("Down") },
		-- { key = "h", mods = "META", action = action.ActivatePaneDirection("Left") },
		-- { key = "l", mods = "META", action = action.ActivatePaneDirection("Right") },

		smart_splits.create_smart_split_action("move", "h"),
		smart_splits.create_smart_split_action("move", "j"),
		smart_splits.create_smart_split_action("move", "k"),
		smart_splits.create_smart_split_action("move", "l"),

		-- resize panes
		smart_splits.create_smart_split_action("resize", "h"),
		smart_splits.create_smart_split_action("resize", "j"),
		smart_splits.create_smart_split_action("resize", "k"),
		smart_splits.create_smart_split_action("resize", "l"),

		-- Split vertically.
		{
			key = "v",
			mods = "LEADER|CTRL",
			action = action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "v",
			mods = "LEADER",
			action = action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},

		-- Split horizontally.
		{
			key = "s",
			mods = "LEADER|CTRL",
			action = action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "s",
			mods = "LEADER",
			action = action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},

		-- Toggle pane select.
		{
			key = "b",
			mods = "LEADER|CTRL",
			action = action.PaneSelect({ alphabet = "1234567890" }),
		},
		{
			key = "b",
			mods = "LEADER",
			action = action.PaneSelect({ alphabet = "1234567890" }),
		},

		-- Toggle pane swap.
		{
			key = "b",
			mods = "LEADER|CTRL|SHIFT",
			action = action.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActive" }),
		},

		-- Zoom pane.
		{ key = "z", mods = "LEADER|CTRL", action = action.TogglePaneZoomState },
		{ key = "z", mods = "LEADER", action = action.TogglePaneZoomState },

		-- Activate copy mode.
		{ key = "c", mods = "LEADER|CTRL", action = action.ActivateCopyMode },
		{ key = "c", mods = "LEADER", action = action.ActivateCopyMode },
		{ key = "\\", mods = "SUPER", action = action.ActivateCopyMode },
		{ key = "Escape", mods = "SUPER", action = action.ActivateCopyMode },

		-- Non native full screen here - I call it "maximize", because I still use native full screen,
		-- even if it's disabled it in wezterm.
		{ key = ",", mods = "SUPER", action = action.ToggleFullScreen },
	}
end

return M
