local wezterm = require 'wezterm';
return {
  -- color_scheme = "Ayu Mirage",
  -- color_scheme = "OneHalfDark",
  -- color_scheme = "Teerb",
  color_scheme = "Tomorrow Night",
  font = wezterm.font("UDEV Gothic 35JPDOC"),


  -- appearance
  hide_tab_bar_if_only_one_tab = true,
  check_for_updates = false,
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.85,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
