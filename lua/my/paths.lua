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

M.vault = {
  name = "My Vault",
  root_dir = M.resolve("~/Vault"),
  daily_notes_folder = "1. Journal/1. Daily",
  fleeting_notes_folder = "2. Fleeting",
  meta_folder = "9. Meta",
  attachments_folder = "9. Meta/Attachments",
  templates_folder = "9. Meta/Templates",
  auto_frontmatter_folders = {
    "1. Journal/4. Exercises",
    "3. Permanent",
    "4. Literature",
    "5. Project",
  },
}

function M.vault:is_frontmatter_enabled(fname)
  return vim.iter(self.auto_frontmatter_folders or {}):any(function(folder) return vim.startswith(fname, folder) end)
end

function M.vault:exists() return self.root_dir ~= nil end

return M
