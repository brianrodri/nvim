---@module "lazy"
---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = { gdscript = { "gdformat" } },
      formatters = { gdformat = { command = "gdformat", args = { "-", "--line-length", "120" } } },
    },
  },
}
