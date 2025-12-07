---@module "lazy"
---@type LazySpec
return {
  { -- A Git wrapper so good it should be illegal.
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gc", "<cmd>Git commit | startinsert<cr>", desc = "Commit" },
      { "<leader>gp", "<cmd>Git push<cr>", desc = "Push" },
      { "<leader>gl", "<cmd>Git pull<cr>", desc = "Pull" },
      { "<leader>gs", "<cmd>Git<cr>", desc = "Pull" },
    },
  },
}
