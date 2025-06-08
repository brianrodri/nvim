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
    opts = {
      input = { provider = "snacks" },
      provider = "claude",
    },
    enabled = vim.fn.getenv("ANTHROPIC_API_KEY") ~= nil,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = { file_types = { "Avante" } },
    opts_extend = { "file_types" },
  },
}
