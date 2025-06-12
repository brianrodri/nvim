local M = {}

---@param base_path string  Resolved by composing |uv.fs_realpath()| with |vim.fs.normalize()|.
---@param ... string        Combined with the resolved path using |vim.fs.joinpath()|.
---@return string resolved_path
function M.resolve(base_path, ...)
  local has_wsl = vim.fn.has("wsl") == 1
  local resolved_root = assert(vim.uv.fs_realpath(vim.fs.normalize(tostring(base_path), { win = has_wsl })))
  return vim.fs.joinpath(resolved_root, ...)
end

M.nvim_config_dir = M.resolve(vim.fn.stdpath("config"))
M.dot_config_dir = M.resolve("~/Repositories/config")
M.lazy_plugins_dir = M.resolve(vim.fn.stdpath("data"), "lazy")

M.personal_vault = {
  root_dir = M.resolve("~/Documents/Vault"),
  inbox_note_path = "0 - Index/Inbox.md",
  daily_notes_dir = "1 - Journal/Daily",
  fleeting_notes_dir = "2 - Fleeting Notes",
  attachments_dir = "8 - Meta/Attachments",
}

return M
