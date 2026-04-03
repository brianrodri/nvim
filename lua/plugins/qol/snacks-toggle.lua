local my_opts = require("my.opts")

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  once = true,
  callback = function()
    my_opts.new_autoformat_snacks_toggle({ global = false }):map("<leader>oq")
    my_opts.new_autoformat_snacks_toggle({ global = true }):map("<leader>oQ")
    local snacks_toggle = require("snacks.toggle")
    snacks_toggle.option("colorcolumn", { name = "Color Column", on = "+1", off = "" }):map("<leader>oc")
    snacks_toggle.diagnostics():map("<leader>od")
    snacks_toggle.indent():map("<leader>oi")
    snacks_toggle.line_number():map("<leader>ol")
    snacks_toggle.animate():map("<leader>om")
    snacks_toggle.option("spell", { name = "Spelling" }):map("<leader>os")
    snacks_toggle.treesitter():map("<leader>ot")
    snacks_toggle.option("wrap", { name = "Wrap" }):map("<leader>ow")
    snacks_toggle.inlay_hints():map("<leader>oy")
    snacks_toggle.zoom():map("<leader>oz")
    snacks_toggle
      .new({
        name = "Render Markdown (buffer)",
        get = function() return require("render-markdown.state").get(vim.api.nvim_get_current_buf()).enabled end,
        set = function(value) require("render-markdown").set_buf(value) end,
      })
      :map("<leader>or")
    snacks_toggle
      .new({
        name = "Render Markdown (global)",
        get = function() return require("render-markdown").get() end,
        set = function(value) require("render-markdown").set(value) end,
      })
      :map("<leader>oR")
  end,
})

---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    ---@module "snacks"
    ---@type snacks.Config
    opts = { toggle = { enabled = true } },
  },
}
