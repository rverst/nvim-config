local cc = require('codecompanion').chat()
Snacks.win({
  buffer = cc.bufnr,
  position = 'right',
  border = 'left',
  fixbuf = true,
  keys = nil,
  wo = {
    spell = false,
    wrap = false,
    signcolumn = 'no',
    statuscolumn = '',
    conceallevel = 3,
  },
  on_win = function(args)
    vim.notify(vim.inspect(args))
  end,
  on_close = function()
    vim.notify('Snack window closed')
  end,
})
