---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = { "rouge8/neotest-rust" },
    ---@module "neotest"
    ---@type neotest.Config|{}
    opts = { adapters = { ["neotest-rust"] = {} } },
  },
}
