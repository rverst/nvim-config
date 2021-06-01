local fn = require('utils.fn')
local va = require('utils.vars')

require('formatter').setup({
  logging = false,
  filetype = {
    -- npm install -g prettier
    javascript = {
      function()
        return {
          exe = 'prettier',
          args = { '--stdin-filepath', vim.api.nvim_buf_get_name(0), '--single-quote' },
          stdin = true,
        }
      end,
    },
    -- https://github.com/johnnymorganz/stylu
    -- cargo install stylua
    -- use `-- stylua: ignore` to ignore parts of a file
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--config-path',
            fn.joinPath(va.nvimPath, 'misc', 'stylua.toml'),
            '-',
          },
          stdin = true,
        }
      end,
    },
  },
})
