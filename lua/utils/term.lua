local M = {}
local ok, window = pcall(require, 'lspsaga.window')
if not ok then
  vim.notify("cant't load 'lspsaga.window'", 'warn')
end
local api = vim.api

-- opens a floating terminal
-- the function is borrowed from lspsaga (https://github.com/glepnir/lspsaga.nvim/blob/333178b4e941eb19d9c97c0b0b5640c76363b0ad/lua/lspsaga/floaterm.lua#L4)
-- but returns the bufferNr of the terminal window
-- so it's easy to bind keys to that buffer
M.openFloatTerm = function(command, border_style)
  local cmd = command or ''
  border_style = border_style or 0

  -- get dimensions
  local width = api.nvim_get_option('columns')
  local height = api.nvim_get_option('lines')

  -- calculate our floating window size
  local win_height = math.ceil(height * 0.8)
  local win_width = math.ceil(width * 0.8)

  -- and its starting position
  local row = math.ceil((height - win_height) * 0.4)
  local col = math.ceil((width - win_width) * 0.5)

  -- set some options
  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
  }

  local content_opts = { contents = {}, filetype = 'Floaterm', enter = true }

  local cb, cw, ow
  if border_style == 0 then
    cb, cw, _, ow = window.open_shadow_float_win(content_opts, opts)
  else
    local border_opts = { border = border_style }
    cb, cw, _, ow = window.create_win_with_border(content_opts, opts)
  end
  api.nvim_command('terminal ' .. cmd)
  api.nvim_command('setlocal nobuflisted')
  api.nvim_command('startinsert!')
  api.nvim_buf_set_var(cb, 'float_terminal_win', { cw, ow })
  return cb
end

-- closes a floating terminal window
M.closeFloatTerm = function()
  vim.o.mouse = vim.g.my_mouse

  local has_var, float_terminal_win = pcall(api.nvim_buf_get_var, 0, 'float_terminal_win')
  if not has_var then
    return
  end
  if
    float_terminal_win[1] ~= nil
    and api.nvim_win_is_valid(float_terminal_win[1])
    and float_terminal_win[2] ~= nil
    and api.nvim_win_is_valid(float_terminal_win[2])
  then
    api.nvim_win_close(float_terminal_win[1], true)
    api.nvim_win_close(float_terminal_win[2], true)
  end
end

return M
