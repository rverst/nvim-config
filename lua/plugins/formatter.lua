require('formatter').setup({
  logging = false,
  filetype = {
    javascript = {
      function()
        return {
          exe = 'prettier',
          args = {'--stdin-filepath', vim.api.nvim_buf_get_name(0), '--single-quote'},
          stdin = true
        }
      end
    },
    lua = {
      function()
        return {
          exe = 'lua-format',
          args = {
            '--align-args', '--indent-width', 2, '--tab-width', 2, '--column-table-limit', 100,
            '--double-quote-to-single-quote', '--'
          },
          stdin = true
        }
      end
    }
  }
})
