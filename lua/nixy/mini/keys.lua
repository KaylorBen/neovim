local keymap = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- files
-- keymap("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", opts)

-- git
keymap("n", "<leader>gw", "<cmd>Git commit -a<cr>", opts("Write commit with message"))
keymap("n", "<leader>gs", "<cmd>Git status<cr>", opts("Git status"))
keymap("n", "<leader>gd", "<cmd>Git diff<cr>", opts("Git diff"))
