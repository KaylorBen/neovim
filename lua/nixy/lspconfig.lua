local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

local utils = {
  on_attach = function (client, bufnr)
    lsp_keymaps(bufnr)

    if client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true)
    end
  end,

  common_capabilities = function ()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
  end,

  toggle_inlay_hints = function ()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(bufnr))
  end,
}

local lspconfig = require("lspconfig")
local icons = require("nixy.icons")

local servers = {
    "clangd",
		"cmake",
		"autotools_ls",
		"lua_ls",
		"tsserver",
		"bashls",
		"zls",
		"rust_analyzer",
		"gopls",
		"texlab",
		"marksman",
}

local default_diagnostic_config = {
  signs = {
    active = true,
    vlaues = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
    },
  },
  virtual_text = true,
  update_in_insert = true,
  severity_sort = true,
  inlay_hints = { enabled = true },
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(default_diagnostic_config)

for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] =
  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
require("lspconfig.ui.windows").default_options.border = "rounded"

for _, server in pairs(servers) do
  local opts = {
    on_attach = utils.on_attach,
    capabilities = utils.common_capabilities(),
  }

  local require_ok, settings = pcall(require, "benix.lspsettings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  if server == "lua_ls" then
    require("neodev").setup({})
  end

  if server == "zls" then
    vim.cmd("let g:zig_fmt_autosave = 0")
  end

  lspconfig[server].setup(opts)
end