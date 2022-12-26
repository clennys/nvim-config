require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.integrations.telescope"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					uni = "~/Nextcloud/Notes/university/",
					code = "~/Nextcloud/Notes/coding/",
					pers = "~/Nextcloud/Notes/personal/",
				},
			},
		},
		["core.norg.concealer"] = {},
		["core.norg.qol.toc"] = {},
		-- ["core.norg.completion"] = {},
	},
})
