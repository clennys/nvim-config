local setup = function()
	local conform = require("conform")

	conform.setup({
		formatters_by_ft = {
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
			cpp = {"clang_format"},
			python = { "black" },
			nix = {"alejandra", "nixfmt"}
		},
	})

	vim.keymap.set({ "n", "v" }, "<leader>mp", function()
		conform.format({
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		})
	end, { desc = "Format file or range (in visual mode)" })
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = setup,
}
