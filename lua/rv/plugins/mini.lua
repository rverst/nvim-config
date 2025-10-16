-- https://github.com/echasnovski/mini.nvim
--
-- Library of 40+ independent Lua modules improving overall Neovim
-- (version 0.8 and higher) experience with minimal effort.

return {
  'echasnovski/mini.nvim',
  enabled = true,
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup({ n_lines = 500 })

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    require('mini.diff').setup()
  end,
}
