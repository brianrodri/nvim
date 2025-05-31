local MY_AUTOFORMAT_OPTION = "autoformat"
local MY_AUTOFORMAT_OPTION_DESC = "Auto Format"

---@param opts { global?: boolean }
---@return snacks.toggle.Class
local function my_autoformat_snacks_toggle(opts)
  return require("snacks.toggle").new({
    id = MY_AUTOFORMAT_OPTION,
    name = string.format("%s (%s)", MY_AUTOFORMAT_OPTION_DESC, opts.global and "global" or "buffer"),
    get = function()
      local state = vim.b[MY_AUTOFORMAT_OPTION]
      if state ~= nil and not opts.global then return state end
      local global_state = vim.g[MY_AUTOFORMAT_OPTION]
      if global_state ~= nil then return vim.g[MY_AUTOFORMAT_OPTION] end
      return true
    end,
    set = function(state)
      if opts.global then
        vim.g[MY_AUTOFORMAT_OPTION] = state
        vim.b[MY_AUTOFORMAT_OPTION] = nil
      else
        vim.b[MY_AUTOFORMAT_OPTION] = state
      end
    end,
  })
end

return {
  setup_keymaps = function()
    local snacks_toggle = require("snacks.toggle")
    my_autoformat_snacks_toggle({ global = false }):map("<leader>oq")
    my_autoformat_snacks_toggle({ global = true }):map("<leader>oQ")
    snacks_toggle.option("colorcolumn", { name = "Color Column", on = "+1", off = "" }):map("<leader>oc")
    snacks_toggle.diagnostics():map("<leader>od")
    snacks_toggle.inlay_hints():map("<leader>oh")
    snacks_toggle.indent():map("<leader>oi")
    snacks_toggle.line_number():map("<leader>ol")
    snacks_toggle.animate():map("<leader>om")
    snacks_toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>or")
    snacks_toggle.option("spell", { name = "Spelling" }):map("<leader>os")
    snacks_toggle.treesitter():map("<leader>ot")
    snacks_toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
    snacks_toggle.zoom():map("<leader>oz")
  end,
}
