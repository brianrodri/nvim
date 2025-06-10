---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      input = {
        enabled = true,
        win = { style = "input", relative = "cursor", row = -3, col = 0 },
        expand = false,
      },
    },
  },
}
