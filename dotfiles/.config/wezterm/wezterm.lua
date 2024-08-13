local wezterm = require("wezterm")
local config = wezterm.config_builder()
local options = require("options")
local colors = require("colors")
local font = require("font")
local keys = require("keys")
local tabs = require("tabs")
local events = require("events")

options.configurate(config)
colors.configurate(config)
font.configurate(config)
tabs.configurate(config)
keys.configurate(config)
events.configurate(config)

return config
