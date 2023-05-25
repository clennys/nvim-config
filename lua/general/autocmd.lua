local autocmd = vim.api.nvim_create_autocmd
-- local augroup = vim.api.nvim_create_autogroup

autocmd("FileType", {
	pattern = { "markdown", "tex" },
	command = "set wrap conceallevel=1"
})

autocmd("FileType", {
	pattern = { "markdown", "tex" },
	command = "set linebreak"
})

autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format()
	end,
	pattern = { "*.js", "*.ts", "*.lua", "*.cpp", "*.h", "*.cc" }
})

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end
})

autocmd("FileType", {
	pattern = { "cpp", "c", "cc" },
	command = "setlocal ts=2 sts=2 sw=2",
})
