local WSL_MODE = vim.fn.has("wsl") == 1

local nvim_config = assert(vim.uv.fs_realpath(vim.fn.stdpath("config")))
local dot_configs = assert(vim.uv.fs_realpath(vim.fs.normalize("~/Repositories/config", { win = WSL_MODE })))
local lazy_plugins = assert(vim.uv.fs_realpath(vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")))
local nvim_config_plugins = assert(vim.uv.fs_realpath(vim.fs.joinpath(nvim_config, "lua", "plugins")))

return {
  nvim_config_dir = nvim_config,
  nvim_config_plugins_dir = nvim_config_plugins,
  dot_config_dir = dot_configs,
  lazy_plugins_dir = lazy_plugins,

  personal_vault = {
    root_dir = assert(vim.uv.fs_realpath(vim.fs.normalize("~/Documents/Vault", { win = WSL_MODE }))),
    inbox_note_path = "0 - Index/Inbox.md",
    daily_notes_dir = "1 - Journal/Daily",
    fleeting_notes_dir = "2 - Fleeting Notes",
    attachments_dir = "8 - Meta/Attachments",
  },
}
