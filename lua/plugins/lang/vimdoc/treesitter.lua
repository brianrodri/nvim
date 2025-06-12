---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type my.types.TSConfig
    opts = { ensure_installed = { "vimdoc" } },
    opts_extend = { "ensure_installed" },
  },
}
