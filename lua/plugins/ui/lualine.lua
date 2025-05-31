local my_prefs = require("my.prefs")

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
      lualine_z = { { "lsp_status", ignore_lsp = my_prefs.hidden_lsp_status_list } },
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
