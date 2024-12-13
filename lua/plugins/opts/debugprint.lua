local setup = function()
	local opts = {
		-- keymaps = false,
	}
	require("debugprint").setup(opts)
end
return {
	"andrewferrier/debugprint.nvim",
	config = setup,
}
