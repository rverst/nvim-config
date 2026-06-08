-- https://github.com/folke/todo-comments.nvim
--
-- Highlight and search TODO/FIXME/HACK/WARN/NOTE/TEST comments using ripgrep.
-- Jump between comments with ]t / [t.
-- Requires: ripgrep / rg (auto-installed via brew on macOS)
--
-- e.g.:
-- TODO: this is a todo example
-- WARN: this is a warning example
-- PERF: this is a performance issue example
-- NOTE: this is a note example
-- TEST: this is a test example

local plugin = {
  'folke/todo-comments.nvim',
  enabled = true,
  build = function()
    require('rv.utils').ensure_installed('ripgrep')
  end,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local todo = require('todo-comments')

    todo.setup({
      signs = not vim.g.vscode, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = ' ', -- icon used for the sign, and in search results
          color = 'error', -- can be a hex color, or a named color (see below)
          alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = ' ', color = 'warning' },
        HACK = { icon = ' ', color = 'error' },
        WARN = { icon = ' ', color = 'error', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', color = 'info', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
      gui_style = {
        fg = 'NONE', -- The gui style to use for the fg highlight group.
        bg = 'BOLD', -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = '^.', -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = '', -- "fg" or "bg" or empty
        keyword = 'wide', -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = 'fg', -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { 'DiagnosticError', 'ErrorMsg', '#C75646' },
        warning = { 'DiagnosticWarn', 'WarningMsg', '#D0B03C' },
        info = { 'DiagnosticInfo', '#4E90A7' },
        hint = { 'DiagnosticHint', '#8EB33B' },
        default = { 'Identifier', '#77DFD8' },
        test = { 'Identifier', '#FBB1F9' },
      },
      search = {
        command = 'rg',
        args = {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    })

    vim.keymap.set('n', '<F3>', todo.jump_next, { desc = 'TODO: Next comment' })
    vim.keymap.set('n', ']t', todo.jump_next, { desc = 'TODO: Next comment' })
    vim.keymap.set('n', '[t', todo.jump_prev, { desc = 'TODO: Previous comment' })
  end,
}

return plugin
