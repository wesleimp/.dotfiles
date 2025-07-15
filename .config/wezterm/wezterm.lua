local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.colors = {
	background = "#191919",
}

config.color_scheme = "Default Dark (base16)"
config.font = wezterm.font_with_fallback({
	"Berkeley Mono Condensed",
	"nonicons",
})

config.font_size = 14
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
}

return config
