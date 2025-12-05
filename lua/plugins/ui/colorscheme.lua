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
    },
    config = function(_, opts)
      require("thorn").setup(opts)
      vim.cmd([[colorscheme thorn]])
    end,
  },
}
