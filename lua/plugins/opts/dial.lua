local setup = function()
	local augend = require("dial.augend")
	require("dial.config").augends:register_group({
		-- default augends used when no group name is specified
		default = {
			augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
			augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
			augend.constant.alias.bool, -- boolean value (true <-> false)
			augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
		},
	})
end
return {
	"monaqa/dial.nvim",
	config = setup,
}
