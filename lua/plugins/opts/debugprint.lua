local setup = function()
	local opts = {
		create_keymaps = false,
	}
	require("debugprint").setup(opts)
end
return {
	"andrewferrier/debugprint.nvim",
	config = setup
}
