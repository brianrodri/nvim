---@module "lazy"
---@type LazySpec
return {
  {
    "brianrodri/projects.nvim",
    commit = "adf0511",
    main = "project_nvim",
    ---@module "project_nvim"
    ---@type ProjectOptions
    opts = {
      detection_methods = { "lsp", "pattern" },
      exclude_dirs = { "~/.local/share/nvim/lazy/*" },
      patterns = { ".git" },
      show_hidden = true,
    },
    opts_extend = { "patterns" },
  },
}
