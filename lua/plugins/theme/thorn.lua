---@module "lazy"
---@type LazySpec
return {
  {
    enabled = true,
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "dark",
      background = "warm",
      styles = {
        strings = { italic = false, bold = false },
        keywords = { italic = false, bold = false },
      },
      on_highlights = function(hl, palette)
        hl.SnacksDashboardHeader = { fg = palette.green1 }
        hl.SnacksDashboardIcon = { fg = palette.green1 }
        hl.SnacksDashboardDesc = { fg = palette.white }
        hl.SnacksDashboardKey = { fg = palette.green1 }
        hl.SnacksDashboardFooter = { fg = palette.gray }
        hl.SnacksDashboardSpecial = { fg = palette.green1 }
        hl.SnacksDashboardDir = { fg = palette.gray }
        hl.SnacksDashboardFile = { fg = palette.white }
        hl.SnacksDashboardTerminal = { fg = palette.white }
        hl.SnacksDashboardTitle = { fg = palette.green1, bold = true }
      end,
    },
    config = function(_, opts)
      require("thorn").setup(opts)
      vim.cmd([[colorscheme thorn]])
    end,
  },
}
