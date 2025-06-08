local my_todo_comments = require("my.todo_comments")

---@module "lazy"
---@type LazySpec
return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  ---@module "todo-comments"
  ---@type TodoOptions|{}
  opts = {
    signs = false,
    colors = my_todo_comments.colors,
    keywords = my_todo_comments.keywords,
    merge_keywords = false,
    highlight = { pattern = { [[.*<(KEYWORDS):]], [[.*<(KEYWORDS)\(.*\):]] } },
    search = { pattern = "\\s(KEYWORDS)[:\\(]" },
  },
  -- stylua: ignore
  -- luacheck: no max line length
  keys = {
    { "<leader>xt", "<cmd>Trouble todo toggle filter = { tag = { DANGER, BUG, PERF, TODO } }<cr>", desc = "Todo (danger/bug/perf/todo)" },
    { "<leader>xT", "<cmd>Trouble todo toggle<cr>", desc = "Todo (all)" },
  }
,
}
