---@module "lazy"
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    ---@type my.types.LspConfig
    opts = { lua_ls = {} },
  },
}
