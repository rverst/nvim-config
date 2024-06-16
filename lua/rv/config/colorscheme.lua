-- Color scheme configuration

require('nightfox').setup({
  options = {
    dim_inactive = true,
    styles = {
      comments = 'italic',
      conditionals = 'italic',
      constants = 'italic',
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
      bg0 = '#151515',
      bg1 = '#181818',
      bg2 = '#252525',
      bg3 = '#303030',
      fg = '#d3d3d3',
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
        builtin0 = 'red2', -- Builtin variable
        builtin1 = 'yellow', -- Builtin type
        builtin2 = 'blue.bright', -- Builtin const
        --comment      -- Comment
        conditional = 'red', -- Conditional and loop
        const = 'red', -- Constants, imports and booleans
        --dep          -- Deprecated
        field = 'red', -- Field
        func = 'fg', -- Functions and Titles
        ident = 'yellow', -- Identifiers
        keyword = 'red', -- Keywords
        number = 'purple', -- Numbers
        operator = 'fg', -- Operators
        preproc = 'red',
        regex = 'yellow', -- Regex
        statement = 'pink', -- Statements
        string = 'green', -- Strings
        type = 'orange', -- Types
        variable = 'fg', -- Variables
      },
      git = {
        add = 'green',
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
      ['@module'] = { fg = 'palette.fg' },
      ['@variable.member'] = { fg = 'palette.blue' },
    },
  },
})
