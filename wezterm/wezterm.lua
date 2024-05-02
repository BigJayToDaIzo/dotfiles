-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.keys = {}

config.color_scheme = "Catppuccin Macchiato (Gogh)"
config.font = wezterm.font("0xProto Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.front_end = "WebGpu"

return config
