---@module "lazy"
---@type LazySpec
return {
  {
    "neovim/nvim-lspconfig",
    ---@type my.types.LspConfig
    opts = {
      wgsl_analyzer = {
        filetypes = { "wesl", "wgsl" },
        settings = {
          ["wgsl-analyzer"] = {
            -- Disable diagnostics since it doesn't understand WESL syntax
            diagnostics = { enable = false },
            -- Keep other features enabled
            completion = { enable = true },
            hover = { enable = true },
            inlayHints = { enable = true },
          },
        },
      },
    },
  },
}
