local gl = require('galaxyline')
local gls = gl.section
local c = vim.g.colors

-- stylua: ignore
local modes = {
  ['c']  = {'COMMAND',            c.orange_light.hex},
  ['n']  = {'NORMAL',             c.blue.hex},
  ['ce'] = {'NORMAL EX',          c.red.hex},
  ['cv'] = {'EX',                 c.red_error.hex},
  ['i']  = {'INSERT',             c.green.hex},
  ['ic'] = {'INS-COMPLETE',       c.green_light.hex},
  ['no'] = {'OPERATOR-PENDING',   c.purple.hex},
  ['r']  = {'HIT-ENTER',          c.cyan.hex},
  ['r?'] = {':CONFIRM',           c.cyan.hex},
  ['rm'] = {'--MORE',             c.cyan.hex},
  ['R']  = {'REPLACE',            c.orange.hex},
  ['Rv'] = {'VIRTUAL',            c.orange.hex},
  ['s']  = {'SELECT',             c.magenta.hex},
  ['S']  = {'SELECT',             c.magenta.hex},
  ['']   = {'SELECT',             c.magenta.hex},
  ['t']  = {'TERMINAL',           c.orange.hex},
  ['v']  = {'VISUAL',             c.blue_light.hex},
  ['V']  = {'VISUAL LINE',        c.blue_light.hex},
  ['VV'] = {'VISUAL BLOCK',       c.blue_light.hex},
  ['!']  = {'SHELL',              c.yellow_light.hex},

  -- libmodal
  ['TABS'] =     c.blue.hex,
  ['BUFFERS'] =  c.red.hex,
  ['TABLES'] =   c.orange.hex
}

local separators = {left = '│', right = '│'}

local all = function(...)
  local args = {...}
  return function()
    for _, fn in ipairs(args) do if not fn() then return false end end
    return true
  end
end

local bufferNotEmpty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end

local checkwidth = function() return (vim.fn.winwidth(0) / 2) > 50 end

local findGitRoot = function()
  return require('galaxyline/provider_vcs').get_git_dir(vim.fn.expand('%:p:h'))
end

local fileFormat = function()
  local f = vim.bo.fileformat
  if f == 'unix' then
    return 'LF'
  elseif f == 'mac' then
    return 'CR'
  end
  return 'CRLF'
end

local getFileIconColor = function()
  return require('galaxyline/provider_fileinfo').get_file_icon_color()
end

local lineColumn = function() return
    function() return vim.fn.line('.') .. ':' .. vim.fn.col('.') end end

local linePercent = function()
  return function()
    return require('galaxyline/provider_fileinfo').current_line_percent():gsub('%s+', '')
  end
end

local lspClient = function()
  return function()
    local client = require('galaxyline/provider_lsp').get_lsp_client()
    if client == 'No Active Lsp' then
      return ''
    elseif client == 'sumneko_lua' then
      client = 'lua'
    end
    return '  ' .. client .. ' '
  end
end

local shortListShow = function()
  local t = vim.bo.filetype:lower()
  if t == 'nvimtree' then
    return false
  elseif t == 'terminal' then
    return false
  elseif t == 'outline' then
    return false
  elseif t:find('dap') == 1 then
    return true
  end
  return true
end

local isTerminal = function()
  local t = vim.bo.buftype:lower()
  return t == 'terminal'
end

local isDapUi = function()
  local t = vim.bo.filetype:lower()
  return t:find('dap') == 1
end

local bufferType = function() return vim.bo.filetype:lower() end

local neg = function(f) return function() return not f() end end

local printer = function(s) return function() return s end end

local space = printer(' ')

gl.short_line_list = {'defx', 'packager', 'vista', 'NvimTree', 'dapui_scopes', 'dapui_breakpoints', 'dapui_watches', 'dapui_stacks', 'dap-repl' }

