---@module "lazy"
---@type LazySpec
return {
  {
    "obsidian-nvim/obsidian.nvim",
    dependencies = { "MeanderingProgrammer/render-markdown.nvim" },
    ---@module "obsidian"
    ---@type obsidian.config.ClientOpts|{}
    opts = {
      -- :help render-markdown-info-obsidian.nvim
      ui = { enable = false },
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- https://github.com/obsidian-nvim/obsidian.nvim/wiki/Keymaps#remove-default-mapping
      vim.api.nvim_create_autocmd("User", {
        pattern = "ObsidianNoteEnter",
        callback = function(ev) vim.keymap.del("n", "<CR>", { buffer = ev.buf }) end,
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
      preset = "obsidian",
      -- https://help.obsidian.md/Editing+and+formatting/Callouts
      callout = {
        abstract = {
          raw = "[!ABSTRACT]",
          rendered = "󱞏 Abstract",
          highlight = "RenderMarkdownInfo",
          category = "obsidian",
        },
        summary = {
          raw = "[!SUMMARY]",
          rendered = "󱞏 Summary",
          highlight = "RenderMarkdownInfo",
          category = "obsidian",
        },
        tldr = {
          raw = "[!TLDR]",
          rendered = "󱞏 Tldr",
          highlight = "RenderMarkdownInfo",
          category = "obsidian",
        },
        info = {
          raw = "[!INFO]",
          rendered = "󰋽 Info",
          highlight = "RenderMarkdownInfo",
          category = "obsidian",
        },
        todo = {
          raw = "[!TODO]",
          rendered = "󰝖 Todo",
          highlight = "RenderMarkdownTodo",
          category = "obsidian",
        },
        hint = {
          raw = "[!HINT]",
          rendered = "󰌶 Hint",
          highlight = "RenderMarkdownHint",
          category = "obsidian",
        },
        success = {
          raw = "[!SUCCESS]",
          rendered = "󰡕 Success",
          highlight = "RenderMarkdownSuccess",
          category = "obsidian",
        },
        check = {
          raw = "[!CHECK]",
          rendered = "󰡕 Check",
          highlight = "RenderMarkdownSuccess",
          category = "obsidian",
        },
        done = {
          raw = "[!DONE]",
          rendered = "󰡕 Done",
          highlight = "RenderMarkdownSuccess",
          category = "obsidian",
        },
        question = {
          raw = "[!QUESTION]",
          rendered = "󰘥 Question",
          highlight = "RenderMarkdownWarn",
          category = "obsidian",
        },
        help = {
          raw = "[!HELP]",
          rendered = "󰘥 Help",
          highlight = "RenderMarkdownWarn",
          category = "obsidian",
        },
        faq = {
          raw = "[!FAQ]",
          rendered = "󰘥 Faq",
          highlight = "RenderMarkdownWarn",
          category = "obsidian",
        },
        attention = {
          raw = "[!ATTENTION]",
          rendered = "󰀪 Attention",
          highlight = "RenderMarkdownWarn",
          category = "obsidian",
        },
        failure = {
          raw = "[!FAILURE]",
          rendered = "󰛉 Failure",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        fail = {
          raw = "[!FAIL]",
          rendered = "󰛉 Fail",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        missing = {
          raw = "[!MISSING]",
          rendered = "󰛉 Missing",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        danger = {
          raw = "[!DANGER]",
          rendered = "󱐌 Danger",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        error = {
          raw = "[!ERROR]",
          rendered = "󱐌 Error",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        bug = {
          raw = "[!BUG]",
          rendered = "󰨰 Bug",
          highlight = "RenderMarkdownError",
          category = "obsidian",
        },
        example = {
          raw = "[!EXAMPLE]",
          rendered = "󰉹 Example",
          highlight = "RenderMarkdownHint",
          category = "obsidian",
        },
        quote = {
          raw = "[!QUOTE]",
          rendered = "󱆧 Quote",
          highlight = "RenderMarkdownQuote",
          category = "obsidian",
        },
        cite = {
          raw = "[!CITE]",
          rendered = "󱆧 Cite",
          highlight = "RenderMarkdownQuote",
          category = "obsidian",
        },
      },
      checkbox = {
        -- https://publish.obsidian.md/tasks/Reference/Status+Collections/Minimal+Theme#Supported+statuses
        custom = {
          bookmark = {
            raw = "[b]",
            rendered = "󱖮 ",
            highlight = "RenderMarkdownInfo",
          },
          canceled = {
            raw = "[-]",
            rendered = "󱋬 ",
            highlight = "RenderMarkdownDash",
            scope_highlight = "RenderMarkdownDash",
          },
          cons = {
            raw = "[c]",
            rendered = "󰔑 ",
            highlight = "RenderMarkdownError",
          },
          down = {
            raw = "[d]",
            rendered = "󰔳 ",
            highlight = "RenderMarkdownError",
          },
          fire = {
            raw = "[f]",
            rendered = "󰈸 ",
            highlight = "RenderMarkdownInfo",
          },
          forwarded = {
            raw = "[>]",
            rendered = "󰒊 ",
            highlight = "RenderMarkdownHint",
          },
          hint = {
            raw = "[h]",
            rendered = "󰌶 ",
            highlight = "RenderMarkdownHint",
          },
          idea = {
            raw = "[i]",
            rendered = "󰛨 ",
            highlight = "RenderMarkdownWarn",
          },
          important = {
            raw = "[!]",
            rendered = "󰅽 ",
            highlight = "RenderMarkdownWarn",
          },
          incomplete = {
            raw = "[/]",
            rendered = "󰆄 ",
            highlight = "RenderMarkdownUnchecked",
          },
          key = {
            raw = "[k]",
            rendered = "󰌆 ",
            highlight = "RenderMarkdownWarn",
          },
          location = {
            raw = "[l]",
            rendered = "󰍎 ",
            highlight = "RenderMarkdownError",
          },
          pros = {
            raw = "[p]",
            rendered = "󰔓 ",
            highlight = "RenderMarkdownSuccess",
          },
          question = {
            raw = "[?]",
            rendered = "󰠗 ",
            highlight = "RenderMarkdownWarn",
          },
          quote = {
            raw = '["]',
            rendered = "󱀡 ",
            highlight = "RenderMarkdownQuote",
          },
          savings = {
            raw = "[S]",
            rendered = "󱀇 ",
            highlight = "RenderMarkdownInfo",
          },
          scheduling = {
            raw = "[<]",
            rendered = "󰬥 ",
            highlight = "RenderMarkdownHint",
          },
          star = {
            raw = "[*]",
            rendered = "󰓎 ",
            highlight = "RenderMarkdownWarn",
          },
          up = {
            raw = "[u]",
            rendered = "󰔵 ",
            highlight = "RenderMarkdownSuccess",
          },
          win = {
            raw = "[w]",
            rendered = "󰔸 ",
            highlight = "RenderMarkdownWarn",
          },
        },
      },
    },
    ---@module "render-markdown"
    ---@param opts render.md.UserConfig|?
    config = function(_, opts)
      if opts and opts.checkbox and opts.checkbox.custom and opts.checkbox.custom.todo then
        opts.checkbox.custom.todo = nil
      end
      require("render-markdown").setup(opts)
    end,
  },
}
