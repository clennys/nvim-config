local formatting = require("null-ls").builtins.formatting
local sources = {
	formatting.black,
	formatting.clang_format,
}

require("null-ls").setup({
	sources = sources,
})
