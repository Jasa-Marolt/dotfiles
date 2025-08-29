local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
require('lspconfig').glslls.setup{}
vim.api.nvim_create_user_command(
  'Run',
  '!ninja -C build && ./build/main',
  {}
)

vim.api.nvim_set_keymap(
  'n',
  '<F5>',
  ':Run<CR>',
  { noremap = true, silent = true }
)
return {
  'neovim/nvim-lspconfig', -- Required to configure LSP servers
  'williamboman/mason.nvim', -- Installs and manages language servers
  'williamboman/mason-lspconfig.nvim', -- Bridges mason and nvim-lspconfig
  'hrsh7th/nvim-cmp', -- Autocompletion engine
  'hrsh7th/cmp-nvim-lsp', -- Autocompletion source for LSP
}
