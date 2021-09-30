local g = vim.g
local v = vim.version()

local width = 55 
local vs = vim.fn.printf('v%d.%d.%d', v.major, v.minor, v.patch)
if v.api_prerelease then
  vs = vs .. ' (pre)'
end

local l = string.len(vs)
local ws = string.rep(' ', width - l)

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1

g.dashboard_default_executive = 'telescope'

g.dashboard_custom_header = {
  '',
  '',
  '',
  ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
  ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
  ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
  ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
  ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
  ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  vim.fn.printf('%s%s', ws, vs),
  '',
}

g.dashboard_custom_section = {
  ['1'] = {
    description = { '  Load Last Session         SPC s l' },
    command = 'SessionLoad',
  },
  ['2'] = {
    description = { '  Find File                 SPC f f' },
    command = 'Telescope find_files',
  },
  b = {
    description = { '  Recents                   SPC f o' },
    command = 'Telescope oldfiles',
  },
  c = {
    description = { '  Find Word                 SPC f g' },
    command = 'Telescope live_grep',
  },
  d = {
    description = { '洛  New File                 SPC f n' },
    command = 'enew',
  },
  e = {
    description = { '  Bookmarks                 SPC b m' },
    command = 'Telescope marks',
  },
}

g.dashboard_custom_footer = {
  'neovim loaded in ' .. vim.fn.printf('%.3f', vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))) .. ' seconds.',
}
