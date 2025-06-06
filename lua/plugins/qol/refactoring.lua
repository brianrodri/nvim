---@module "lazy"
---@type LazySpec
return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
    lazy = false,
    -- stylua: ignore
    -- luacheck: no max line length
    keys = {
      { "<leader>rr", function() require("refactoring").select_refactor() end, mode = { "n", "x" }, expr = true, desc = "Refactor Actions" },
      { "<leader>rv", function() return require("refactoring").refactor("Extract Variable") end, mode = { "n", "x" }, expr = true, desc = "Extract Variable" },
      { "<leader>rb", function() return require("refactoring").refactor("Extract Block") end, mode = { "n", "x" }, expr = true, desc = "Extract Block" },
      { "<leader>rf", function() return require("refactoring").refactor("Extract Function") end, mode = { "n", "x" }, expr = true, desc = "Extract Function" },
      { "<leader>rB", function() return require("refactoring").refactor("Extract Block To File") end, mode = { "n", "x" }, expr = true, desc = "Extract Block To File" },
      { "<leader>rF", function() return require("refactoring").refactor("Extract Function To File") end, mode = { "n", "x" }, expr = true, desc = "Extract Function To File" },
      { "<leader>ri", function() return require("refactoring").refactor("Inline Variable") end, mode = { "n", "x" }, expr = true, desc = "Inline Variable" },
      { "<leader>rI", function() return require("refactoring").refactor("Inline Function") end, mode = { "n", "x" }, expr = true, desc = "Inline Function" },
    },
    ---@module "refactoring"
    ---@type refactor.ConfigOpts
    opts = { show_success_message = true },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "ThePrimeagen/refactoring.nvim" },
    opts = { extensions = { refactoring = {} } },
  },
}
