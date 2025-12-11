---@module "lazy"
---@type LazySpec
return {
  {
    "polarmutex/git-worktree.nvim",
    -- commit = "eb2d9c2d8ac9b776b043d87a9bc5bd9a6cd9adc2",
    dir = "~/Repositories/git-worktree.nvim",
    keys = {
      { "<leader>gw", function() require("snacks-worktree").create_worktree() end, desc = "Create Git Worktree" },
      { "<leader>sw", function() require("snacks-worktree").pick_git_worktree() end, desc = "Pick Git Worktree" },
    },
  },
}
