local colors = {
	black = "#1c2023",
	white = "#eaebed",
	red = "#bf616a",
	green = "#a3be8c",
	blue = "#81a1c1",
	yellow = "#ebcb8b",
	purple = "#b48ead",
	orange = "#D08770",
	gray = "#697884",
	cyan = "#96b4b5",
	darkgray = "#4e5961",
}
local orca = {
	normal = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
		c = { bg = colors.black, fg = colors.white },
	},
	insert = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
		c = { bg = colors.black, fg = colors.white },
	},
	visual = {
		a = { bg = colors.purple, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
		c = { bg = colors.black, fg = colors.white },
	},
	replace = {
		a = { bg = colors.orange, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
		c = { bg = colors.black, fg = colors.white },
	},
	command = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.black, fg = colors.red },
		c = { bg = colors.black, fg = colors.white },
	},
	inactive = {
		a = { bg = colors.black, fg = colors.gray, gui = "bold" },
		b = { bg = colors.black, fg = colors.gray },
		c = { bg = colors.black, fg = colors.gray },
	},
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = orca,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			"filename",
			"diff",
			{
				"diagnostics",
				symbols = { error = "", warn = "!", info = "", hint = "" },
				diagnostics_color = {
					error = "DiagnosticSignError",
					warn = "DiagnosticSignWarn",
					info = "DiagnosticSignInfo",
					hint = "DiagnosticSignHint",
				},
			},
		},
		lualine_x = { "encoding", "fileformat", { "filetype", colored = true } },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { { "filetype", colored = true } },
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {},
	extensions = { "nvim-tree", "quickfix" },
})
