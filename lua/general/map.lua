-- Mappings

-- Helper Function
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Nvim
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")
map("n", "<esc>", "<cmd>noh<CR>")
map("n", "Q", "<nop>")
map("n", "q:", "<nop>")
map("t", "<esc>", "<C-\\><C-n>")
-- map("n", "<C-s>", "<cmd>update<cr>")
map("v", ">", ">gv")
map("v", "<", "<gv")
map("i", "<c-o>", "<esc>gUawea")
map("i", "<c-l>", "<esc>guawea")
map("n", "Y", "y$")
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>p", '"+p')
map("n", "cN", "<cmd>cprevious<cr>")
map("n", "cn", "<cmd>cnext<cr>")
map("n", "co", "<cmd>copen<cr>")
map("n", "co", "<cmd>cclose<cr>")
map("n", ",N", "<cmd>lprevious<cr>")
map("n", ",n", "<cmd>lnext<cr>")
map("n", ",o", "<cmd>lopen<cr>")
map("n", ",q", "<cmd>lclose<cr>")
map("i", ",", ",<c-g>u")
map("i", ":", ":<c-g>u")
map("i", ";", ";<c-g>u")
map("i", ".", ".<c-g>u")

vim.cmd([[
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
]])

-- Telescope
map("n", "gf", "<cmd>Telescope find_files<cr>")
map("n", "<leader>t", "<cmd>Telescope tags<cr>")
map("n", "go", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>ch", "<cmd>Telescope command_history<cr>")
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
map("n", "<leader>gs", "<cmd>Telescope git_status<cr>")
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
map("n", "<leader>rg", "<cmd>Telescope registers<cr>")
map("n", "<leader>ct", "<cmd>Telescope quickfix<cr>")
map("n", "<leader>gl", "<cmd>Telescope live_grep<cr>")
map("n", "ma", "<cmd>Telescope keymaps<cr>")

map("n", "<leader>un", "<cmd>lua require('plugins.telescope').university()<CR>")
map("n", "<leader>.", "<cmd>lua require('plugins.telescope').dotfiles()<CR>")
map("n", "<leader>nv", "<cmd>lua require('plugins.telescope').nvim_conf()<CR>")

-- Nvim-Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Undotree
map("n", "<leader>ut", "<cmd>UndotreeToggle<cr>")

-- Peek
map("n", "<Leader>dv", function()
	-- Note: setting `expr=true` and returning the value are essential
	return require('debugprint').debugprint({ variable = true })
end, {
	expr = true,
})
map("n", "<Leader>dl", function()
	-- Note: setting `expr=true` and returning the value are essential
	return require('debugprint').debugprint()
end, {
	expr = true,
})

map("n", "<Leader>Dv", function()
	return require('debugprint').debugprint({ above = true, variable = true })
end, {
	expr = true,
})

map("n", "<Leader>Dl", function()
	return require('debugprint').debugprint({ above = true, variable = true })
end, {
	expr = true,
})

map("n", "<Leader>do", function()
	-- It's also important to use motion = true for operator-pending motions
	return require('debugprint').debugprint({ motion = true })
end, {
	expr = true,
})
