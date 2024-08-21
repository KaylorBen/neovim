vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*.tex",
  command = "packadd vimtex"
})
