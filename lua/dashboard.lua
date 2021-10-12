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
g.dashboard_disable_statusline = 0

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
    command = 'LoadSession!',
  },
  ['2'] = {
    description = { '  Find Sessions             SPC s f' },
    command = 'Telescope sessions',
  },
  ['3'] = {
    description = { '  Find File                 SPC f f' },
    command = 'Telescope find_files',
  },
  ['4'] = {
    description = { '  Recents                   SPC f r' },
    command = 'Telescope oldfiles',
  },
  ['5'] = {
    description = { '  Find Word                 SPC f g' },
    command = 'Telescope live_grep',
  },
  ['6'] = {
    description = { '洛 New File                  SPC f n' },
    command = 'enew',
  },
  ['7'] = {
    description = { '  Bookmarks                 SPC b m' },
    command = 'Telescope marks',
  },
}

g.dashboard_custom_footer = {
  'neovim loaded in ' .. vim.fn.printf('%.3f', vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))) .. ' seconds.',
}
