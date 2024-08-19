require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "c",
    "cpp",
    "cmake",
    "make",
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "python",
    "java",
    "zig",
    "rust",
    "go",
    "nix",
  },
  highlight = { enable = true },
  indent = { enable = true },
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gR",
      },
    },
  },
})
