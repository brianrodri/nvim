local M = {}

---@param base_path string  Resolved by composing |uv.fs_realpath()| with |vim.fs.normalize()|.
---@param ... string        Combined with the resolved path using |vim.fs.joinpath()|.
---@return string|? resolved_path
function M.resolve(base_path, ...)
  local resolved_root = vim.uv.fs_realpath(vim.fs.normalize(tostring(base_path), { win = vim.fn.has("wsl") == 1 }))
  return resolved_root and vim.fs.joinpath(resolved_root, ...)
end

M.nvim_config_dir = M.resolve(vim.fn.stdpath("config"))
M.dot_config_dir = M.resolve("~/Repositories/config")
M.lazy_plugins_dir = M.resolve(vim.fn.stdpath("data"), "lazy")

return M
