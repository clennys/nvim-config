-- LSP Setup
local lspconfig = require("lspconfig")

require("mason").setup {}

require("mason-tool-installer").setup {
	ensure_installed = { "clangd", "clang-format", "stylua", "shfmt", "bash-language-server", "black", "pyright",
		"lua-language-server", "ltex-ls" },
	auto_update = false,
	run_on_start = true,
}

local servers = { "clangd", "bashls", "pyright", "sumneko_lua", "ltex" }

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in pairs(servers) do
	opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = capabilities,
	}

	if server == "sumneko_lua" then
		local sumneko_opts = require("lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	-- end

	lspconfig[server].setup(opts)
	::continue::
end

-- Autocommand
vim.cmd([[
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 10000)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 10000)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 10000)
autocmd BufWritePre *.py.in lua vim.lsp.buf.formatting_sync(nil, 10000)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 10000)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 10000)
]])
