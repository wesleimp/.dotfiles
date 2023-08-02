local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Gruvbox dark, hard (base16)"
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

return config
