local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.max_fps = 120

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14.0
config.window_decorations = "RESIZE"
config.window_background_opacity = 1.0
config.macos_window_background_blur = 10


-- Key Bindings for Pane Navigation
config.keys = {
    { key = 'RightArrow', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection("Right") },  -- CMD + SHIFT + Right
    { key = 'LeftArrow', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection("Left") },   -- CMD + SHIFT + Left
    { key = 'UpArrow', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection("Up") },     -- CMD + SHIFT + Up
    { key = 'DownArrow', mods = 'CMD|SHIFT', action = wezterm.action.ActivatePaneDirection("Down") },
    -- Add bindings for splitting panes
    { key = '5', mods = 'CMD|SHIFT|OPTION|CTRL', action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } }, -- caps + 5 for horizontal split
    { key = ';', mods = 'CMD|SHIFT|OPTION|CTRL', action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },   -- caps + ; for vertical split
  }

return config
