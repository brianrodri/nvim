---@module "lazy"
---@type LazySpec
return {
  { -- Key remaps for seamlessly moving between tmux panes adjacent to a NeoVim pane.
    "aserowy/tmux.nvim",
    event = "BufReadPre",
    opts = { enable_default_keybindings = true },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "mgalliou/blink-cmp-tmux" },
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = { "tmux" },
        providers = {
          tmux = {
            module = "blink-cmp-tmux",
            name = "tmux",
            opts = { all_panes = true, capture_history = true, triggered_only = false },
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },
}
