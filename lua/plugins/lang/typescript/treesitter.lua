---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "typescript" } },
    opts_extend = { "ensure_installed" },
  },
}
