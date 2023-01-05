-- Bootstrapping Packer

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

-- Plugins
vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function(use)
		-- Packer
		use("wbthomason/packer.nvim")

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.settings.treesitter")
			end,
			requires = {
				{ "nvim-treesitter/nvim-treesitter-textobjects" },
				{ "nvim-treesitter/nvim-treesitter-refactor", { "nvim-treesitter/playground" } },
			},
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("lsp")
			end,
			requires = {
				"williamboman/mason.nvim",
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			}
		})

		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins.settings.nvim-cmp")
			end,
			requires = {
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-nvim-lua" },
				{ "saadparwaiz1/cmp_luasnip" },
				{ "kdheepak/cmp-latex-symbols" },
				{ "rcarriga/cmp-dap" },
			},
		})

		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("plugins.settings.luasnip")
			end,
			requires = { { "rafamadriz/friendly-snippets" } },
		})

		-- Colorscheme
		use({
			"~/Projects/neovim/orca.nvim",
			config = function()
				require("orca")
				vim.cmd [[hi Normal guibg=None]]
			end,
		})

		-- Statusline
		use({
			"lewis6991/gitsigns.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			event = "BufRead",
			config = function()
				require("plugins.settings.gitsigns")
			end,
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("plugins.settings.telescope")
			end,
			requires = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
				{ "nvim-telescope/telescope-ui-select.nvim" }
			},
		})

		-- Comments
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("plugins.settings.comment")
			end,
		})

		-- -- Indent Lines
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				require("plugins.settings.indentline")
			end,
		})

		-- Pairs
		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			config = function()
				require("nvim-autopairs").setup({})
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				local cmp = require("cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { all = "(", tex = "{" } }))
				local Rule = require("nvim-autopairs.rule")
				local npairs = require("nvim-autopairs")
				npairs.add_rule(Rule("$$", "$$", "tex"))
			end,
		})

		-- Trees
		use({
			"kyazdani42/nvim-tree.lua",
			config = function()
				require("plugins.settings.nvim-tree")
			end,
			requires = { "kyazdani42/nvim-web-devicons" },
		})

		use({
			"mbbill/undotree",
			config = function()
				require("plugins.settings.undotree")
			end,
		})

		-- Colors

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("plugins.settings.colorizer")
				vim.cmd [[highlight Normal guibg=None]]
			end,
		})

		-- LSP Kind
		use({ "onsails/lspkind-nvim" })

		use({
			"rmagatti/goto-preview",
			config = function()
				require("goto-preview").setup({})
			end,
		})

		use { 'mfussenegger/nvim-dap',
			requires = {
				{ 'rcarriga/nvim-dap-ui' },
				{ 'theHamsta/nvim-dap-virtual-text' },
				{ 'nvim-telescope/telescope-dap.nvim' }
			}
		}
		use({
			"kylechui/nvim-surround",
			tag = "*",
			config = function()
				require("nvim-surround").setup({})
			end
		})
		-- use {
		-- 'nvim-lualine/lualine.nvim',
		-- requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		-- config = function()
		-- 	require("plugins.lualine")
		-- end
		-- }
		use {
			"j-hui/fidget.nvim",
			config = function()
				require "fidget".setup {
					text = {
						spinner = "moon"
					}
				}
			end
		}
	end,
	-- Packer settings
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
