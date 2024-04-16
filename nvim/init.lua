--[[ Useful note:
see :help normal-index to avoid conflict on mapping keybinding
and :help keycodes to see the meaning of symbol
- https://www.reddit.com/r/vim/comments/6388fz/comment/dfs2s4o
- https://t.me/VimID/1/50506

see loaded vim or lua file by :scriptnames

7 sets of mapping, see :help map and :help index for table of contents
also include EX commands table which is sorted alphabetically

open :h jargon to see general terms, :h tabpage also related
--]]

local opts = { noremap=true, silent=true }

vim.opt.gp = "git grep -n"
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

-- for goto file use gf or <C-]>
-- (jump to a subject, also handy for navigating on :Man)
-- and for goto link website use gx
vim.keymap.set('n', '<C-g>', goto, opts)

vim.keymap.set('v', '<C-y>', '"+y', opts)
vim.keymap.set('v', '<C-p>', '"+gP', opts)

vim.cmd('packadd nvim-cmp')
vim.cmd('set path+=**')

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
		['<C-b>'] = cmp.mapping.scroll_docs(4),
		['<C-f>'] = cmp.mapping.scroll_docs(-4),
		['<CR>'] = cmp.mapping.confirm({ select = true })
	})
})

vim.keymap.set({"i"}, "<C-K>", function() snippet.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() snippet.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() snippet.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if snippet.choice_active() then
		snippet.change_choice(1)
	end
end, {silent = true})

--[[ see issue terminal emulator and nvim-cmp on https://t.me/VimID/1/50531
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
--]]

-- unlike clangd, emmet_ls seems not support omnifunc for the auto-completion, therefore we need to utilize it with nvim-cmp
lsp['emmet_ls'].setup {
	cmd = { 'emmet-ls', '--stdio' },
	filetypes = {
		"css",
		"php",
		"html"
	},
	capabilities = capabilities,
}

local runtime_path = vim.split(package.path, ";")
runtime_path[#runtime_path + 1] = "?.lua"

lsp['lua_ls'].setup {
	cmd = { 'lua-language-server' },
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			format = { enable = false },
			hint = { enable = true, setType = true },
			runtime = {
				path = runtime_path,
				version = "LuaJIT",
			},
			telemetery = { enable = false },
			workspace = {
				library = vim.api.nvim_get_runtime_file("lua", true),
				preloadFileSize = 1000,
			}
		},
	},
}

lsp['clangd'].setup({
	filetypes = { 'c', 'h' },
	cmd = {'clangd'},
})


