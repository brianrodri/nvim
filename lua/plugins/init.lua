local Utils = require("my.utils")

return vim
  .iter(vim.fs.dir(vim.fs.dirname(Utils.get_script_path())))
  :map(function(name, type) return type == "directory" and { import = "plugins." .. name } or nil end)
  :totable()
