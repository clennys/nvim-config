return {
	dir = "~/Projects/neovim/orca.nvim",
	config = function()
		require("orca")
		vim.cmd [[hi Normal guibg=None]]
	end,
}
