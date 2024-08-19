require("harpoon").setup({
  save_on_toggle = false,
  save_on_change = true,
})

-- keybinds
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>Hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts )
keymap("n", "<leader>Hv", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts )
keymap("n", "<leader>Hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts )
keymap("n", "<leader>Hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts )

keymap("n", "<leader>H1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts )
keymap("n", "<leader>H2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts )
keymap("n", "<leader>H3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts )
keymap("n", "<leader>H4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts )
keymap("n", "<leader>H5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts )
keymap("n", "<leader>H6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts )
keymap("n", "<leader>H7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts )
keymap("n", "<leader>H8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts )
keymap("n", "<leader>H9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts )

keymap("n", "<m-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts )
keymap("n", "<m-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts )
keymap("n", "<m-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts )
keymap("n", "<m-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts )
keymap("n", "<m-5>", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts )
keymap("n", "<m-6>", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts )
keymap("n", "<m-7>", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts )
keymap("n", "<m-8>", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts )
keymap("n", "<m-9>", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts )
