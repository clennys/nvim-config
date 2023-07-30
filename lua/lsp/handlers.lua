local M = {}

M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "x" },
		{ name = "DiagnosticSignWarn", text = "!" },
		{ name = "DiagnosticSignInfo", text = "󰛄" },
		{ name = "DiagnosticSignHint", text = "󰌵" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local border = "single"

	local config = {
		virtual_text = true,
		signs = true,
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = border,
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or border
		return orig_util_open_floating_preview(contents, syntax, opts, ...)
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
-- M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.on_attach = function(client, bufnr)
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local buf_set_keymap = vim.keymap.set
	local opts = { noremap = true, silent = true, buffer = bufnr }
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>of", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[u", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]u", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<leader>mf", "<cmd>lua vim.lsp.buf.format{async = true}<CR>", opts)
	buf_set_keymap("n", "<leader>pd", "<cmd> lua require('goto-preview').goto_preview_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>pi", "<cmd> lua require('goto-preview').goto_preview_implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>cp", "<cmd> lua require('goto-preview').close_all_win()<CR>", opts)
	buf_set_keymap("n", "<leader>pr", "<cmd> lua require('goto-preview').goto_preview_references()<CR>", opts)
	buf_set_keymap("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols, opts)
	buf_set_keymap("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)
end

return M
