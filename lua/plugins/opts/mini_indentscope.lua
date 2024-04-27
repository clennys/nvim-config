return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.indentscope").setup({
			symbol = "▏",
		})
	end,
}
