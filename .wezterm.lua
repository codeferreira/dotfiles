-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font({
	family = "FiraCode Nerd Font Mono",
	harfbuzz_features = {
		"calt",
		"clig",
		"liga",
		"kern",
		"mark",
		"mkmk",
		"palt",
		"rlig",
		"curs",
		"kern",
		"mark",
		"mkmk",
		"palt",
		"rlig",
		"curs",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
	},
})
config.font_size = 14.0
config.line_height = 1.6
config.color_scheme = "Rose Pine"
config.enable_tab_bar = false
config.macos_window_background_blur = 30
config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- For example, changing the color scheme:

-- and finally, return the configuration to wezterm
return config
