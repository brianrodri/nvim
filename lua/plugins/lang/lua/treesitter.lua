---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type my.TSConfig
    opts = { ensure_installed = { "lua", "luadoc" } },
    opts_extend = { "ensure_installed" },
  },
}
