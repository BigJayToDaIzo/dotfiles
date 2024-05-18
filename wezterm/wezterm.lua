-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.keys = {}

config.color_scheme = "Catppuccin Macchiato (Gogh)"
config.font = wezterm.font_with_fallback({
	"0xProto",
	{ family = "Symbols Nerd Font Mono", scale = 0.8 },
})
config.font_size = 16

config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
	left = "1cell",
	right = "0.5cell",
	top = "0.5cell",
	bottom = "0cell",
}

config.visual_bell = {
	fade_in_duration_ms = 75,
	fade_out_duration_ms = 75,
	target = "CursorColor",
}

config.enable_tab_bar = false

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

return config
