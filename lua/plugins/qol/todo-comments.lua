---@module "lazy"
---@type LazySpec
return {
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",

    dependencies = { "folke/trouble.nvim", "nvim-lua/plenary.nvim" },

    ---@module "todo-comments"
    ---@type TodoOptions|{}
    opts = {
      signs = false,
      -- stylua: ignore
      colors = {
        NOTE     = "RenderMarkdownTodo",
        ABSTRACT = "RenderMarkdownInfo",
        INFO     = "RenderMarkdownTodo",
        TODO     = "RenderMarkdownTodo",
        TIP      = "RenderMarkdownInfo",
        SUCCESS  = "RenderMarkdownSuccess",
        QUESTION = "RenderMarkdownWarn",
        WARNING  = "RenderMarkdownWarn",
        FAILURE  = "RenderMarkdownError",
        DANGER   = "RenderMarkdownError",
        BUG      = "RenderMarkdownError",
        EXAMPLE  = "RenderMarkdownHint",
        QUOTE    = "RenderMarkdownQuote",
        TEST     = "RenderMarkdownInfo",
        PERF     = "RenderMarkdownInfo",
      },
      --- Inspired by <https://help.obsidian.md/callouts#Supported+types>
      -- stylua: ignore
      keywords = {
        NOTE     = { icon = "󰲶", color = "NOTE"                                                   },
        ABSTRACT = { icon = "󰨸", color = "ABSTRACT", alt = { "SUMMARY", "TLDR" }                  },
        INFO     = { icon = "󰋽", color = "INFO"                                                   },
        TODO     = { icon = "󰗡", color = "TODO"                                                   },
        TIP      = { icon = "󰈸", color = "TIP",      alt = { "HINT", "IMPORTANT" }                },
        SUCCESS  = { icon = "󰄬", color = "SUCCESS",  alt = { "CHECK", "DONE" }                    },
        QUESTION = { icon = "󰘥", color = "QUESTION", alt = { "HELP", "FAQ" }                      },
        WARNING  = { icon = "󰀪", color = "WARNING",  alt = { "CAUTION", "ATTENTION", "WARN" }     },
        FAILURE  = { icon = "󰅖", color = "FAILURE",  alt = { "FAIL", "MISSING" }                  },
        DANGER   = { icon = "󱐌", color = "DANGER",   alt = { "ERROR", "HACK", "XXX" }             },
        BUG      = { icon = "󰨰", color = "BUG",      alt = { "FIX", "FIXIT", "FIXME", "ISSUE" }   },
        EXAMPLE  = { icon = "󰉹", color = "EXAMPLE"                                                },
        QUOTE    = { icon = "󱆨", color = "QUOTE",    alt = { "CITE" }                             },
        TEST     = { icon = "󰂖", color = "TEST",     alt = { "FAILED", "PASSED", "TESTING" }      },
        PERF     = { icon = "󰅒", color = "PERF",     alt = { "OPTIM", "OPTIMIZE", "PERFORMANCE" } },
      },
      merge_keywords = false,
      highlight = {
        comments_only = true,
        pattern = { [[.* (KEYWORDS)\s*:]], [[\v ((KEYWORDS)\([^\)]*\)):]] },
      },
      search = {
        pattern = [[\b(KEYWORDS)[\(:]\s*]],
      },
    },
    -- stylua: ignore
    -- luacheck: no max line length
    keys = {
      { "<leader>xt", "<cmd>Trouble todo toggle filter = { tag = { DANGER, BUG, PERF, TODO } }<cr>", desc = "Todo (danger/bug/perf/todo)" },
      { "<leader>xT", "<cmd>Trouble todo toggle<cr>", desc = "Todo (all)" },
    },
  },
}
