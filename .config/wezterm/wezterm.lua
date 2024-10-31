local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- if theme == "light" then
-- 	config.color_scheme = "One Light (Gogh)"
-- else
-- 	config.color_scheme = "Gruvbox Dark (Gogh)"
-- end

config.font = wezterm.font_with_fallback({
	"Berkeley Mono",
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
