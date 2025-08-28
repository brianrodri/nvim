---@module "lazy"
---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    ---@type my.types.TSConfig
    opts = { ensure_installed = { "wgsl", "wgsl_bevy" } },
    opts_extend = { "ensure_installed" },
  },
}
