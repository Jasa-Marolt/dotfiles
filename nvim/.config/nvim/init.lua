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
local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')

require('lspconfig').clangd.setup({
  filetypes = { 'c', 'cpp' },
  cmd = {
    'clangd',
    '--compile-commands-dir=build', -- Tell clangd to look in the 'build' directory for compile_commands.json
    '--background-index'
  }
})
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


cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
})
return {
  'neovim/nvim-lspconfig', -- Required to configure LSP servers
  'williamboman/mason.nvim', -- Installs and manages language servers
  'williamboman/mason-lspconfig.nvim', -- Bridges mason and nvim-lspconfig
  'hrsh7th/nvim-cmp', -- Autocompletion engine
  'hrsh7th/cmp-nvim-lsp', -- Autocompletion source for LSP
  'clangd/clangd',
}
