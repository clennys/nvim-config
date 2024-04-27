local setup = function()
	require("oil").setup()
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end
return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = setup,
}
