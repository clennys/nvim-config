local nproc = function()
	local procn = tonumber(vim.fn.system("nproc"))
	if procn == nil then
		return 4
	else
		return procn
	end
end

return {
	cmd = {
		"clangd",
		-- '--query-driver=*',
		"--background-index",
		"--header-insertion=iwyu", -- never
		"--clang-tidy",
		"-j=" .. nproc(),
		"--header-insertion-decorators",
		"--all-scopes-completion",
		"--pch-storage=memory",
		-- '--offset-encoding=utf-16'
	},
}
