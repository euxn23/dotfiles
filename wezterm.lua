local wezterm = require 'wezterm';

if string.find(wezterm.target_triple, 'windows') then
  default_prog = { 'wsl.exe', '~' }
  -- default_prog = { 'pwsh.exe' }
end

return {
  -- appearance

  color_scheme = 'JetBrains Darcula',
  window_background_opacity = 0.85,

  -- font = wezterm.font('UDEV Gothic 35NF'),
  -- font = wezterm.font('UDEV Gothic NF'),
  font = wezterm.font('UDEV Gothic 35JPDOC'),

  hide_tab_bar_if_only_one_tab = true,
  check_for_updates = true,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  default_prog = default_prog,
}
