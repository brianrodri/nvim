---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type my.types.TSConfig
    opts = { ensure_installed = { "python", "ninja", "rst" } },
    opts_extend = { "ensure_installed" },
  },
}
