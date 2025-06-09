local gitsigns_status_lualine_section = {
  "diff",
  source = function()
    local gitsigns = vim.b.gitsigns_status_dict
    return gitsigns and { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
  end,
}

---@module "lazy"
---@type LazySpec
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    ---@module "gitsigns.config"
    ---@type Gitsigns.Config|{}
    opts = {
      attach_to_untracked = true,
      watch_gitdir = { enable = true },
    },
    keys = {
      { "]g", function() require("gitsigns").nav_hunk("next") end, desc = "Jump To Next Hunk" },
      { "[g", function() require("gitsigns").nav_hunk("prev") end, desc = "Jump To Previous Hunk" },

      { "<leader>ga", function() require("gitsigns").stage_hunk() end, desc = "Stage Hunk" },
      { "<leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Reset Hunk" },
      { "<leader>gA", function() require("gitsigns").stage_buffer() end, desc = "Stage Buffer" },
      { "<leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Reset Buffer" },
      { "<leader>gK", function() require("gitsigns").preview_hunk() end, desc = "Preview Hunk" },
      { "<leader>gd", function() require("gitsigns").diffthis() end, desc = "Diff Against Index" },
      {
        "<leader>gD",
        function() require("gitsigns").diffthis("main") end,
        desc = "Diff Against Main",
      },
      {
        "<leader>gb",
        function() require("gitsigns").toggle_current_line_blame() end,
        desc = "Toggle Blame",
      },

      {
        "<leader>ga",
        function() require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        desc = "Stage Hunk",
        mode = "v",
      },
      {
        "<leader>gr",
        function() require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        desc = "Reset Hunk",
        mode = "v",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = { sections = { lualine_c = { "b:gitsigns_head", gitsigns_status_lualine_section } } },
    opts_extend = { "sections.lualine_c" },
  },
}
