local my_snacks_toggle = require("my.snacks.toggle")

---@module "lazy"
---@type LazySpec
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = function() return my_snacks_toggle.is_autoformat_enabled() and {} or nil end,
  },
  keys = {
    { "<leader>cq", function() require("conform").format() end, desc = "Format" },
  },
}
