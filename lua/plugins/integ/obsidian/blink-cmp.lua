---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    dependencies = { "saghen/blink.cmp" },
    ---@module "obsidian"
    ---@type obsidian.config.ClientOpts|{}
    opts = { completion = { blink = true } },
  },
}
