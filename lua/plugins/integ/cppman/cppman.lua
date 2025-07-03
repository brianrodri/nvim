---@module "lazy"
---@type LazySpec
return {
  {
    "v1nh1shungry/cppman.nvim",
    cmd = "Cppman",
    dependencies = { "folke/snacks.nvim" },
    ---@module "cppman"
    ---@type cppman.Config|{}
    opts = { picker = "snacks" },
  },
}
