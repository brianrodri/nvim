---@module "lazy"
---@type LazySpec
return {
  "ziontee113/icon-picker.nvim",
  opts = { disable_legacy_commands = true },
  keys = {
    { "<leader>si", "<cmd>IconPickerYank<cr>", desc = "Search Icons" },
  },
}
