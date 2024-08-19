local miniclue = require("mini.clue")
local desc = miniclue.set_mapping_desc
local clues = miniclue.gen_clues
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },

    -- Marks
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },

    -- Registers
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    clues.builtin_completion(),
    clues.g(),
    clues.marks(),
    clues.registers(),
    clues.windows(),
    clues.z(),
  },
})

-- mappings
desc("n", "<leader>q", "Quit")
desc("n", "<leader>h", "NOHL")
desc("n", "<leader>e", "Files")

-- tabs
desc("n", "<leader>an", "New Empty Tab")
desc("n", "<leader>aN", "New Tab")
desc("n", "<leader>ao", "Only")
desc("n", "<leader>ah", "Move Left")
desc("n", "<leader>al", "Move Right")

-- telescope
desc("n", "<leader>fb", "Checkout Branch")
desc("n", "<leader>fc", "Colorscheme")
desc("n", "<leader>ff", "Find Files")
desc("n", "<leader>fp", "Projects")
desc("n", "<leader>ft", "Find Text")
desc("n", "<leader>fs", "Find String")
desc("n", "<leader>fh", "Help")
desc("n", "<leader>fH", "Highlights")
desc("n", "<leader>fi", "Media")
desc("n", "<leader>fl", "Last Search")
desc("n", "<leader>fM", "Man Pages")
desc("n", "<leader>fr", "Recent File")
desc("n", "<leader>fR", "Registers")
desc("n", "<leader>fk", "Keymaps")
desc("n", "<leader>fC", "Commands")

-- git
desc("n", "<leader>go", "Open changed file")
desc("n", "<leader>gb", "Checkout branch")
desc("n", "<leader>gc", "Checkout commit")
desc("n", "<leader>gC", "Checkout commit(for current file)")
desc("n", "<leader>gw", "Write commit with message")
desc("n", "<leader>gs", "Git status")
desc("n", "<leader>gd", "Git diff")

-- harpoon
desc("n", "<leader>Hm", "Mark file")
desc("n", "<leader>Hv", "Toggle menu")
desc("n", "<leader>Hn", "Next file")
desc("n", "<leader>Hp", "Previous file")
desc("n", "<leader>H1", "Goto file 1")
desc("n", "<leader>H2", "Goto file 2")
desc("n", "<leader>H3", "Goto file 3")
desc("n", "<leader>H4", "Goto file 4")
desc("n", "<leader>H5", "Goto file 5")
desc("n", "<leader>H6", "Goto file 6")
desc("n", "<leader>H7", "Goto file 7")
desc("n", "<leader>H8", "Goto file 8")
desc("n", "<leader>H9", "Goto file 9")

-- lspconfig

-- these error if bindings is not supported by lsp
-- desc("n", "gD", "Go to declaration")
-- desc("n", "gd", "Go to definition")
-- desc("n", "gI", "Go to implementation")
-- desc("n", "gr", "Go to references")
-- desc("n", "gl", "Open diagnostic")

desc("n", "<leader>la", "Code action")
desc("n", "<leader>lf", "Format")
desc("n", "<leader>li", "Info")
desc("n", "<leader>lj", "Next diagnostic")
desc("n", "<leader>lh", "Toggle hints")
desc("n", "<leader>lk", "Prev diagnostic")
desc("n", "<leader>ll", "CodeLens action")
desc("n", "<leader>lq", "Quickfix")
desc("n", "<leader>lr", "Rename")
desc("n", "<leader>ls", "Document symbols")
desc("n", "<leader>lS", "Workspace symbols")
desc("n", "<leader>le", "Telescope Quickfix")
