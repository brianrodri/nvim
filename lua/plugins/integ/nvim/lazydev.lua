---@module "lazy"
---@type LazySpec
return {
  { -- Configures LuaLS for editing Neovim config files
    "folke/lazydev.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "lua",
    ---@module "lazydev"
    ---@type lazydev.Config|{}
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "folke/lazydev.nvim" },
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = { "lazydev" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
