vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = "*.tex",
  callback = function ()
    vim.cmd("packadd vimtex")
    vim.g.vimtex_view_method = 'zathura'
  end,
})
