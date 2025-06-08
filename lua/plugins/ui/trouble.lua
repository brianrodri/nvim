local my_trouble = require("my.trouble")

---@module "lazy"
---@type LazySpec
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  ---@type trouble.Config|{}
  opts = {
    focus = true,
    follow = false,
    warn_no_results = false,
    open_no_results = true,
    restore = false,
    modes = {
      lsp_base = {
        params = { include_current = true },
      },
      lsp_document_symbols = {
        mode = "lsp_document_symbols",
        win = { position = "right", size = 112, minimal = true },
      },
    },
  },
  -- stylua: ignore
  -- luacheck: no max line length
  ---@diagnostic disable: missing-fields
  keys = {
    { "<leader>xx", function() require("trouble").toggle({ mode = "diagnostics" }) end, desc = "Diagnostics" },
    { "<leader>xt", function() require("trouble").toggle({ mode = "todo", filter = my_trouble.todo_filter }) end, desc = "Todo Comments" },
    { "<leader>xT", function() require("trouble").toggle({ mode = "todo" }) end, desc = "All Comments" },
    { "<leader>xq", function() require("trouble").toggle({ mode = "qflist" }) end, desc = "QuickFix List" },
    { "<leader>xl", function() require("trouble").toggle({ mode = "loclist" }) end, desc = "Location List" },
    { "<leader>xm", "<cmd>NoiceAll<cr>", desc = "Message List" },
    { "<leader>xc", "<cmd>NoiceDismiss<cr>", desc = "Clear Messages" },
  },
}
