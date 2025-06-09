---@module "lazy"
---@type LazySpec
return {
  {
    "brianrodri/projects.nvim",
    ---@module "project_nvim"
    ---@type ProjectOptions
    opts = { patterns = { "Cargo.toml" } },
    opts_extend = { "patterns" },
  },
}
