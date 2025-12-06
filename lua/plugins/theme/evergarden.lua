---@module "lazy"
---@type LazySpec
return {
  {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    ---@module "evergarden"
    ---@type evergarden.types.config
    opts = {
      theme = { variant = "winter", accent = "green" },
      editor = {
        float = {
          color = "mantle",
          solid_border = false,
        },
        completion = {
          color = "surface0",
        },
      },
      ---@module "evergarden"
      ---@type evergarden.types.styleconfig|{}
      style = { keyword = {} },
      overrides = function(colors)
        return {
          SnacksDashboardHeader = { fg = colors.green },
          SnacksDashboardIcon = { fg = colors.green },
          SnacksDashboardDesc = { fg = colors.text },
          SnacksDashboardKey = { fg = colors.green },
          SnacksDashboardFooter = { fg = colors.comment },
          SnacksDashboardSpecial = { fg = colors.green },
          SnacksDashboardDir = { fg = colors.comment },
          SnacksDashboardFile = { fg = colors.text },
          SnacksDashboardTerminal = { fg = colors.text },
          SnacksDashboardTitle = { fg = colors.green, style = { "bold" } },
        }
      end,
    },
    config = function(_, opts)
      require("evergarden").setup(opts)
      vim.cmd("colorscheme evergarden")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "evergarden" } },
  },
}
