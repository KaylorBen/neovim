-- tabspacing per language
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = {
    "*.c",
    "*.h",
  },
  callback = function()
    -- kernel style baby!!!
    vim.opt.tabstop = 8;
    vim.opt.shiftwidth = 8;
    vim.expandtab = false;
  end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = {
    "*.java",
    "*.zig",
    "*.rs",
    "*.cpp",
    "*.hpp",
    "*.sh",
    "*.go",
  },
  callback = function()
    vim.opt.tabstop = 4;
    vim.opt.shiftwidth = 4;
    vim.expandtab = true;
  end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = {
    "*.nix",
    "*.lua",
    "*.html",
    "*.css",
    "*.json",
    "*.js",
    "*.ts",
    "*.cs",
    "*.tex",
    "*.nu",
  },
  callback = function()
    vim.opt.tabstop = 2;
    vim.opt.shiftwidth = 2;
    vim.expandtab = true;
  end
})
