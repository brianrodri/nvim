---@module "lazy"
---@type LazySpec
return {
  {
    "jpwol/thorn.nvim",
    -- TODO(jpwol/thorn.nvim#16): I need `@markup.quote`
    dir = "~/Repositories/thorn.nvim",
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
        hl.SnacksDashboardHeader = { fg = palette.lightgreen }
        hl.SnacksDashboardIcon = { fg = palette.lightgreen }
        hl.SnacksDashboardDesc = { fg = palette.gray }
        hl.SnacksDashboardKey = { fg = palette.gray }
        hl.SnacksDashboardFooter = { fg = palette.gray }
        hl.SnacksDashboardSpecial = { fg = palette.lightgreen }
        hl.SnacksDashboardDir = { fg = palette.hbg[0] }
        hl.SnacksDashboardFile = { fg = palette.hfg[0] }
      end,
    },
    config = function(_, opts)
      require("thorn").setup(opts)
      vim.cmd([[colorscheme thorn]])
    end,
  },
}
