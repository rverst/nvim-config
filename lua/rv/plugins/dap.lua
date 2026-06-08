-- https://github.com/mfussenegger/nvim-dap
--
-- nvim-dap is a Debug Adapter Protocol client implementation for Neovim

return {
  'mfussenegger/nvim-dap',
  enabled = require('rv.utils').plugin_enabled({ vscode = false, minimal = false }),
  -- Signs must be defined immediately (before lazy-load) so breakpoints placed
  -- before the first debug session show the correct icon in the gutter.
  init = function()
    vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticError', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '◌', texthl = 'DiagnosticHint', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '◉', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DiagnosticOk', linehl = 'debugPC', numhl = '' })
  end,
  -- Key-based lazy loading: nvim-dap is loaded on first use of any debug key.
  -- stylua: ignore
  keys = {
    { '<F9>',       function() require('dap').continue() end,                                             desc = 'Debug: Start/Continue' },
    { '<F7>',       function() require('dap').step_into() end,                                            desc = 'Debug: Step Into' },
    { '<F8>',       function() require('dap').step_over() end,                                            desc = 'Debug: Step Over' },
    { '<F10>',      function() require('dap').step_out() end,                                             desc = 'Debug: Step Out' },
    { '<F6>',       function() require('dapui').toggle() end,                                             desc = 'Debug: Toggle UI' },
    { '<leader>db', function() require('dap').toggle_breakpoint() end,                                    desc = 'Debug: Toggle Breakpoint' },
    { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Debug: Set Breakpoint' },
    { '<leader>dr', function() require('dap').repl.toggle() end,                                          desc = 'Debug: Toggle REPL' },
  },
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'leoluz/nvim-dap-go',
    {
      'daic0r/dap-helper.nvim',
      opts = {},
    },
  },
  config = function()
    local dap = require('dap')
    local ui = require('dapui')

    ui.setup({
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        enabled = vim.fn.exists('+winbar') == 1,
        element = 'repl',
        icons = {
          pause = '⏸',
          play = '⏵',
          step_into = '↓',
          step_over = '→',
          step_out = '↑',
          step_back = '←',
          run_last = '↺',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    })

    require('nvim-dap-virtual-text').setup({})

    -- Go: use dlv from GOPATH/bin if not in system PATH
    require('dap-go').setup({
      delve = {
        path = vim.fn.exepath('dlv') ~= '' and vim.fn.exepath('dlv') or vim.fn.expand('$GOPATH/bin/dlv'),
      },
    })

    -- Auto-open/close DAP UI with debug sessions
    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
