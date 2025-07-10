---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-lua/plenary.nvim",
    priority = 9999,
    lazy = false,
  },

  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-neotest/neotest-plenary" },
    ---@module "neotest"
    ---@type neotest.Config|{}
    opts = { adapters = { ["neotest-plenary"] = {} } },
  },
}
