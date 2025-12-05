---@module "lazy"
---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    ---@module "catppuccin"
    ---@type CatppuccinOptions|{}
    opts = { auto_integrations = true },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
