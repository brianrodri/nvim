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
      { "<leader>a", group = "ai",       icon = "󰚩 " },
      { "<leader>b", group = "buffer",   icon = "󰈔 " },
      { "<leader>c", group = "code",     icon = " " },
      { "<leader>d", group = "debug",    icon = "󰃤 " },
      { "<leader>f", group = "find",     icon = "󰥨 " },
      { "<leader>g", group = "git",      icon = " " },
      { "<leader>l", group = "lazy",     icon = "󰒲 " },
      { "<leader>n", group = "notes",    icon = "󰠮 " },
      { "<leader>o", group = "toggle",   icon = " " },
      { "<leader>p", group = "project",  icon = " " },
      { "<leader>q", group = "quit",     icon = "󰈆 " },
      { "<leader>r", group = "refactor", icon = "󰛔 " },
      { "<leader>s", group = "search",   icon = "󱎸 " },
      { "<leader>t", group = "test",     icon = "󰙨 " },
      { "<leader>x", group = "trouble",  icon = "󱍼 " },

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
