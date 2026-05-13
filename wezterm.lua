local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'OneDark (base16)'
-- config.color_scheme = 'Earthsong'
config.use_fancy_tab_bar = false
config.window_frame = {
	font_size = 12,
}
config.command_palette_font_size = 16
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = "RESIZE"

-- MAC
-- config.default_prog = { '/opt/homebrew/bin/fish', '-l'}
--
-- Linux
config.default_prog = { '/usr/bin/fish', '-l'}

config.font = wezterm.font_with_fallback({
    -- { family = 'FiraCode Nerd Font', weight = "Regular", harfbuzz_features = {"ss01", "ss03", "ss09", "zero", "cv14"} },
    { family = 'FiraCode Nerd Font', weight = "Regular", harfbuzz_features = {"ss01", "ss03", "ss09", "cv14"} },
    -- { family = 'MonoLisa', weight = "Regular" },
    { family = "Noto Color Emoji" },
    -- { family = 'Source Code Pro', weight = "Regular" },
})
config.font_size = 18.0
config.front_end = "WebGpu"
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.cell_width = 0.9
config.window_background_opacity = 0.99
config.initial_rows = 40
config.initial_cols = 150
config.keys = {
  	{ key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = true }},
	{ key = "Enter", mods = "ALT", action = "DisableDefaultAssignment" },
	{ key = "p", mods = "SHIFT|SUPER", action = wezterm.action.ActivateCommandPalette },
	{
		key = "|",
		mods = "SHIFT|ALT",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "_",
		mods = "SHIFT|ALT",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
	{ key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
}
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
