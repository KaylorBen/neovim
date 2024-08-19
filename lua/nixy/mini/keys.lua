local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- files
keymap("n", "<leader>e", "<cmd>lua MiniFiles.open()<cr>")
