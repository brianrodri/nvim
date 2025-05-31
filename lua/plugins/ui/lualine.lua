local function parrot_status()
  local status_info = require("parrot.config").get_status_info()
  local status
  if status_info.is_chat then
    status = status_info.prov.chat.name
  else
    status = status_info.prov.command.name
  end
  return string.format("%s(%s)", status, status_info.model)
end

---@module "lazy"
---@type LazySpec
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
    "folke/noice.nvim",
  },
  opts = {
    theme = "everforest",
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { parrot_status, "filetype" },
      lualine_y = { "location" },
      lualine_z = { "lsp_status" },
    },
  },
  opts_extend = {
    "sections.lualine_a",
    "sections.lualine_b",
    "sections.lualine_c",
    "sections.lualine_x",
    "sections.lualine_y",
    "sections.lualine_z",
  },
}
