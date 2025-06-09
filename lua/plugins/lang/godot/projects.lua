---@module "lazy"
---@type LazySpec
return {
  {
    "brianrodri/projects.nvim",
    ---@module "project_nvim"
    ---@type ProjectOptions
    opts = { patterns = { "project.godot" } },
    opts_extend = { "patterns" },
  },
}
