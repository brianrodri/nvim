local my_paths = require("my.paths")

---@module "lazy"
---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    ---@module "snacks"
    ---@type snacks.Config
    opts = {
      picker = {
        show_empty = true,
        -- HINT: This is: `1 - (1 / GOLDEN_RATIO)`:
        layout = { preset = "ivy", layout = { height = 0.38196601 } },
      },
    },
    -- stylua: ignore
    -- luacheck: no max line length
    keys = {
      -- find
      { "<leader>fb", function() require("snacks.picker").buffers() end,                                              desc = "Buffers"                },
      { "<leader>fB", function() require("snacks.picker").buffers({ hidden = true, nofile = true }) end,              desc = "Buffers (incl. hidden)" },
      { "<leader>fc", function() require("snacks.picker").files({ dirs = { my_paths.nvim_config_dir } }) end,         desc = "Config Files (nvim)"    },
      { "<leader>fC", function() require("snacks.picker").files({ dirs = { my_paths.dot_config_dir } }) end,          desc = "Config Files (all)"     },
      { "<leader>ff", function() require("snacks.picker").files() end,                                                desc = "Files (Root Dir)"       },
      { "<leader>fF", function() require("snacks.picker").files({ root = false }) end,                                desc = "Files (cwd)"            },
      { "<leader>fg", function() require("snacks.picker").git_status() end,                                           desc = "Files (git status)"     },
      { "<leader>fG", function() require("snacks.picker").git_files() end,                                            desc = "Files (git)"            },
      { "<leader>fp", function() require("snacks.picker").projects() end,                                             desc = "Projects"               },
      { "<leader>fr", function() require("snacks.picker").recent({ filter = { cwd = true } }) end,                    desc = "Recent Files"           },
      -- Grep
      { "<leader>sb", function() require("snacks.picker").lines() end,                                                desc = "Grep Buffer"            },
      { "<leader>sB", function() require("snacks.picker").grep_buffers() end,                                         desc = "Grep All Buffers"       },
      { "<leader>sg", function() require("snacks.picker").grep() end,                                                 desc = "Grep (Root Dir)"        },
      { "<leader>sG", function() require("snacks.picker").grep({ root = false }) end,                                 desc = "Grep (cwd)"             },
      { "<leader>sp", function() require("snacks.picker").files({ dirs = { my_paths.lazy_plugins_dir } }) end,        desc = "Plugin Files (lazy)"    },
      -- search
      { '<leader>s"', function() require("snacks.picker").registers() end,                                            desc = "Registers"              },
      { "<leader>s.", function() require("snacks.picker").resume() end,                                               desc = "Resume"                 },
      { "<leader>s/", function() require("snacks.picker").search_history() end,                                       desc = "History"                },
      { "<leader>s?", function() require("snacks.picker").help() end,                                                 desc = "Help Pages"             },
      { "<leader>sa", function() require("snacks.picker").autocmds() end,                                             desc = "Autocmds"               },
      { "<leader>sc", function() require("snacks.picker").command_history() end,                                      desc = "Command History"        },
      { "<leader>sC", function() require("snacks.picker").commands() end,                                             desc = "Commands"               },
      { "<leader>sD", function() require("snacks.picker").diagnostics_buffer() end,                                   desc = "Buffer Diagnostics"     },
      { "<leader>sd", function() require("snacks.picker").diagnostics() end,                                          desc = "Diagnostics"            },
      { "<leader>sh", function() require("snacks.picker").highlights() end,                                           desc = "Highlights"             },
      { "<leader>si", function() require("snacks.picker").icons() end,                                                desc = "Icons"                  },
      { "<leader>sj", function() require("snacks.picker").jumps() end,                                                desc = "Jumps"                  },
      { "<leader>sk", function() require("snacks.picker").keymaps() end,                                              desc = "Keymaps"                },
      { "<leader>sl", function() require("snacks.picker").loclist() end,                                              desc = "Location List"          },
      { "<leader>sm", function() require("snacks.picker").man() end,                                                  desc = "Man Pages"              },
      { "<leader>sM", function() require("snacks.picker").marks() end,                                                desc = "Marks"                  },
      { "<leader>so", function() require("snacks.picker").pickers() end,                                              desc = "Pickers"                },
      { "<leader>sq", function() require("snacks.picker").qflist() end,                                               desc = "Quickfix List"          },
      { "<leader>ss", function() require("snacks.picker").spelling() end,                                             desc = "Spell Check"            },
      { "<leader>su", function() require("snacks.picker").undo() end,                                                 desc = "Undo Tree"              },
      { "<leader>sv", function() require("snacks.picker").files({ dirs = { my_paths.personal_vault.root_dir } }) end, desc = "Obsidian Vault"         },
    },
  },
}
