local my_env = require("my.env")
local my_vault = require("my.vault")

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
    { "<leader>sc", function() require("snacks.picker").files({ dirs = { my_env.nvim_config_dir } }) end, desc = "Find Neovim Configs" },
    { "<leader>sC", function() require("mini.files").open(my_env.nvim_config_dir, true) end, desc = "Open Neovim Configs", icon = "󰙅 "  },
    { "<leader>sd", function() require("snacks.picker").files({ dirs = { my_env.dot_config_dir } }) end, desc = "Find Dot Configs" },
    { "<leader>sD", function() require("mini.files").open(my_env.dot_config_dir, true) end, desc = "Open Dot Configs", icon = "󰙅 "  },
    { "<leader>sf", function() require("snacks.picker").files() end, desc = "Find Files" },
    { "<leader>sg", function() require("snacks.picker").git_files() end, desc = "Find Git Files" },
    { "<leader>sh", function() require("snacks.picker").highlights() end, desc = "Find Highlights" },
    { "<leader>sk", function() require("snacks.picker").keymaps() end, desc = "Find Keymaps" },
    { "<leader>sl", function() require("snacks.picker").files({ dirs = { my_env.lazy_plugins_dir }, follow = true }) end, desc = "Find Lazy Plugins" },
    { "<leader>sL", function() require("mini.files").open(my_env.lazy_plugins_dir, true) end, desc = "Open Lazy Plugins", icon = "󰙅 "  },
    { "<leader>sm", function() require("snacks.picker").man() end, desc = "Find Man Pages" },
    { "<leader>sn", function() require("snacks.picker").files({ dirs = { my_vault.root_dir } }) end, desc = "Find Notes" },
    { "<leader>sN", function() require("mini.files").open(my_vault.root_dir, true) end, desc = "Open Vault", icon = "󰙅 " },
    { "<leader>sp", function() require("snacks.picker").projects() end, desc = "Find Projects" },
    { "<leader>sr", function() require("snacks.picker").recent({ filter = { cwd = true } }) end, desc = "Find Recents" },
    { "<leader>ss", function() require("snacks.picker").spelling() end, desc = "Find Spellings" },
  },
}
