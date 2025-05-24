---@module "lazy"
---@type LazySpec
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  ---@type trouble.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    follow = false,
    pinned = true,
    focus = true,
    multiline = false,
    warn_no_results = false,
    open_no_results = true,
    preview = { scratch = false },
    ---@type table<string, trouble.Mode>
    modes = {
      ---@diagnostic disable-next-line: missing-fields
      my_lsp_document_symbols = {
        mode = "lsp_document_symbols",
        win = { position = "right", size = 80, minimal = true },
      },
    },
  },
  keys = {
    { "<leader>xx", function() require("trouble").toggle("diagnostics") end, desc = "Diagnostics" },
    { "<leader>xt", function() require("trouble").toggle("todo") end, desc = "Todo List" },
    { "<leader>xq", function() require("trouble").toggle("qflist") end, desc = "QuickFix List" },
    { "<leader>xl", function() require("trouble").toggle("loclist") end, desc = "Location List" },
    { "<leader>xm", "<cmd>NoiceAll<cr>", desc = "Message List" },
    { "<leader>xc", "<cmd>NoiceDismiss<cr>", desc = "Clear Messages" },
  },
}
