-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
--

return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = not vim.g.vscode,
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
  },
}
