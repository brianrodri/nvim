---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    priority = 1000,
    lazy = false,
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      -- Disabled
      explorer = { enabled = false },
      -- Enabled
      bigfile = { enabled = true },
      indent = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      terminal = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      { "<leader>bd", function() require("snacks").bufdelete() end, desc = "Delete Buffer" },
    },
  },
}
