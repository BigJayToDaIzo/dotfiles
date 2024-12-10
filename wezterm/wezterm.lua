local wezterm = require("wezterm")
local config = wezterm.config_builder()
-- apply configs
config.color_scheme = "Everforest Dark Soft (Gogh)"
config.enable_tab_bar = false
config.font = wezterm.font_with_fallback({
	"Maple Mono NF",
	"Segoe UI Emoji",
})
config.font_size = 17.0
config.window_padding = {
	left = "2px",
	right = "2px",
	top = "2px",
	bottom = 0,
}

return config
