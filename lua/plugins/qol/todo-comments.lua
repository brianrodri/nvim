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
    -- NOTE: Adapted from https://help.obsidian.md/callouts#Supported+types
    keywords = {
      NOTE = { icon = "󰲶 ", color = "note" },
      ABSTRACT = { icon = "󰨸 ", color = "abstract", alt = { "SUMMARY", "TLDR" } },
      INFO = { icon = "󰋽 ", color = "info" },
      TODO = { icon = "󰗡 ", color = "todo" },
      TIP = { icon = "󰈸 ", color = "tip", alt = { "HINT", "IMPORTANT" } },
      SUCCESS = { icon = "󰄬 ", color = "success", alt = { "CHECK", "DONE", "PASSED" } },
      QUESTION = { icon = "󰘥 ", color = "question", alt = { "HELP", "FAQ" } },
      WARNING = { icon = "󰀪 ", color = "warning", alt = { "ATTENTION", "CAUTION", "WARN" } },
      FAILURE = { icon = "󰅖 ", color = "failure", alt = { "FAIL", "FAILED", "MISSING" } },
      DANGER = { icon = "󱐌 ", color = "danger", alt = { "ERROR", "HACK" } },
      BUG = { icon = "󰨰 ", color = "bug", alt = { "FIX", "FIXME", "FIXIT", "ISSUE" } },
      EXAMPLE = { icon = "󰉹 ", color = "example" },
      QUOTE = { icon = "󱆨 ", color = "quote" },
      TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING" } },
      PERF = { icon = "󰅒 ", color = "perf", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    },
    colors = {
      note = { "RenderMarkdownInfo" },
      abstract = { "RenderMarkdownHint" },
      info = { "RenderMarkdownInfo" },
      todo = { "RenderMarkdownInfo" },
      tip = { "RenderMarkdownHint" },
      success = { "RenderMarkdownChecked" },
      question = { "RenderMarkdownWarn" },
      warning = { "RenderMarkdownWarn" },
      failure = { "RenderMarkdownError" },
      danger = { "RenderMarkdownError" },
      bug = { "RenderMarkdownError" },
      example = { "@annotation" },
      quote = { "RenderMarkdownQuote" },
      test = { "RenderMarkdownSuccess" },
      perf = { "RenderMarkdownSuccess" },
    },
    highlight = { pattern = { [[.*<(KEYWORDS):]], [[.*<(KEYWORDS)\(.*\):]] } },
    search = { pattern = "\\s(KEYWORDS)[:\\(]" },
  },
}
