local setup = function()
	require("toggleterm").setup({
		float_opts = {
			border = "rounded",
		},
	})
end
return { "akinsho/toggleterm.nvim", version = "*", config = setup }
