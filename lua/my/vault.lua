local my_env = require("my.env")

return {
  inbox_note_path = vim.fs.joinpath("0 - Index", "Inbox.md"),
  root_dir = vim.fs.normalize(vim.fs.joinpath("~", "Documents", "Vault"), { win = my_env.wsl_mode }),
  daily_notes_dir = vim.fs.joinpath("1 - Journal", "Daily"),
  fleeting_notes_dir = vim.fs.joinpath("2 - Fleeting Notes"),
  attachments_dir = vim.fs.joinpath("8 - Meta", "Attachments"),
}
