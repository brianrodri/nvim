-- Clear Search Highlighting
vim.keymap.set("n", "<esc>", ":nohlsearch<cr>", { silent = true })

-- Buffer controls
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Lazy controls
vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>qw", "<cmd>wa | qa<cr>", { desc = "Quit & Save All" })

-- Split controls
vim.keymap.set("n", "<leader><C-h>", ":leftabove vsplit<CR>", { desc = "Split Left" })
vim.keymap.set("n", "<leader><C-j>", ":rightbelow split<CR>", { desc = "Split Bottom" })
vim.keymap.set("n", "<leader><C-k>", ":leftabove split<CR>", { desc = "Split Top" })
vim.keymap.set("n", "<leader><C-l>", ":rightbelow vsplit<CR>", { desc = "Split Right" })

-- Language-agnostic LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp.keymaps", { clear = true }),
  callback = function(ev)
    vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename Symbol", buffer = ev.buf })
    vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", buffer = ev.buf })
  end,
})
