-- see :help normal-index to avoid conflict on mapping keybinding
-- and :help keycodes to see the meaning of symbol
-- https://www.reddit.com/r/vim/comments/6388fz/comment/dfs2s4o/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- see loaded vim or lua file by :scriptnames

local opts = { noremap=true, silent=true }

vim.g.mapleader = ","

-- not work properly
-- vim.api.nvim_set_keymap('n', 'za', '<Space>', opts) 

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

vim.keymap.set('n', '<Leader>qf', quickfix, opts)
vim.diagnostic.config({ virtual_text = false })

local function open_float()
	vim.diagnostic.open_float(nil)
end

vim.keymap.set('n', '<Leader>d', open_float, opts)

vim.opt.foldmethod = "indent"

local function goto()
	vim.diagnostic.goto_next(nil)
end

-- for goto file use gf or <C-]> (jump to a subject), goto link website use gx
vim.keymap.set('v', '<C-g>', goto, opts)

vim.keymap.set('v', '<C-y>', '"+y', opts)
vim.keymap.set('v', '<C-p>', '"+gP', opts)

vim.cmd('packadd nvim-cmp')

local cmp = require'cmp'
local lsp = require'lspconfig'
local snippet = require'luasnip'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
	snippet = {
		expand = function (args)
			snippet.lsp_expand(args.body)
		end
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' }
	}),
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<C-k>'] = cmp.mapping.scroll_docs(4),
		['<C-j>'] = cmp.mapping.scroll_docs(-4),
		['<CR>'] = cmp.mapping.confirm({ select = true })
	})
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- unlike clangd, emmet_ls seems not support omnifunc for the auto-completion, therefore we need to utilize it with nvim-cmp
lsp['emmet_ls'].setup {
	cmd = { 'emmet-ls', '--stdio' },
	filetypes = {
		"css",
		"html"
	},
	capabilities = capabilities,
}

lsp['clangd'].setup({
	filetypes = { 'c' },
	cmd = {'clangd'},
})
