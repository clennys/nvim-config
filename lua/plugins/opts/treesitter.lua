local setup = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "all",
		highlight = {
			enable = true,
		},
		-- nvim-treesitter-textobjects
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["as"] = "@class.outer",
					["is"] = "@class.inner",
					["ac"] = "@conditional.outer",
					["ic"] = "@conditional.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["ab"] = "@block.outer",
					["ib"] = "@block.inner",
					["cm"] = "@comment.outer",
					-- ["ss"] = "@statement.outer",
				},
			},
			move = {
				enable = true,
				goto_next_start = {
					["<leader>nf"] = "@function.outer",
					["<leader>ns"] = "@class.outer",
					["<leader>nc"] = "@conditional.outer",
					["<leader>nl"] = "@loop.outer",
					["<leader>nb"] = "@block.outer",
				},
				goto_previous_start = {
					["<leader>Nf"] = "@function.outer",
					["<leader>Ns"] = "@class.outer",
					["<leader>Nc"] = "@conditional.outer",
					["<leader>Nl"] = "@loop.outer",
					["<leader>Nb"] = "@block.outer",
				},
			},
		},
		-- nvim-treesitter-refactor
		refactor = {
			highlight_definitions = { enable = true },
			highlight_current_scope = { enable = true },
		},
	})
end
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		{ "nvim-treesitter/nvim-treesitter-refactor", { "nvim-treesitter/playground" } },
	},
	config = setup
}
