local wezterm = require 'wezterm';
local act = wezterm.action

local THEME_ACCENT = '#6d9df1'
local THEME_GRAY_3 = '#262626'
local THEME_GRAY_2 = '#3a3a3a'
local THEME_GRAY_1 = '#626262'

local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)
local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

if string.find(wezterm.target_triple, 'windows') then
  -- wsl_domains = {
  --   {
  --     name = 'WSL:Arch',
  --     distribution = 'Arch',
  --     username = 'euxn',
  --     default_cwd = '/home/euxn',
  --   },
  -- }
  -- default_domain = 'WSL:Arch'
  default_prog = { 'wsl.exe', '~' }
end

local leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }

local keys = {
  { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 's', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = 'v', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'n', mods = 'LEADER', action = act.SpawnTab 'DefaultDomain', },
  { key = 'n', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(1), },
  { key = 'p', mods = 'LEADER|CTRL', action = act.ActivateTabRelative(-1), },
  { key = 'Space', mods = 'LEADER|CTRL', action = act.ActivatePaneDirection 'Next', },
  { key = 'p', mods = 'LEADER', action = act.ActivatePaneDirection 'Prev', },
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },
  { key = 'x', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true }, },
}

local colors = {
  tab_bar = {
    background = THEME_GRAY_3,
    active_tab = {
      bg_color = THEME_GRAY_2,
      fg_color = THEME_ACCENT,
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = THEME_GRAY_3,
      fg_color = THEME_GRAY_1,
    },
    inactive_tab_hover = {
      bg_color = THEME_GRAY_3,
      fg_color = THEME_ACCENT,
    },
    new_tab = {
      bg_color = THEME_GRAY_3,
      fg_color = THEME_ACCENT,
    },
    new_tab_hover = {
      bg_color = THEME_GRAY_3,
      fg_color = THEME_ACCENT,
    }
  },
}

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    function tab_title(tab)
      local title = tab.tab_title
      if title and #title > 0 then
        return title, 0
      end
      return tab.active_pane.title, tab.tab_index + 1
    end

    local arrow_color = ''

    if tab.is_active then
      arrow_color = THEME_GRAY_2
    else
      arrow_color = THEME_GRAY_3
    end

    local title, id = tab_title(tab)
    title = wezterm.truncate_right(title, max_width - 6)

    return {
      { Foreground = { Color = THEME_GRAY_3 } },
      { Background = { Color = arrow_color } },
      { Text = SOLID_RIGHT_ARROW .. ' ' },
      'ResetAttributes',
      { Text = id ..  ':' .. title .. ' ' },
      { Foreground = { Color = arrow_color } },
      { Background = { Color = THEME_GRAY_3 } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

wezterm.on('update-status', function(window, pane)
  window:set_left_status(wezterm.format {
    { Foreground = { Color = THEME_GRAY_3 }},
    { Background = { Color = THEME_ACCENT }},
    { Text = ' ' .. wezterm.nerdfonts.fa_user .. ' ' .. wezterm.hostname() .. ' ' },
    'ResetAttributes',
    { Foreground = { Color = THEME_ACCENT }},
    { Text = SOLID_RIGHT_ARROW }
  })
end)

wezterm.on('update-right-status', function(window, pane)
  local time = wezterm.strftime '%H:%M:%S'
  local date = wezterm.strftime '%Y-%m-%d'

  window:set_right_status(wezterm.format {
    { Foreground = { Color = THEME_GRAY_2 }},
    { Text = SOLID_LEFT_ARROW },
    'ResetAttributes',
    { Foreground = { Color = THEME_ACCENT }},
    { Background = { Color = THEME_GRAY_2 }},
    { Text = ' ' .. wezterm.nerdfonts.fa_clock_o .. ' ' .. time },
    { Text = ' ' .. SOLID_LEFT_ARROW },
    'ResetAttributes',
    { Foreground = { Color = THEME_GRAY_3 }},
    { Background = { Color = THEME_ACCENT }},
    { Text = ' ' .. wezterm.nerdfonts.fa_calendar .. ' ' .. date .. ' ' },
  })
end)

wezterm.on('window-config-reloaded', function(window, pane)
  window:toast_notification('wezterm', 'configuration reloaded!', nil, 1000)
end)

return {
  -- appearance
  color_scheme = 'JetBrains Darcula',
  colors = colors,
  window_background_opacity = 0.95,

  font = wezterm.font('UDEV Gothic 35NF'),

  -- hide_tab_bar_if_only_one_tab = true,
  check_for_updates = false,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  use_fancy_tab_bar = false,
  tab_bar_style = tab_bar_style,
  tab_max_width = 24,

  default_domain = default_domain,
  wsl_domains = wsl_domains,
  default_prog = default_prog,
  leader = leader,
  keys = keys
}
