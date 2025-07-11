local my_paths = require("my.paths")

local MY_PLUGINS_DIR = vim.fs.joinpath(my_paths.nvim_config_dir, "lua", "plugins")

local M = {}

--- Returns a list of |LazySpec| imports from each sub-directory in the calling script's directory.
---
---@module "lazy"
---@return LazySpec[]
function M.flatten_submodule_plugins()
  -- NOTE: Gets path of the script that called this function: https://stackoverflow.com/a/23535333/4859885
  local script_path = assert(my_paths.resolve(debug.getinfo(2, "S").source:sub(2)), "error reading execution context")
  local path_components = vim
    .iter(vim.fs.parents(script_path))
    :map(function(path) return vim.startswith(path, MY_PLUGINS_DIR) and vim.fs.basename(path) or nil end)
    :totable()
  if #path_components == 0 then return {} end
  local module_prefix = vim.iter(path_components):rev():join(".") .. "."
  return vim
    .iter(vim.fs.dir(vim.fs.dirname(script_path)))
    :map(function(name, type) return type == "directory" and { import = module_prefix .. name } or nil end)
    :totable()
end

--- Returns a copy of items without any duplicates.
---
---@generic T
---@param items T[]
---@return T[]
function M.dedupe(items)
  local set = {}
  vim.iter(items):each(function(val) set[val] = true end)
  return vim.tbl_keys(set)
end

--- Returns a non-empty copy of the provided string with leading and trailing whitespace removed, otherwise `nil`.
---
---@param text string|?
---@return string|? non_empty_string_or_nil
function M.trimmed(text)
  local trimmed = (text or ""):gsub("^%s+", ""):gsub("%s+$", "")
  if vim.fn.empty(trimmed) == 1 then return nil end
  return trimmed
end

return M
