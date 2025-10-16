--- https://github.com/ravitemer/mcphub.nvim
---
--- MCP Hub is a MCP client for neovim that seamlessly integrates MCP (Model Context Protocol)
--- servers into your editing workflow. It provides an intuitive interface for managing, testing,
--- and using MCP servers with your favorite chat plugins.
return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
  config = function()
    require('mcphub').setup()
  end,
}
