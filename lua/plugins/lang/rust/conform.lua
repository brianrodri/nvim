---@module "lazy"
---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      formatters_by_ft = { rust = { "rustfmt" } },
      formatters = {
        rustfmt = {
          command = "rustup",
          prepend_args = { "run", "nightly", "--", "rustfmt" },
        },
      },
    },
  },
}
