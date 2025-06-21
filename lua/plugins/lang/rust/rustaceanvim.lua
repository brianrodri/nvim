---@module "lazy"
---@type LazySpec
return {
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
  },

  {
    "nvim-neotest/neotest",
    ---@module "neotest"
    ---@type neotest.Config|{}
    opts = { adapters = { ["rustaceanvim.neotest"] = {} } },
  },
}
