local g = vim.g

if vim.fn.has("mac") == 1 then
	g.livepreview_previewer = "open -a Preview"
elseif vim.fn.has("unix") == 1 then
	g.livepreview_previewer = "zathura"
end
g.livepreview_cursorhold_recompile = 0
