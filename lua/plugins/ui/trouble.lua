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
    { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (workspace)" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
    { "<leader>xm", "<cmd>NoiceAll<cr>", desc = "Message List" },
    { "<leader>xc", "<cmd>NoiceDismiss<cr>", desc = "Clear Messages" },
  },
}
