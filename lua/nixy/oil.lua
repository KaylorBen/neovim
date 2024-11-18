require("oil").setup()

-- keybinds
local keymap = vim.keymap.set
local opts = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

keymap("n", "<leader>e", "<CMD>Oil<CR>", opts("Open parent directory"))
