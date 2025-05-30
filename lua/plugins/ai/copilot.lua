---@module "lazy"
---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    ---@module "copilot"
    ---@type CopilotConfig
    ---@diagnostic disable: missing-fields
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
    ---@diagnostic enable: missing-fields
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
}
