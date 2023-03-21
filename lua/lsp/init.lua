-- LSP Setup
local lspconfig = require("lspconfig")

require("mason").setup {}

require("mason-tool-installer").setup {
	ensure_installed = { "clangd", "clang-format", "stylua", "shfmt", "bash-language-server", "black", "pyright",
		"lua-language-server", "texlab", "marksman" },
	auto_update = false,
	run_on_start = true,
}

local servers = { "clangd", "bashls", "pyright", "lua_ls", "texlab", "marksman" }

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = capabilities,
	}

	if server == "lua_ls" then
		local lua_ls_opts = require("lsp.settings.lua_ls")
		opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
	end

	if server == "texlab" then
		local texlab_opts = require("lsp.settings.texlab")
		opts = vim.tbl_deep_extend("force", texlab_opts, opts)
	end


	-- end

	lspconfig[server].setup(opts)
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

require("lsp.handlers").setup()
