local icons = require("nixy.icons")
local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = icons.ui.Forward .. " ",
    entry_prefix = "   ",
    initial_mode = "insert",
    selection_strategy = "reset",
    path_display = { "smart" },
    color_devicons = true,

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<esc>"] = actions.close,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case",    -- or "ignore_case" or "respect_case"
    },
  },
})

-- keybindings
local keymap = vim.keymap.set
local opts = function(desc)
  return { noremap = true, silent = true, desc = desc }
end

keymap("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", opts("Checkout Branch"))
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", opts("Colorscheme"))
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts("Find Files"))
keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts("Projects"))
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts("Find Text"))
keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", opts("Find String"))
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts("Help"))
keymap("n", "<leader>fH", "<cmd>Telescope highlights<cr>", opts("Highlights"))
keymap("n", "<leader>fi", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", opts("Media"))
keymap("n", "<leader>fl", "<cmd>Telescope resume<cr>", opts("Last Search"))
keymap("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", opts("Man Pages"))
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts("Recent File"))
keymap("n", "<leader>fR", "<cmd>Telescope registers<cr>", opts("Registers"))
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts("Keymaps"))
keymap("n", "<leader>fC", "<cmd>Telescope commands<cr>", opts("Commands"))

keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", opts("Open changed file"))
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts("Checkout branch"))
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts("Checkout commit"))
keymap("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", opts("Checkout commit(for current file)"))
keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts("Document symbols"))
keymap("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts("Workspace symbols"))
keymap("n", "<leader>le", "<cmd>Telescope quickfix<cr>", opts("Telescope Quickfix"))
