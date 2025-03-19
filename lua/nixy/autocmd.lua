-- tabspacing per language
-- 4 tabwidth
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = {
		"*.c",
		"*.h",
		"*.java",
		"*.zig",
		"*.rs",
		"*.cpp",
		"*.hpp",
		"*.sh",
		"*.go",
		"*.js",

    -- shaders
    "*.glsl",
    "*.vert",
    "*.tect",
    "*.tese",
    "*.frag",
    "*.geom",
    "*.comp",
    "*.wgsl",
	},
	callback = function()
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
		vim.expandtab = true
	end,
})

-- 3 tabwidth
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = {
		"*.cs",
	},
	callback = function()
		vim.opt.tabstop = 3
		vim.opt.shiftwidth = 3
		vim.expandtab = true
	end,
})

-- 2 tabwidth
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = {
		"*.nix",
		"*.lua",
		"*.html",
		"*.css",
		"*.json",
		"*.ts",
		"*.tex",
		"*.nu",
	},
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.expandtab = true
	end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlihgt selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})
