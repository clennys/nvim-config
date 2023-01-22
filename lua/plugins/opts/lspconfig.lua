return {"neovim/nvim-lspconfig",
			config = function()
				require("lsp")
			end,
			dependencies = {
				"williamboman/mason.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			}
		}
