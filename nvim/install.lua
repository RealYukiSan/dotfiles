-- install the dependencies plugin/package by :luafile install.lua
-- you need install some dependency manually: emmet_ls, clangd, lua-language-server
vim.cmd([[
packadd minpac

call minpac#init({ 'verbose': 4 })
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('neovim/nvim-lspconfig', {'do': '!make'})
call minpac#add('hrsh7th/nvim-cmp', { 'type': 'opt', 'do': '!make'})
call minpac#add('hrsh7th/cmp-nvim-lsp', {'do': '!make'})
call minpac#add('hrsh7th/cmp-buffer', {'do': '!make'})
call minpac#add('L3MON4D3/LuaSnip', {'do': '!make'})
call minpac#update()
]])
