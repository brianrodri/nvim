---@module "lazy"
---@type LazySpec
return {
  "folke/which-key.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  ---@module "which-key"
  ---@class wk.Opts
  opts = {
    -- stylua: ignore
    spec = {
      -- Groups
      { "<leader>a", group = "ai",       icon = { icon = "󰚩 ", color = "grey"   } },
      { "<leader>b", group = "buffer",   icon = { icon = "󰈔 ", color = "purple" } },
      { "<leader>c", group = "code",     icon = { icon = "󱌢 ", color = "cyan"   } },
      { "<leader>d", group = "debug",    icon = { icon = " ", color = "cyan"   } },
      { "<leader>f", group = "find",     icon = { icon = "󰥨 ", color = "purple" } },
      { "<leader>g", group = "git",      icon = { icon = " ", color = "grey"   } },
      { "<leader>l", group = "lazy",     icon = { icon = "󰒲 ", color = "blue"   } },
      { "<leader>n", group = "notes",    icon = { icon = "󰠮 ", color = "purple" } },
      { "<leader>o", group = "toggle",   icon = { icon = " ", color = "orange" } },
      { "<leader>p", group = "project",  icon = { icon = " ", color = "purple" } },
      { "<leader>q", group = "quit",     icon = { icon = "󰈆 ", color = "red"    } },
      { "<leader>r", group = "refactor", icon = { icon = "󰛔 ", color = "cyan"   } },
      { "<leader>s", group = "search",   icon = { icon = "󱎸 ", color = "purple" } },
      { "<leader>t", group = "test",     icon = { icon = "󰙨 ", color = "green"  } },
      { "<leader>x", group = "trouble",  icon = { icon = "󱍼 ", color = "red"    } },

      -- Hidden keymaps
      { "<leader><C-h>", ":leftabove vsplit<CR>", hidden = true },
      { "<leader><C-j>", ":rightbelow split<CR>", hidden = true },
      { "<leader><C-k>", ":leftabove split<CR>", hidden = true },
      { "<leader><C-l>", ":rightbelow vsplit<CR>", hidden = true },
    },
    keys = {
      scroll_down = "<c-n>",
      scroll_up = "<c-p>",
    },
  },
}
