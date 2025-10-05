---@module "lazy"
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    ---@type my.types.LspConfig
    opts = {
      markdown_oxide = {
        root_markers = { ".obsidian" },
        capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } },
      },
    },
    opts_extend = { "markdown_oxide.root_markers" },
  },
}
