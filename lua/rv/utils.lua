local M = {}

M.is_mac = function()
  return vim.loop.os_uname().sysname == 'Darwin'
end

return M
