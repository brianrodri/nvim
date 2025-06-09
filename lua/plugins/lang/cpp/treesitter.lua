---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "cpp", "c" } },
    opts_extend = { "ensure_installed" },
  },
}