gls.left = {
  {LeftStart = {provider = space, highlight = {c.dark3.hex, c.dark3.hex}}}, {
    ViMode = {
      provider = function() -- auto change color according the vim mode
        local mode_color = nil
        local mode_name = nil

        if vim.g.libmodalActiveModeName then
          mode_name = vim.g.libmodalActiveModeName
          mode_color = modes[mode_name]
        else
          local m = vim.fn.mode()
          if m:byte() == 22 then m = 'VV' end

          local current_mode = modes[m]
          if current_mode == nil then
            current_mode = {'??? |' .. m .. '|' .. m:byte() .. '|', c.red_error.hex}
          end

          mode_name = current_mode[1]
          mode_color = current_mode[2]
        end

        vim.cmd('hi GalaxyViMode gui=bold guifg=' .. mode_color)
        return mode_name .. ' '
      end,
      highlight = {c.dark3.hex, c.dark3.hex},
      separator = separators.right,
      separator_highlight = {c.dark1.hex, c.dark3.hex}
    }
  }, {
    FileIcon = {
      provider = {space, 'FileIcon'},
      condition = neg(isTerminal),
      highlight = {getFileIconColor, c.dark3.hex}
    }
  }, {
    FileName = {
      provider = {space, 'FileName'},
      condition = all(bufferNotEmpty, neg(isTerminal)),
      highlight = {c.acc2.hex, c.dark3.hex, 'bold'}
    }
  }, {
    FileSize = {
      provider = {space, 'FileSize'},
      condition = all(bufferNotEmpty, neg(isTerminal)),
      highlight = {c.acc1.hex, c.dark3.hex, 'italic'}
    }
  }, {
    LspClient = {
      provider = lspClient(),
      condition = neg(isTerminal),
      highlight = {getFileIconColor, c.dark3.hex},
    }
  }, {
    DiagnosticError = {
      provider = 'DiagnosticError',
      condition = neg(isTerminal),
      icon = ' ',
      highlight = {c.red.hex, c.dark2.hex},
      separator = ' ',
      separator_highlight = {c.dark2.hex, c.dark2.hex}
    }
  }, {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      condition = neg(isTerminal),
      icon = ' ',
      highlight = {c.yellow_light.hex, c.dark2.hex},
      separator = ' ',
      separator_highlight = {c.dark2.hex, c.dark2.hex}
    }
  }, {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      condition = neg(isTerminal),
      icon = 'ﯧ ',
      highlight = {c.yellow.hex, c.dark2.hex},
      separator = ' ',
      separator_highlight = {c.dark2.hex, c.dark2.hex}
    }
  }, {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      condition = neg(isTerminal),
      icon = ' ',
      highlight = {c.yellow.hex, c.dark2.hex},
      separator = ' ',
      separator_highlight = {c.dark2.hex, c.dark2.hex}
    }
  }
} -- gls.left

gls.right = {
  {
    RightStart = {
      provider = space,
      condition = all(bufferNotEmpty, neg(isTerminal)),
      highlight = {c.dark3.hex, c.dark3.hex}
    }
  }, {
    Vista = {
      provider = 'VistaPlugin',
      condition = function() return vim.fn.exists(':Vista') ~= 0 end,
      highlight = {c.acc2.hex, c.dark3.hex}
    }
  }, {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = all(checkwidth, findGitRoot),
      icon = '+',
      highlight = {c.green_light.hex, c.dark3.hex}
    }
  }, {
    DiffModified = {
      provider = 'DiffModified',
      condition = all(checkwidth, findGitRoot),
      icon = '~',
      highlight = {c.orange_light.hex, c.dark3.hex}
    }
  }, {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = all(checkwidth, findGitRoot),
      icon = '-',
      highlight = {c.red_light.hex, c.dark3.hex}
    }
  }, {
    GitBranch = {
      provider = {printer(' '), 'GitBranch', space},
      condition = findGitRoot,
      highlight = {c.orange.hex, c.dark3.hex, 'bold'}
    }
  }, {
    FileFormat = {
      provider = {space, fileFormat, space},
      condition = neg(isTerminal),
      highlight = {c.acc1.hex, c.dark3.hex},
      separator = separators.left,
      separator_highlight = {c.dark1.hex, c.dark3.hex}
    }
  }, {
    FileEncode = {
      provider = {space, 'FileEncode', space},
      condition = neg(isTerminal),
      highlight = {c.acc1.hex, c.dark3.hex},
      separator = separators.left,
      separator_highlight = {c.dark1.hex, c.dark3.hex}
    }
  }, {
    LineColumn = {
      provider = {lineColumn()},
      condition = all(bufferNotEmpty, neg(isTerminal)),
      highlight = {c.white.hex, c.dark3.hex},
      separator = ' ',
      separator_highlight = {c.dark3.hex, c.dark3.hex}
    }
  }, {
    LinePercent = {
      provider = {printer('['), linePercent(), printer(']')},
      condition = all(bufferNotEmpty, neg(isTerminal)),
      highlight = {c.acc1.hex, c.dark3.hex},
      separator = ' ',
      separator_highlight = {c.dark3.hex, c.dark3.hex}
    }
  }, {
    RightEnd = {
      condition = neg(isTerminal),
      provider = space,
      highlight = {c.dark3.hex, c.dark3.hex}
    }
  }
} -- gls.right

gls.short_line_left = {
  {
    ShortLeftStart = {
      provider = space,
      condition = all(bufferNotEmpty, shortListShow),
      highlight = {c.dark2.hex, c.dark2.hex}
    }
  }, 
  {
    ShortFileName = {
      provider = {'FileName'},
      condition = all(bufferNotEmpty, shortListShow, neg(isTerminal)),
      highlight = {c.acc1.hex, c.dark2.hex, 'bold'}
    }
  }, {
    ShortPrintTerm = {
      provider = {space, printer('TERMINAL')},
      condition = isTerminal,
      highlight = {c.acc1.hex, c.dark2.hex, 'bold'}
    }
  }
}

gls.short_line_right = {
  {
    ShortBufferType = {
      provider = bufferType,
      condition = shortListShow,
      highlight = {c.dark2.hex, c.dark2.hex}
    }
  }, {
    ShortLineColumn = {
      provider = {lineColumn()},
      condition = all(bufferNotEmpty, shortListShow, neg(isTerminal)),
      highlight = {c.acc1.hex, c.dark2.hex},
      separator = ' ',
      separator_highlight = {c.dark2.hex, c.dark2.hex}
    }
  }
}
