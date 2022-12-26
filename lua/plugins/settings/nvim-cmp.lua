local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

vim.o.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append("c")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "latex_symbols" },
		{ name = "buffer" },
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
	formatting = {
		format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
	},
})
