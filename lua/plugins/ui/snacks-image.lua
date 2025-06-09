---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        ensure_installed = {
          "css",
          "html",
          "javascript",
          "latex",
          "norg",
          "regex",
          "scss",
          "svelte",
          "tsx",
          "typst",
          "vue",
        },
      },
      opts_extend = { "ensure_installed" },
    },
    ---@module "snacks"
    ---@type snacks.Config
    opts = { image = { enabled = true } },
  },
}
