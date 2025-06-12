---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type my.types.TSConfig
    opts = {
      highlight = { enable = true },
      ensure_installed = { "markdown", "markdown_inline" },
    },
    opts_extend = { "ensure_installed" },
  },
}
