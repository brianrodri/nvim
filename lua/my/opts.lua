local MY_AUTOFORMAT_OPTION_NAME = "autoformat"
local MY_AUTOFORMAT_OPTION_TITLE = "Auto Format"
local MY_AUTOFORMAT_OPTION_DEFAULT_VALUE = true

---@param opts? { global?: boolean }
---@return boolean enabled
local function get_autoformat_enabled(opts)
  if not opts or not opts.global then
    local buffer_enabled = vim.b[MY_AUTOFORMAT_OPTION_NAME]
    if buffer_enabled ~= nil then return buffer_enabled end
  end
  local global_enabled = vim.g[MY_AUTOFORMAT_OPTION_NAME]
  if global_enabled ~= nil then return global_enabled end
  return MY_AUTOFORMAT_OPTION_DEFAULT_VALUE
end

---@param opts? { global?: boolean }
---@param enabled boolean
local function set_autoformat_enabled(opts, enabled)
  if not opts or not opts.global then
    vim.b[MY_AUTOFORMAT_OPTION_NAME] = enabled
  else
    vim.g[MY_AUTOFORMAT_OPTION_NAME] = enabled
    vim.b[MY_AUTOFORMAT_OPTION_NAME] = nil
  end
end

---@param opts? { global?: boolean }
---@return snacks.toggle.Class
local function new_autoformat_snacks_toggle(opts)
  return require("snacks.toggle").new({
    id = MY_AUTOFORMAT_OPTION_NAME,
    name = string.format("%s (%s)", MY_AUTOFORMAT_OPTION_TITLE, opts and opts.global and "global" or "buffer"),
    get = function() return get_autoformat_enabled(opts) end,
    set = function(value) set_autoformat_enabled(opts, value) end,
  })
end

return {
  get_autoformat_enabled = get_autoformat_enabled,
  set_autoformat_enabled = set_autoformat_enabled,
  new_autoformat_snacks_toggle = new_autoformat_snacks_toggle,
}
