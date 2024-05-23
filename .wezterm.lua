-- Pull in the wezterm API
local wezterm = require("wezterm")

-- local M = {}
--
-- local palette = {
-- 	base = "#191724",
-- 	overlay = "#26233a",
-- 	muted = "#6e6a86",
-- 	text = "#e0def4",
-- 	love = "#eb6f92",
-- 	gold = "#f6c177",
-- 	rose = "#ebbcba",
-- 	pine = "#31748f",
-- 	foam = "#9ccfd8",
-- 	iris = "#c4a7e7",
-- 	highlight_high = "#524f67",
-- }
--
-- local active_tab = {
-- 	bg_color = palette.overlay,
-- 	fg_color = palette.text,
-- }
--
-- local inactive_tab = {
-- 	bg_color = palette.base,
-- 	fg_color = palette.muted,
-- }
--
-- function M.colors()
-- 	return {
-- 		foreground = palette.text,
-- 		background = palette.base,
-- 		cursor_bg = palette.highlight_high,
-- 		cursor_border = palette.highlight_high,
-- 		cursor_fg = palette.text,
-- 		selection_bg = "#2a283e",
-- 		selection_fg = palette.text,
--
-- 		ansi = {
-- 			palette.overlay,
-- 			palette.love,
-- 			palette.pine,
-- 			palette.gold,
-- 			palette.foam,
-- 			palette.iris,
-- 			palette.rose,
-- 			palette.text,
-- 		},
--
-- 		brights = {
-- 			palette.muted,
-- 			palette.love,
-- 			palette.pine,
-- 			palette.gold,
-- 			palette.foam,
-- 			palette.iris,
-- 			palette.rose,
-- 			palette.text,
-- 		},
--
-- 		tab_bar = {
-- 			background = palette.base,
-- 			active_tab = active_tab,
-- 			inactive_tab = inactive_tab,
-- 			inactive_tab_hover = active_tab,
-- 			new_tab = inactive_tab,
-- 			new_tab_hover = active_tab,
-- 			inactive_tab_edge = palette.muted, -- (Fancy tab bar only)
-- 		},
-- 	}
-- end
--
-- function M.window_frame() -- (Fancy tab bar only)
-- 	return {
-- 		active_titlebar_bg = palette.base,
-- 		inactive_titlebar_bg = palette.base,
-- 	}
-- end

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font({
	family = "MonaspiceKr NFP",
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
config.color_scheme = "Catppuccin Mocha"
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
