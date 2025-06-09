---@module "lazy"
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    ---@type my.LspConfig
    opts = { ts_ls = {} },
  },
}
