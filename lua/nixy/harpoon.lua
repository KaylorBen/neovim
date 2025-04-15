require("harpoon").setup({
  save_on_toggle = false,
  save_on_change = true,
})

-- keybinds
local keymap = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

keymap("n", "<leader>Hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts("Mark file"))
keymap("n", "<leader>Hv", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts("Toggle menu"))
keymap("n", "<leader>Hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts("Next file"))
keymap("n", "<leader>Hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", opts("Previous file"))

keymap("n", "<leader>H1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts("Goto file 1"))
keymap("n", "<leader>H2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts("Goto file 2"))
keymap("n", "<leader>H3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts("Goto file 3"))
keymap("n", "<leader>H4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts("Goto file 4"))
keymap("n", "<leader>H5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts("Goto file 5"))
keymap("n", "<leader>H6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts("Goto file 6"))
keymap("n", "<leader>H7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts("Goto file 7"))
keymap("n", "<leader>H8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts("Goto file 8"))
keymap("n", "<leader>H9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts("Goto file 9"))

keymap("n", "<m-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts("Goto file 1"))
keymap("n", "<m-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts("Goto file 2"))
keymap("n", "<m-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts("Goto file 3"))
keymap("n", "<m-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", opts("Goto file 4"))
keymap("n", "<m-5>", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", opts("Goto file 5"))
keymap("n", "<m-6>", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", opts("Goto file 6"))
keymap("n", "<m-7>", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", opts("Goto file 7"))
keymap("n", "<m-8>", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", opts("Goto file 8"))
keymap("n", "<m-9>", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", opts("Goto file 9"))
