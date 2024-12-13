local calculate_comment_string = require("Comment.ft").calculate
local utils = require("Comment.utils")

--- Get the comment string {beg,end} table
---@param ctype integer 1 for `line`-comment and 2 for `block`-comment
---@return table comment_strings {begcstring, endcstring}
local get_cstring = function(ctype)
	-- use the `Comments.nvim` API to fetch the comment string for the region (eq. '--%s' or '--[[%s]]' for `lua`)
	local cstring = calculate_comment_string({ ctype = ctype, range = utils.get_region() }) or vim.bo.commentstring
	-- as we want only the strings themselves and not strings ready for using `format` we want to split the left and right side
	local left, right = utils.unwrap_cstr(cstring)
	-- create a `{left, right}` table for it
	return { left, right }
end

local comment_strings = function(alias, name)
	return {
		f(function()
			return get_cstring(1)[1] .. " " .. alias .. ": (" .. name .. ") "
		end),
		i(1, "Write comment here"),
		t({ "", "" }),
		i(0),
	}
end

local username = "dhub"

return {
	s({ trig = "todo", snippetType = "autosnippet", desc = "TODO", wordTrig = true }, comment_strings("TODO", username)),
	s({ trig = "warn", snippetType = "autosnippet", desc = "WARN", wordTrig = true }, comment_strings("WARN", username)),
	s({ trig = "info", snippetType = "autosnippet", desc = "INFO", wordTrig = true }, comment_strings("INFO", username)),
	s({ trig = "fix", snippetType = "autosnippet", desc = "FIX", wordTrig = true }, comment_strings("FIX", username)),
}
