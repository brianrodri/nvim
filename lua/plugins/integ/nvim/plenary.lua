---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-lua/plenary.nvim",
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
