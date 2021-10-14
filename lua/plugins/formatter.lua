local utils = require('utils')

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
    -- https://github.com/johnnymorganz/stylua
    -- cargo install stylua
    -- use `-- stylua: ignore` to ignore parts of a file (ignore start, ignore end for blocks)
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--config-path',
            utils.joinPath(rv.nvimPath, 'misc', 'stylua.toml'),
            '-',
          },
          stdin = true,
        }
      end,
    },
    -- go fmt
    go = {
      function()
        return {
          exe = 'gofmt',
          args = { '-s' },
          stdin = true,
        }
      end,
    },
    -- Rustfmt
    rust = {
      function()
        return {
          exe = 'rustfmt',
          args = { '--emit=stdout' },
          stdin = true,
        }
      end,
    },
  },
})
