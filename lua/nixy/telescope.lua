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
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
})

-- keybindings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", opts )
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", opts )
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts )
keymap("n", "<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", opts )
keymap("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", opts )
keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", opts )
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts )
keymap("n", "<leader>fH", "<cmd>Telescope highlights<cr>", opts )
keymap("n", "<leader>fi", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", opts )
keymap("n", "<leader>fl", "<cmd>Telescope resume<cr>", opts )
keymap("n", "<leader>fM", "<cmd>Telescope man_pages<cr>", opts )
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", opts )
keymap("n", "<leader>fR", "<cmd>Telescope registers<cr>", opts )
keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts )
keymap("n", "<leader>fC", "<cmd>Telescope commands<cr>", opts )

keymap("n", "<leader>go", "<cmd>Telescope git_status<cr>", opts )
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts )
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts )
keymap("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", opts )
keymap("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts )
keymap("n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts )
keymap("n", "<leader>le", "<cmd>Telescope quickfix<cr>", opts )

