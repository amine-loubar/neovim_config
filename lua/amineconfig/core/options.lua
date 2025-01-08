-- Set mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General settings
vim.wo.number = true
vim.o.encoding = "utf-8"
vim.o.arabicshape = true
vim.o.termbidi = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.clipboard = "unnamed"
vim.o.expandtab = true


-- Map yanking to the clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- Map pasting from the clipboard
vim.api.nvim_set_keymap("n", "<leader>p", '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"+p', { noremap = true, silent = true })


-- Auto close
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true, silent = true })

-- Save with Ctrl+S
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })