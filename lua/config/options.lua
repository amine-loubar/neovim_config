vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- General settings
vim.wo.number = true
vim.o.encoding = "utf-8"
vim.o.arabicshape = true
vim.o.termbidi = true
vim.opt.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.clipboard = "unnamed"
vim.opt.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.opt.cursorline = false

-- Prevent line highlighting
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function() vim.cmd [[highlight clear CursorLine]] end,
})
