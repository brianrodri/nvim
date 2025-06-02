return {
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

  colors = {
    NOTE = "RenderMarkdownInfo",
    ABSTRACT = "RenderMarkdownSuccess",
    INFO = "RenderMarkdownInfo",
    TODO = "RenderMarkdownInfo",
    TIP = "RenderMarkdownSuccess",
    SUCCESS = "RenderMarkdownHint",
    QUESTION = "RenderMarkdownWarn",
    WARNING = "RenderMarkdownWarn",
    FAILURE = "RenderMarkdownError",
    DANGER = "RenderMarkdownError",
    BUG = "RenderMarkdownError",
    EXAMPLE = "Purple",
    QUOTE = "RenderMarkdownQuote",
    TEST = "RenderMarkdownSuccess",
    PERF = "RenderMarkdownSuccess",
  },
}
