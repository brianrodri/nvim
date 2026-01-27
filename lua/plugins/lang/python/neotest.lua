---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-python" },
    ---@module "neotest"
    ---@type neotest.Config|{}
    opts = { adapters = { ["neotest-python"] = {
      python = "../.direnv/python-3.10/bin",
    } } },
  },
}
