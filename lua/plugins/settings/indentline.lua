-- IndentLine

vim.opt.list = true
vim.opt.listchars:append("trail:•")
vim.opt.listchars:append("tab:  ")

require("indent_blankline").setup {
    space_char_blankline = " ",
    -- show_current_context = true,
    -- show_current_context_start = true,
	filetype_exclude = { "text", "help", "terminal", "man", "packer", "markdown", "norg", "FTerm", "tex", "lsp-installer"},
	char = "▏"
}

