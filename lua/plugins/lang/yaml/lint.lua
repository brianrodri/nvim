---@module "lazy"
---@type LazySpec
return {
  {
    "mfussenegger/nvim-lint",
    ---@type my.LintOpts
    opts = { linters_by_ft = { yaml = { "yamllint" } } },
  },
}
