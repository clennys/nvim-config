-- Telescope
local telescope = require("telescope")
telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "flex",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = {},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	},
})

telescope.load_extension("fzf")
local custom_telescope = {}
local builtin = require("telescope.builtin")

-- Find Files
custom_telescope.university = function()
	builtin.find_files({
		prompt_title = "University Files",
		cwd = "~/University/repos/",
	})
end

custom_telescope.dotfiles = function()
	builtin.find_files({
		prompt_title = "Dotfiles",
		cwd = "~/.dotfiles",
		hidden = true,
	})
end

custom_telescope.coding = function()
	builtin.find_files({
		prompt_title = "Coding Projects",
		cwd = "~/Projects",
	})
end

custom_telescope.nvim_conf = function()
	builtin.find_files({
		prompt_title = "Nvim Config",
		cwd = "~/.config/nvim/",
	})
end

return custom_telescope
