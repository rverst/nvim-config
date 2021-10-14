local utils = require('utils')
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup = {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
  },
}

local M = {}

local promptDir = function()
  local path = vim.fn.input({
    prompt = 'Path: ',
    completion = 'dir',
    cancelreturn = '###',
  })

  if path == '###' then
    return nil
  end
  if path == '' then
    return rv.last_path
  end
  return path
end

local search = function(path, title)
  builtin.find_files({
    prompt_title = '< ' .. title .. ' >',
    cwd = path,
  })
end

local grep = function(path, title)
  builtin.live_grep({
    prompt_title = '< ' .. title .. ' >',
    cwd = path,
  })
end

M.search_dotfiles = function()
  local home = os.getenv('HOME')
  local path = utils.joinPath(home, '.config', 'dotfiles')
  local title = 'dotfiles'

  if utils.exists(path) then
    search(path, title)
  end

  path = utils.joinPath(home, '.config')
  title = '~/.config'
  if utils.exists(path) then
    search(path, title)
  end

  search(home, '~')
end

M.grep_dotfiles = function()
  local home = os.getenv('HOME')
  local path = utils.joinPath(home, '.config', 'dotfiles')
  local title = 'dotfiles'

  if utils.exists(path) then
    search(path, title)
  end

  path = utils.joinPath(home, '.config')
  title = '~/.config'
  if utils.exists(path) then
    search(path, title)
  end

  grep(home, '~')
end

M.search_vimconfig = function()
  builtin.find_files({
    prompt_title = '< neovim >',
    cwd = rv.nvimPath,
  })
end

M.grep_vimconfig = function()
  builtin.find_files({
    prompt_title = '< neovim >',
    cwd = rv.nvimPath,
  })
end

M.project_files = function()
  local opts = {
    file_ignore_patterns = {
      'vendor',
      'node_modules',
    },
    prompt_title = '< project files >',
  }
  local ok = pcall(builtin.git_files, opts)
  if not ok then
    builtin.find_files(opts)
  end
end

M.search_path = function()
  local path = promptDir()
  if path == nil then
    return
  end
  if string.match(path, '^~.?') then
    path = utils.joinPath(os.getenv('HOME'), string.sub(path, 2))
  end

  if not utils.exists(path) then
    vim.notify("'" .. path .. "' does not exist", 'error', {
      title = 'file',
    })
    return
  end

  rv.last_path = path
  search(path, path)
end

M.grep_path = function()
  local path = promptDir()
  if path == nil then
    return
  end
  if string.match(path, '^~.?') then
    path = utils.joinPath(os.getenv('HOME'), string.sub(path, 2))
  end

  if not utils.exists(path) then
    vim.notify("'" .. path .. "' does not exist", 'error', {
      title = 'file',
    })
    return
  end

  rv.last_path = path
  grep(path, path)
end

return M
