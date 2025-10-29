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

--- Converts a string to title case. Splits "words" by underscores, hyphens, and spaces.
---
--- @param str string Input string to convert
--- @return string title_case_str
function M.title_case(str)
  local title_case_parts = {}
  for w_match in string.gmatch(string.lower(str), "%w+") do
    for word in vim.gsplit(w_match, "[_-]", { trimempty = true }) do
      local capitalized_word = string.gsub(word, "^%l", string.upper)
      table.insert(title_case_parts, capitalized_word)
    end
  end
  return table.concat(title_case_parts, " ")
end

function M.sort_by(items, key_func)
  local key_list = {}
  local index_list = {}
  for index, item in ipairs(items) do
    table.insert(key_list, key_func(item))
    table.insert(index_list, index)
  end
  table.sort(index_list, function(a_index, b_index)
    if key_list[a_index] < key_list[b_index] then return true end
    if key_list[b_index] < key_list[a_index] then return false end
    return a_index < b_index
  end)
  return vim.iter(index_list):map(function(index) return items[index] end):totable()
end

return M
