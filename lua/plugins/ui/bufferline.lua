---@module "lazy"
---@type LazySpec
return {
  "akinsho/bufferline.nvim",
  ---@module "bufferline"
  ---@type bufferline.UserConfig
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      separator_style = "slope",
      diagnostics_update_on_event = true,
      close_command = function(buf) require("snacks.bufdelete").delete({ buf = buf }) end,
      right_mouse_command = function(buf) require("snacks.bufdelete").delete({ buf = buf }) end,
      always_show_bufferline = true,
    },
  },
  keys = {
    { "<leader>bR", "<cmd>BufferLineCloseRight<cr>", desc = "Delete Buffers to the Right" },
    { "<leader>bL", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete Buffers to the Left" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Left" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Right" },
  },
}
