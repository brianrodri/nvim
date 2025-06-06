local wsl_mode = vim.fn.has("wsl") == 1

local nvim_config, nvim_config_err = vim.uv.fs_realpath(vim.fn.stdpath("config"))
local dot_configs, dot_configs_err = vim.uv.fs_realpath(vim.fs.normalize("~/Repositories/config", { win = wsl_mode }))
local lazy_plugins, lazy_plugins_err = vim.uv.fs_realpath(vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"))
local nvim_config_plugins, nvim_config_plugins_err =
  nvim_config and vim.fs.joinpath(nvim_config, "lua", "plugins") or nvim_config, nvim_config_err

if not nvim_config then vim.notify(nvim_config_err, vim.log.levels.WARN) end
if not nvim_config_plugins and nvim_config then vim.notify(nvim_config_plugins_err, vim.log.levels.WARN) end
if not dot_configs then vim.notify(dot_configs_err, vim.log.levels.WARN) end
if not lazy_plugins then vim.notify(lazy_plugins_err, vim.log.levels.WARN) end

return {
  wsl_mode = wsl_mode,
  nvim_config_dir = nvim_config,
  nvim_config_plugins_dir = nvim_config_plugins,
  dot_config_dir = dot_configs,
  lazy_plugins_dir = lazy_plugins,
}
