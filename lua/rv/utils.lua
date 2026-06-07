local M = {}

M.is_mac = function()
  return vim.uv.os_uname().sysname == 'Darwin'
end

return M
