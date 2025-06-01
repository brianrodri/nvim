local my_vaults = require("my.vaults")

local config_dir = vim.fn.stdpath("config")
local plugin_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")

return {
  ---@module "snacks"
  ---@type snacks.picker.Config
  config = {
    enabled = true,
    win = {
      input = {
        keys = {
          -- Close picker on ESC immediately, rather than needing a second press after entering normal mode.
          ["<esc>"] = { "close", mode = { "n", "i" } },
        },
      },
    },
  },

  -- stylua: ignore
  -- luacheck: no max line length
  ---@module "which-key"
  ---@type wk.Spec[]
  keymaps = {
    { "<leader>s:", function() require("snacks.picker").commands() end, desc = "Find Commands" },
    { "<leader>s?", function() require("snacks.picker").help() end, desc = "Find Help Docs" },
    { "<leader>s.", function() require("snacks.picker").resume() end, desc = "Resume Finding" },
    { "<leader>s*", function() require("snacks.picker").grep_word() end, desc = "Find Word Under Cursor" },
    { "<leader>s/", function() require("snacks.picker").grep() end, desc = "Grep Lines" },
    { "<leader>sa", function() require("snacks.picker").pickers() end, desc = "All Pickers" },
    { "<leader>sb", function() require("snacks.picker").buffers() end, desc = "Find Buffers" },
    { "<leader>sc", function() require("snacks.picker").files({ cwd = config_dir }) end, desc = "Find Configs" },
    { "<leader>sf", function() require("snacks.picker").files() end, desc = "Find Files" },
    { "<leader>sg", function() require("snacks.picker").git_files() end, desc = "Find Git Files" },
    { "<leader>sh", function() require("snacks.picker").highlights() end, desc = "Find Highlights" },
    { "<leader>sk", function() require("snacks.picker").keymaps() end, desc = "Find Keymaps" },
    { "<leader>sl", function() require("snacks.picker").files({ cwd = plugin_dir, follow = true }) end, desc = "Find Plugins" },
    { "<leader>sn", function() require("snacks.picker").files({ cwd = my_vaults.vault_root }) end, desc = "Find Notes" },
    { "<leader>sp", function() require("snacks.picker").projects() end, desc = "Find Projects" },
    { "<leader>sr", function() require("snacks.picker").recent({ cwd_only = true, follow = true }) end, desc = "Find Recents" },
    { "<leader>ss", function() require("snacks.picker").spelling() end, desc = "Find Spellings" },
  },
}
