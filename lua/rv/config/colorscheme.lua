-- Color scheme configuration

require('nightfox').setup({
  options = {
    dim_inactive = true,
    styles = {
      comments = 'italic',
      conditionals = 'italic',
      -- constants
      -- functions
      -- keywords
      -- numbers
      -- operators
      preprocs = 'bold,italic',
      -- strings
      -- types
      -- variables
    },
  },
  palettes = {
    nightfox = {
      bg0 = '#1d2021',
      bg1 = '#282828',
      bg2 = '#3c3836',
      bg3 = '#505c54',
      fg = '#f7f7f7',
      red = '#c75646',
      red2 = '#cc241d',
      green = '#8eb33b',
      yellow = '#d0b03c',
      blue = '#4e90a7',
      magenta = '#c8a0d1',
      cyan = '#218693',
      orange = '#d65d0e',
      seagreen = '#698b69',
      pink = '#ffadad',
      aqua = '#689d6a',
      purple = '#b16286',
    },
  },
  specs = {
    nightfox = {
      syntax = {
        bracket = 'fg', -- Brackets and Punctuation
        --builtin0     -- Builtin variable
        --builtin1 = 'blue.bright', -- Builtin type
        --builtin2     -- Builtin const
        --comment      -- Comment
        conditional = 'red', -- Conditional and loop
        const = 'magenta', -- Constants, imports and booleans
        --dep          -- Deprecated
        --field        -- Field
        func = 'blue.bright', -- Functions and Titles
        --ident        -- Identifiers
        keyword = 'red', -- Keywords
        number = 'purple', -- Numbers
        operator = 'fg', -- Operators
        --preproc      -- PreProc
        regex = 'yellow', -- Regex
        statement = 'pink', -- Statements
        string = 'aqua', -- Strings
        type = 'orange', -- Types
        variable = 'fg', -- Variables
      },
      git = {
        add = 'green.dim',
        changed = 'blue.dim',
      },
      diag = {
        hint = 'yellow.dim',
      },
      diag_bg = {
        error = 'none',
        warn = 'none',
        info = 'none',
        hint = 'none',
        ok = 'none',
      },
    },
  },
  groups = {
    all = {
      NeoTreeGitUntracked = { fg = 'palette.orange' },
    },
  },
})
