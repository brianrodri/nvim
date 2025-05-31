---@module "lazy"
---@type LazySpec
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "folke/noice.nvim",
  },
  opts = {
    theme = "everforest",
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "filetype" },
      lualine_y = { "location" },
      lualine_z = { "lsp_status" },
    },
  },
  opts_extend = {
    "sections.lualine_a",
    "sections.lualine_b",
    "sections.lualine_c",
    "sections.lualine_x",
    "sections.lualine_y",
    "sections.lualine_z",
  },
}
