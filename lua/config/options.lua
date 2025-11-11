--Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Make line numbers default
vim.opt.number = true

-- Disable wrap by default
vim.o.wrap = false

-- Use vibrant colors on dark backgrounds
vim.o.termguicolors = true
vim.o.background = "dark"

-- Take full advantage of conceal-levels to render rich text.
vim.o.conceallevel = 2

-- Enable mouse mode; useful for resizing splits.
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Save undo history
vim.opt.undofile = true

-- Don't use swap fiels, I trust undofile enough
vim.opt.swapfile = false

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.opt.confirm = true

-- Visualize text-width with a color column
vim.o.textwidth = 120
vim.o.colorcolumn = "+1"

-- Use 4 spaces for indentation by default
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Use treesitter folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevelstart = 99

-- https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments
vim.g.python3_host_prog = "~/.pyenv/versions/py3nvim/bin/python"

-- Required by opencode.nvim
vim.o.autoread = true
