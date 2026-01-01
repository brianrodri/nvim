---@module "lazy"
---@type LazySpec[]
return {
  {
    "hamidi-dev/org-list.nvim",
    dependencies = { "tpope/vim-repeat" },
    opts = {
      mapping = {
        key = "<leader>vX",
        desc = "Change List Type",
        filetypes = { "markdown" },
      },
      checkbox_toggle = {
        enabled = true,
        key = "<leader>vx",
        desc = "Toggle Checkbox",
        filetypes = { "markdown" },
      },
    },
  },
}
