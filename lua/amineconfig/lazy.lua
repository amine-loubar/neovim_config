-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("config") .. "/lazy/lazy.nvim"  -- Install path to .config/nvim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with plugins
require("lazy").setup({
  { import = "amineconfig.plugins" },
  { import = "amineconfig.plugins.lsp" }
}, 
{
  install = {
      colorscheme = { "tokyonight" },
  },
  checker = {
      enabled = true,
      notify = false,
  },
  change_detection = {
      notify = false,
  },
})


-- Ensure plugins are installed automatically if missing
if not vim.fn.isdirectory(vim.fn.stdpath("config") .. "/lazy") then
  vim.cmd("Lazy install")
end