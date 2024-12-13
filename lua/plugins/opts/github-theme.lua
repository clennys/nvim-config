return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- Default options
		require("github-theme").setup({
			palettes = {
				all = {
					fg1 = "eaebed",
			-- 		bg1 = "eaebed",
				},
			},
			-- groups = {
			--
			-- },
			options = {
				-- module_default = true, -- Default enable value for modules
				transparent = true,       -- Disable setting bg (make neovim's background transparent)
				styles = { -- Style to be applied to different syntax groups
					comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
					functions = "italic, bold",
					keywords = "bold",
					variables = "bold",
					conditionals = "bold",
					constants = "bold,italic",
					numbers = "NONE",
					operators = "bold",
					strings = "NONE",
					types = "bold",
				},
				darken = { -- Darken floating windows and sidebar-like windows
					floats = true,
					sidebars = {
						enable = true,
						list = {}, -- Apply dark background to specific windows
					},
				},
			},
		})

		-- setup must be called before loading
		vim.cmd("colorscheme github_dark_default")
	end,
}
