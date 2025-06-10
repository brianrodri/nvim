---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    ---@module "snacks"
    ---@type snacks.Config
    opts = { lazygit = { enabled = true } },
    keys = {
      { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
    },
  },
}
