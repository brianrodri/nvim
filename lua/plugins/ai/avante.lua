---@module "lazy"
---@type LazySpec
return {
  {
    "yetone/avante.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    version = false,
    build = "make",
    ---@module "avante"
    ---@type avante.Config|{}
    opts = { provider = "claude" },
    enabled = vim.fn.getenv("ANTHROPIC_API_KEY") ~= nil,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = { file_types = { "Avante" } },
    opts_extend = { "file_types" },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "Kaiser-Yang/blink-cmp-avante" },
    opts = {
      sources = {
        default = { "avante" },
        providers = { avante = { module = "blink-cmp-avante", name = "Avante" } },
      },
    },
    opts_extend = { "sources.default" },
  },
}
