local my_vault = require("my.vault")

---@module "lazy"
---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    ---@module "copilot"
    ---@type CopilotConfig|{}
    opts = {
      workspace_folders = { my_vault.root_dir },
      ---@type SuggestionConfig|{}
      suggestion = { enabled = false },
      ---@type PanelConfig|{}
      panel = { enabled = false },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "AndreM222/copilot-lualine" },
    opts = { sections = { lualine_x = { "copilot" } } },
    opts_extend = { "sections.lualine_x" },
  },
}
