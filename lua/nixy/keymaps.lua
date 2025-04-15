local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local opts_desc = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

keymap("n", "<C-i", "<C-i>", opts)

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Quit
keymap("n", "<leader>q", "<cmd>confirm q<cr>", opts_desc("Quit"))

-- No Highlight Search
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", opts_desc("NOHL"))

-- Tabs
keymap("n", "<leader>an", "<cmd>$tabnew<cr>", opts_desc("New Empty Tab"))
keymap("n", "<leader>aN", "<cmd>tabnew %<cr>", opts_desc("New Tab"))
keymap("n", "<leader>ao", "<cmd>tabonly<cr>", opts_desc("Only"))
keymap("n", "<leader>ah", "<cmd>-tabmove<cr>", opts_desc("Move Left"))
keymap("n", "<leader>al", "<cmd>+tabmove<cr>", opts_desc("Move Right"))

-- Indent
for i = 1, 8 do
  keymap("n", "<leader>t" .. i, "<cmd>set tabstop=" .. i .. "<cr><cmd>set shiftwidth=" .. i .. "<cr>", opts)
end
