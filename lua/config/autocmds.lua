-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "man",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", function()
      vim.cmd.close()
      pcall(vim.api.nvim_buf_delete, event.buf, { force = true, unload = true })
    end, { buffer = event.buf, silent = true, desc = "Close" })
  end,
})

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  desc = "Highlight when yanking text",
  callback = vim.hl.on_yank,
})

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp.foldexpr", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end
  end,
})
