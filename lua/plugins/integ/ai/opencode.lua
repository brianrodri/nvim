---@module "lazy"
---@type LazySpec
return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        provider = {
          enabled = "tmux",
          tmux = {},
        },
      }
      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
    keys = {
      {
        "<leader>aa",
        function() require("opencode").ask("@this: ", { submit = true }) end,
        desc = "Ask opencode…",
        mode = { "n", "x" },
      },
      {
        "<leader>aA",
        function() require("opencode").select() end,
        desc = "Execute opencode action…",
        mode = { "n", "x" },
      },
      {
        "<leader>at",
        function() require("opencode").toggle() end,
        desc = "Toggle opencode",
        mode = { "n", "t" },
      },
      {
        "<leader>ay",
        function() return require("opencode").operator("@this ") end,
        desc = "Add range to opencode",
        mode = { "n", "x" },
        expr = true,
      },
      {
        "<leader><C-u>",
        function() require("opencode").command("session.half.page.up") end,
        desc = "Scroll opencode up",
      },
      {
        "<leader><C-d>",
        function() require("opencode").command("session.half.page.down") end,
        desc = "Scroll opencode down",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "NickvanDyke/opencode.nvim" },
    opts = function(_, opts)
      local lualine_y = vim.tbl_get(opts, "sections", "lualine_y") or {}
      table.insert(lualine_y, 1, { require("opencode").statusline, padding = { left = 1, right = 2 } })
      return vim.tbl_deep_extend("force", opts or {}, { sections = { lualine_y = lualine_y } })
    end,
  },
}
