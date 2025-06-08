local MY_AUTOFORMAT_OPTION_KEY = "autoformat"
local MY_AUTOFORMAT_OPTION_NAME = "Auto Format"
local MY_AUTOFORMAT_OPTION_DEFAULT_VALUE = true

---@param opts? { global?: boolean }
---@return boolean enabled
local function is_autoformat_enabled(opts)
  if not opts or not opts.global then
    local buffer_enabled = vim.b[MY_AUTOFORMAT_OPTION_KEY]
    if buffer_enabled ~= nil then return buffer_enabled end
  end
  local global_enabled = vim.g[MY_AUTOFORMAT_OPTION_KEY]
  if global_enabled ~= nil then return global_enabled end
  return MY_AUTOFORMAT_OPTION_DEFAULT_VALUE
end

---@param opts? { global?: boolean }
---@param enabled boolean
local function set_autoformat_enabled(opts, enabled)
  if not opts or not opts.global then
    vim.b[MY_AUTOFORMAT_OPTION_KEY] = enabled
  else
    vim.g[MY_AUTOFORMAT_OPTION_KEY] = enabled
    vim.b[MY_AUTOFORMAT_OPTION_KEY] = nil
  end
end

---@param opts? { global?: boolean }
---@return snacks.toggle.Class
local function snacks_toggle_autoformat(opts)
  return require("snacks.toggle").new({
    id = MY_AUTOFORMAT_OPTION_KEY,
    name = string.format("%s (%s)", MY_AUTOFORMAT_OPTION_NAME, opts and opts.global and "global" or "buffer"),
    get = function() return is_autoformat_enabled(opts) end,
    set = function(value) set_autoformat_enabled(opts, value) end,
  })
end

return {
  is_autoformat_enabled = is_autoformat_enabled,

  setup_keymaps = function()
    local snacks_toggle = require("snacks.toggle")
    snacks_toggle.option("colorcolumn", { name = "Color Column", on = "+1", off = "" }):map("<leader>oc")
    snacks_toggle.diagnostics():map("<leader>od")
    snacks_toggle.indent():map("<leader>oi")
    snacks_toggle.line_number():map("<leader>ol")
    snacks_toggle.animate():map("<leader>om")
    snacks_toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>or")
    snacks_toggle.option("spell", { name = "Spelling" }):map("<leader>os")
    snacks_toggle.treesitter():map("<leader>ot")
    snacks_toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
    snacks_toggle.inlay_hints():map("<leader>oy")
    snacks_toggle.zoom():map("<leader>oz")
    snacks_toggle_autoformat({ global = false }):map("<leader>oq")
    snacks_toggle_autoformat({ global = true }):map("<leader>oQ")
  end,
}
