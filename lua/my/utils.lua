local my_paths = require("my.paths")

local Utils = {}

---@param stack_index number
---@return string script_path
local function get_script_path_from_execution_stack(stack_index)
  return debug.getinfo(stack_index + 1, "S").source:sub(2)
end

---@param path string
local function get_import_basename(path)
  return vim.startswith(path, my_paths.nvim_config_plugins_dir) and vim.fs.basename(path) or nil
end

--- Returns `LazySpec` objects for each folder in the current script's directory.
---
---@module "lazy"
---@return LazySpec[]
function Utils.flatten_submodule_plugins()
  local script_path = assert(vim.uv.fs_realpath(get_script_path_from_execution_stack(2)))
  local module_path = vim.fn.reverse(vim.iter(vim.fs.parents(script_path)):map(get_import_basename):totable())
  local import_prefix = vim.iter(module_path):join(".") .. "."
  return vim
    .iter(vim.fs.dir(vim.fs.dirname(script_path)))
    :map(function(name, type) return type == "directory" and { import = import_prefix .. name } or nil end)
    :totable()
end

--- Returns a copy of items without any duplicates.
---
---@generic T
---@param items T[]
---@return T[]
function Utils.dedupe(items)
  local set = {}
  vim.iter(items):each(function(val) set[val] = true end)
  return vim.tbl_keys(set)
end

return Utils
