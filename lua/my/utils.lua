local Utils = {}

--- Returns path containing the calling-script.
function Utils.get_script_path() return vim.fs.abspath(debug.getinfo(2).short_src) end

---@overload fun(var: string, global?: boolean): state: boolean
function Utils.get_var(var, global)
  if vim.b[var] ~= nil and not global then
    return vim.b[var]
  elseif vim.g[var] ~= nil then
    return vim.g[var]
  else
    return true
  end
end

---@overload fun(var: string, global?: boolean, state: boolean)
function Utils.set_var(var, state, global)
  if global then
    vim.g[var] = state
    vim.b[var] = nil
  else
    vim.b[var] = state
  end
end

---@overload fun(opts: { desc: string, var_name: string, global?: boolean }): snacks.toggle.Class
function Utils.var_toggle(opts)
  opts = opts or {}
  assert(opts.var_name, '"var_name" is required')
  return require("snacks.toggle").new({
    id = opts.var_name,
    name = string.format("%s (%s)", opts.desc or opts.var_name, opts.global and "global" or "buffer"),
    get = function() return Utils.get_var(opts.var_name, opts.global) end,
    set = function(state) Utils.set_var(opts.var_name, state, opts.global) end,
  }, opts)
end

---@generic T
---@param items T[]
---@return T[]
function Utils.dedupe(items)
  local set = {}
  vim.iter(items):each(function(val) set[val] = true end)
  return vim.tbl_keys(set)
end

return Utils
