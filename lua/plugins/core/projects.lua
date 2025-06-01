---@module "lazy"
---@type LazySpec
return {
  {
    "ahmedkhalf/project.nvim",
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

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "ahmedkhalf/project.nvim" },
    opts = { extensions = { projects = {} } },
    keys = {
      { "<leader>pr", function() require("project_nvim").get_recent_projects() end, desc = "Recent Projects" },
    },
  },
}
