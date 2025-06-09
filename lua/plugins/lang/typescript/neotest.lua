---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = { "marilari88/neotest-vitest" },
    ---@module "neotest"
    ---@type neotest.Config|{}
    opts = { adapters = { ["neotest-vitest"] = {} } },
  },
}
