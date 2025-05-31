local my_lsp_keymaps = require("my.lsp_keymaps")

---@type string[]
--- File types that can be closed by pressing "q" in normal mode.
local CLOSE_WITH_Q = {
  "PlenaryTestPopup",
  "checkhealth",
  "dbout",
  "gitsigns-blame",
  "grug-far",
  "help",
  "lspinfo",
  "neotest-output",
  "neotest-output-panel",
  "neotest-summary",
  "notify",
  "qf",
  "spectre_panel",
  "startuptime",
  "tsplayground",
}

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = CLOSE_WITH_Q,
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      local close_buffer = function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end
      vim.keymap.set("n", "q", close_buffer, { buffer = event.buf, silent = true, desc = "Close Buffer" })
    end)
  end,
})

-- Make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("man_unlisted", { clear = true }),
  pattern = { "man" },
  callback = function(event) vim.bo[event.buf].buflisted = false end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  desc = "Highlight when yanking text",
  callback = function() vim.highlight.on_yank() end,
})

-- Assign keymaps on LSP attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-keymaps", { clear = true }),
  callback = function(args)
    require("which-key").add(
      vim.tbl_map(function(spec) return vim.tbl_extend("keep", { buffer = args.buf }, spec) end, my_lsp_keymaps)
    )
  end,
})

-- Automatically format on-write
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("lint", { clear = true }),
  callback = function()
    local ok, lint = pcall(require, "lint")
    if ok and vim.opt_local.modifiable:get() then lint.try_lint() end
  end,
})

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
