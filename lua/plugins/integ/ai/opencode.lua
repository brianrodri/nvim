---@module "lazy"
---@type LazySpec
return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    -- stylua: ignore
    -- luacheck: no max line length
    keys = {
      { "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "Ask opencode" },
      { "<leader>a!", function() require("opencode").select() end,                          mode = { "n", "x" }, desc = "Execute opencode action…" },
      { "<leader>a.", function() require("opencode").prompt("@this") end,                   mode = { "n", "x" }, desc = "Add to opencode" },
      { "<leader>aA", function() require("opencode").toggle() end,                          mode = { "n", "t" }, desc = "Toggle opencode" },
      { "<leader>ak", function() require("opencode").command("session.half.page.up") end,   mode = "n",          desc = "opencode half page up" },
      { "<leader>aj", function() require("opencode").command("session.half.page.down") end, mode = "n",          desc = "opencode half page down" },
    },
  },
}
