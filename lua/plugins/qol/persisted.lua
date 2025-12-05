---@module "lazy"
---@type LazySpec
return {
  {
    "olimorris/persisted.nvim",
    event = "BufReadPre",
    opts = { autoload = true },
  },
}
