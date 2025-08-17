-- https://github.com/mfussenegger/nvim-dap
--
-- nvim-dap is a Debug Adapter Protocol client implementation for Neovim

return {
  'mfussenegger/nvim-dap',
  enabled = not vim.g.vscode,
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
    'williamboman/mason.nvim',
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
          pause = '',
          play = '',
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          run_last = '',
          terminate = '⏹',
          disconnect = '',
        },
      },
    })

    require('nvim-dap-virtual-text').setup({})
    require('dap-go').setup()

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'red', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'red', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'blue', linehl = '', numhl = '' })

    -- Basic debugging keymaps, feel free to change to your liking!
    ---@diagnostic disable: undefined-field
    vim.keymap.set('n', '<F9>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F7>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F8>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F10>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end, { desc = 'Debug: Set Breakpoint' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    ---@diagnostic disable-next-line missing-fields

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F6>', ui.toggle, { desc = 'Debug: See last session result.' })

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
    -- Install golang specific config
  end,
}
