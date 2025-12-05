---@module "lazy"
---@type LazySpec
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    ---@module "catppuccin"
    ---@type CatppuccinOptions|{}
    opts = {
      auto_integrations = true,
      custom_highlights = function(colors)
        return {
          SnacksDashboardHeader = { fg = colors.green },
          SnacksDashboardIcon = { fg = colors.green },
          SnacksDashboardDesc = { fg = colors.subtext0 },
          SnacksDashboardKey = { fg = colors.subtext0 },
          SnacksDashboardFooter = { fg = colors.subtext0 },
          SnacksDashboardSpecial = { fg = colors.green },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
