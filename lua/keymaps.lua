local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local wk = require("which-key")

-- Map Ctrl+h/j/k/l to navigate between (windows)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

wk.add({
  {
    mode = { "n", "v" }, -- NORMAL and VISUAL modes
    { "<leader>q",  "<cmd>q<cr>",                                  desc = "Quit" },
    { "<leader>w",  "<cmd>w<cr>",                                  desc = "Write" },

    -- nvim-tree
    { "<leader>e",  "<cmd>NvimTreeToggle<cr>",                     desc = "Toggle nvim-tree" },

    -- Telescope
    { "<leader>s",  group = "search" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>",               desc = "Find Files" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>",                desc = "Live Grep" },
    { "<leader>sb", "<cmd>Telescope buffers<cr>",                  desc = "List Buffers" },
    { "<leader>so", "<cmd>Telescope oldfiles<cr>",                 desc = "Find Old Files" },
    { "<leader>ss", "<cmd>Telescope grep_string<cr>",              desc = "Grep String Under Cursor" },
    { "<leader>st", "<cmd>Telescope treesitter<cr>",               desc = "Treesitter Symbols" },

    -- LSP actions
    { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",       desc = "Go to Definition" },
    { "gi",         "<cmd>Telescope lsp_implementations<CR>",      desc = "Go to Implementation" },
    { "gr",         "<cmd>Telescope lsp_references<CR>",           desc = "Go to References" },
    { "K",          "<cmd>lua vim.lsp.buf.hover()<CR>",            desc = "Hover Documentation" },
    { "[d",         "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", desc = "Previous Diagnostic" },
    { "]d",         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
    { "<leader>l",  group = "lsp" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>",           desc = "Rename Symbol" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>",      desc = "Code Action" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>",       desc = "Format Document" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>",   desc = "Signature Help" },
  },
})
