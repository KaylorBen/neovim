local function lsp_keymaps(bufnr)
  local opts = function(desc)
    return { noremap = true, silent = true, desc = desc }
  end
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts("Go to declaration"))
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts("Go to definition"))
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts("Hover"))
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts("View implementation"))
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts("Go to references"))
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts("Get lint"))
end

local utils = {
  on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)

    if client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true)
    end
  end,

  common_capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
  end,

  toggle_inlay_hints = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(bufnr))
  end,
}

local lspconfig = require("lspconfig")
local icons = require("nixy.icons")

local servers = {
  "asm_lsp",
  "autotools_ls",
  "bashls",
  -- "clangd", lol
  "cmake",
  "cssls",
  "gopls",
  "lua_ls",
  "luau_lsp",
  "marksman",
  "nixd",
  "nushell",
  "omnisharp",
  "rust_analyzer",
  "svelte",
  "texlab",
  "ts_ls",
  "zls",
}

local default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = icons.diagnostics.Error },
      { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
      { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
      { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
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
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
require("lspconfig.ui.windows").default_options.border = "rounded"

for _, server in pairs(servers) do
  local opts = {
    on_attach = utils.on_attach,
    capabilities = utils.common_capabilities(),
  }

  local require_ok, settings = pcall(require, "nixy.lspsettings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", settings, opts)
  end

  if server == "lua_ls" then
    require("lazydev").setup({})
  end

  if server == "zls" then
    vim.g.zig_fmt_autosave = 0
  end

  lspconfig[server].setup(opts)
end

-- keybinds
local keymap = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("Code action"))
keymap(
  "n",
  "<leader>lf",
  "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
  opts("Format")
)
keymap("n", "<leader>li", "<cmd>lua LspInfo<cr>", opts("Info"))
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts("Next diagnostic"))
keymap("n", "<leader>lh", "<cmd>lua require('nixy.lspconfig').toggle_inlay_hints<cr>", opts("Toggle hints"))
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts("Prev diagnostic"))
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", opts("CodeLens action"))
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setlocllist()<cr>", opts("Quickfix"))
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename"))
