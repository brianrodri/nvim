---@module "lazy"
---@type LazySpec
return {
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    ---@module "everforest"
    ---@type Everforest.SetupOptions
    opts = {
      background = "hard",
      italics = true,
      float_style = "dim",
      on_highlights = function(hl, palette)
        hl.SnacksDashboardHeader = { fg = palette.green }
        hl.SnacksDashboardIcon = { fg = palette.green }
        hl.SnacksDashboardDesc = { fg = palette.fg }
        hl.SnacksDashboardKey = { fg = palette.green }
        hl.SnacksDashboardFooter = { fg = palette.grey0 }
        hl.SnacksDashboardSpecial = { fg = palette.green }
        hl.SnacksDashboardDir = { fg = palette.grey0 }
        hl.SnacksDashboardFile = { fg = palette.fg }
        hl.SnacksDashboardTerminal = { fg = palette.fg }
        hl.SnacksDashboardTitle = { fg = palette.green, bold = true }
      end,
    },
    config = function(_, opts)
      require("everforest").setup(opts)
      vim.cmd.colorscheme("everforest")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = "neanias/everforest-nvim",
    opts = { options = { theme = "everforest" } },
  },
}
