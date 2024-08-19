local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- files
keymap("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>", opts)

-- git
keymap("n", "<leader>gw", "<cmd>Git commit -a<cr>", opts)
keymap("n", "<leader>gs", "<cmd>Git status<cr>", opts)
keymap("n", "<leader>gd", "<cmd>Git diff<cr>", opts)
