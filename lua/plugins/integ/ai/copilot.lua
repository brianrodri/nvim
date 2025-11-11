local my_paths = require("my.paths")

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
      filetypes = { markdown = true },
      workspace_folders = { my_paths.personal_vault.root_dir },
      ---@module "copilot"
      ---@type SuggestionConfig|{}
      suggestion = { enabled = false },
      ---@module "copilot"
      ---@type PanelConfig|{}
      panel = { enabled = false },
    },
  },

  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    ---@module "blink-cmp"
    ---@type blink.cmp.Config
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
