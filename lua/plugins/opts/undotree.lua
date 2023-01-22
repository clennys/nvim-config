local setup = function()
	local g = vim.g
	g.undotree_WindowLayout = 2
	g.undotree_TreeNodeShape = ""

end
return {
	"mbbill/undotree",
	config = setup
}
