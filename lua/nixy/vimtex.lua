vim.cmd("packadd vimtex")
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_latexmk = {
  aux_dir = '.cache',
  out_dir = '',
  callback = 1,
  continuous = 1,
  executable = 'latexmk',
  hooks = {},
  options = {
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
  },
}
