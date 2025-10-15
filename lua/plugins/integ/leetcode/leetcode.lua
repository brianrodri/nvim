---@module "lazy"
---@type LazySpec
return {
  {
    "kawre/leetcode.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "MeanderingProgrammer/render-markdown.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ---@module "leetcode"
    ---@type lc.UserConfig|{}
    opts = {
      injector = {
        ["cpp"] = { imports = function() return require("my.leetcode-imports").cpp end },
      },
      lang = "cpp",
      theme = {
        easy_alt = { link = "VirtualTextHint" },
        medium_alt = { link = "VirtualTextWarning" },
        hard_alt = { link = "VirtualTextError" },

        easy = { link = "DiagnosticHint" },
        medium = { link = "DiagnosticWarn" },
        hard = { link = "DiagnosticError" },

        ok = { link = "DiagnosticHint" },
        info = { link = "DiagnosticInfo" },
        hint = { link = "DiagnosticOk" },
        error = { link = "DiagnosticError" },

        case_ok = { link = "DiagnosticHint" },
        case_err = { link = "DiagnosticError" },
        case_focus_ok = { link = "VirtualTextHint" },
        case_focus_err = { link = "VirtualTextError" },

        normal = { link = "Fg" },
        alt = { link = "Comment" },

        code = { link = "@markup.raw.markdown_inline" },
        example = { link = "@lsp.type.enum" },
        constraints = { link = "@markup.math" },
        header = { link = "@markup.heading" },
        followup = { link = "@markup.link" },

        indent = { link = "Whitespace" },
        link = { link = "@markup.link.label" },
        list = { link = "@markup.list" },
        ref = { link = "@markup.link.url" },
        su = {},
      },
    },
  },
}
