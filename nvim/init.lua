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
