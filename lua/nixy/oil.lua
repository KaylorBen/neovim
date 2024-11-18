require("oil").setup()

-- keybinds
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>e", "<CMD>Oil .<CR>", { desc = "Open parent directory" })
