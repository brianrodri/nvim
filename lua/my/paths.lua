local has_wsl = vim.fn.has("wsl") == 1

local function resolve_path(path) return assert(vim.uv.fs_realpath(tostring(path))) end

return {
  nvim_config_dir = resolve_path(vim.fn.stdpath("config")),
  nvim_config_plugins_dir = resolve_path(vim.fs.joinpath(vim.fn.stdpath("config"), "lua", "plugins")),
  dot_config_dir = resolve_path(vim.fs.normalize("~/Repositories/config", { win = has_wsl })),
  lazy_plugins_dir = resolve_path(vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")),

  personal_vault = {
    root_dir = resolve_path(vim.fs.normalize("~/Documents/Vault", { win = has_wsl })),
    inbox_note_path = "0 - Index/Inbox.md",
    daily_notes_dir = "1 - Journal/Daily",
    fleeting_notes_dir = "2 - Fleeting Notes",
    attachments_dir = "8 - Meta/Attachments",
  },
}
