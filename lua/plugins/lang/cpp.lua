---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cpp", "c" } },
    opts_extend = { "ensure_installed" },
  },

  {
    "stevearc/conform.nvim",
    opts = { formatters_by_ft = { cpp = { "clang-format" } } },
  },

  {
    "neovim/nvim-lspconfig",
    ---@type my.LspConfig
    opts = { clangd = {} },
  },

  {
    "mfussenegger/nvim-lint",
    ---@type my.LintOpts
    opts = { linters_by_ft = { cpp = { "cpplint" } } },
  },
}
