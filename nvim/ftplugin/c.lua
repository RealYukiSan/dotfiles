local root_files = {
  '.c',
  '.clangd',
  '.clang-tidy',
  '.clang-format',
  'compile_commands.json',
  'compile_flags.txt',
  'configure.ac', -- AutoTools
}

local paths = vim.fs.find(root_files, { stop = vim.env.HOME })
local root_dir = vim.fs.dirname(paths[1])

if root_dir then
	vim.lsp.start({
		name = 'clangd-lsp',
		filetypes = { 'c' },
		cmd = {'clangd'},
		root_dir = root_dir
	})
end
