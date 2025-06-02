---@module "lazy"
---@type LazySpec
return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_better_performance = 1
      vim.g.everforest_diagnostic_line_highlight = 1
      vim.g.everforest_diagnostic_virtual_text = 1
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme("everforest")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = { options = { theme = "everforest" } },
  },
}
