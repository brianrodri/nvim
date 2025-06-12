---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type my.TSConfig
    opts = { ensure_installed = { "yaml" } },
    opts_extend = { "ensure_installed" },
  },
}
