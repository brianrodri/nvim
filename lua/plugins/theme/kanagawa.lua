---@module "lazy"
---@type LazySpec
return {
  {
    "rebelot/kanagawa.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    ---@module "kanagawa"
    ---@type KanagawaConfig
    opts = {
      theme = "wave",
      colors = {
        theme = { all = { ui = { bg_gutter = "none" } } },
      },
      transparent = true,
      ---@module "kanagawa"
      ---@param colors KanagawaColors
      overrides = function(colors) -- add/modify highlights
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          -- Save an hlgroup with dark background and dimmed foreground
          -- so that you can use it where your still want darker windows.
          -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          NormalDark = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_m3 },
          LazyNormal = { bg = colors.theme.ui.bg_m3, fg = colors.theme.ui.fg_dim },

          -- Customize the Snacks dashboard colors
          SnacksDashboardHeader = { fg = colors.palette.springGreen },
          SnacksDashboardIcon = { fg = colors.palette.springGreen },
          SnacksDashboardDesc = { fg = colors.palette.dragonWhite },
          SnacksDashboardKey = { fg = colors.palette.springViolet2 },
          SnacksDashboardFooter = { fg = colors.palette.dragonAsh },
          SnacksDashboardSpecial = { fg = colors.palette.springGreen },
          SnacksDashboardDir = { fg = colors.palette.dragonAsh },
          SnacksDashboardFile = { fg = colors.palette.dragonWhite },
          SnacksDashboardTerminal = { fg = colors.palette.dragonWhite },
          SnacksDashboardTitle = { fg = colors.palette.springGreen, bold = true },

          Pmenu = { fg = colors.theme.ui.fg_dim, bg = colors.theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = colors.theme.ui.bg_p2 },
          PmenuSbar = { bg = colors.theme.ui.bg_m1 },
          PmenuThumb = { bg = colors.theme.ui.bg_p2 },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  },
}
