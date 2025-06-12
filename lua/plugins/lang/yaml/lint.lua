---@module "lazy"
---@type LazySpec
return {
  {
    "mfussenegger/nvim-lint",
    ---@type my.types.LintOpts
    opts = { linters_by_ft = { yaml = { "yamllint" } } },
  },
}
