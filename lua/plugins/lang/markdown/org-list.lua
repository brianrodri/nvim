---@module "lazy"
---@type LazySpec[]
return {
  {
    "hamidi-dev/org-list.nvim",
    dependencies = { "tpope/vim-repeat" },
    opts = {
      mapping = {
        key = "<leader>nX",
        desc = "Change List Type",
      },
      checkbox_toggle = {
        enabled = true,
        key = "<leader>nx",
        desc = "Toggle Checkbox",
        filetypes = { "markdown" },
      },
    },
  },
}
