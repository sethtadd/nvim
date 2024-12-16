local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local wk = require("which-key")
local cmp = require 'cmp'

-- Map Ctrl+h/j/k/l to navigate between (windows)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

wk.add({
  -- NORMAL and VISUAL modes
  {
    mode = { "n", "v" },
    { "<leader>q",   "<cmd>q<cr>",                                                           desc = "Quit" },
    { "<leader>w",   "<cmd>w<cr>",                                                           desc = "Write" },

    { "<leader>o",   "<cmd>Oil<cr>",                                                         desc = "Open Oil File Browser" },

    -- Telescope
    { "<leader>s",   group = "search" },
    { "<leader>sf",  "<cmd>Telescope find_files<cr>",                                        desc = "Find Files" },
    { "<leader>sg",  "<cmd>Telescope live_grep<cr>",                                         desc = "Live Grep" },
    { "<leader>sb",  "<cmd>Telescope buffers<cr>",                                           desc = "List Buffers" },
    { "<leader>so",  "<cmd>Telescope oldfiles<cr>",                                          desc = "Find Old Files" },
    { "<leader>ss",  "<cmd>Telescope grep_string<cr>",                                       desc = "Grep String Under Cursor" },
    { "<leader>st",  "<cmd>Telescope treesitter<cr>",                                        desc = "Treesitter Symbols" },

    -- Zk
    -- https://github.com/zk-org/zk-nvim#example-mappings
    { "<leader>z",   group = "zk" },
    { "<leader>zn",  group = "New Note" },
    { "<leader>zne", "<cmd>ZkNew { title = vim.fn.input('Title: '), dir = 'ephemeral'}<cr>", desc = "New Ephemeral Note" },
    { "<leader>znr", "<cmd>ZkNew { title = vim.fn.input('Title: '), dir = 'reference'}<cr>", desc = "New Reference Note" },
    { "<leader>znj", "<cmd>ZkNew { title = vim.fn.input('Title: '), dir = 'journal'}<cr>",   desc = "New Journal Note" },
    { "<leader>zo",  "<cmd>Telescope zk notes<cr>",                                          desc = "Open Notes" },
    { "<leader>zt",  "<cmd>Telescope zk tags<cr>",                                           desc = "Tags" },
    { "<leader>zb",  "<cmd>ZkBacklinks<cr>",                                                 desc = "Backlinks" },
    { "<leader>zl",  "<cmd>ZkLinks<cr>",                                                     desc = "Links" },
    { "<leader>zi",  ":'<,'>ZkInsertLinkAtSelection<cr>",                                    desc = "Insert Link At Selection" },

    -- LSP actions
    { "gd",          "<cmd>lua vim.lsp.buf.definition()<CR>",                                desc = "Go to Definition" },
    { "gi",          "<cmd>Telescope lsp_implementations<CR>",                               desc = "Go to Implementation" },
    { "gr",          "<cmd>Telescope lsp_references<CR>",                                    desc = "Go to References" },
    { "K",           "<cmd>lua vim.diagnostic.buf.hover()<CR>",                              desc = "Hover Documentation" },
    { "[d",          "<cmd>lua vim.diagnostic.goto_prev()<CR>",                              desc = "Previous Diagnostic" },
    { "]d",          "<cmd>lua vim.diagnostic.goto_next()<CR>",                              desc = "Next Diagnostic" },
    { "<leader>l",   group = "lsp" },
    { "<leader>lr",  "<cmd>lua vim.lsp.buf.rename()<CR>",                                    desc = "Rename Symbol" },
    { "<leader>la",  "<cmd>lua vim.lsp.buf.code_action()<CR>",                               desc = "Code Action" },
    { "<leader>lf",  "<cmd>lua vim.lsp.buf.format()<CR>",                                    desc = "Format Document" },
    { "<leader>ls",  "<cmd>lua vim.lsp.buf.signature_help()<CR>",                            desc = "Signature Help" },

    -- Git actions
    { "<leader>g",   group = "git" },
    { "<leader>gs",  "<cmd>Git<CR>",                                                         desc = "Git Status" },
    { "<leader>gd",  "<cmd>Gvdiffsplit<CR>",                                                 desc = "Git Diff" },
    { "<leader>gb",  "<cmd>Git blame<CR>",                                                   desc = "Git Blame" },

    -- Key mappings for toggleterm
    { "<C-\\>",      "<cmd>exe v:count1 . 'ToggleTerm'<CR>",                                 desc = "Toggle Terminal" },

    -- Key mappings for nabla.nvim
    { "<leader>p",   "<cmd>lua require'nabla'.popup()<CR>",                                  desc = "Nabla Popup" },
    { "<leader>n",   "<cmd>lua require('nabla').toggle_virt()<CR>",                          desc = "Toggle Nabla Inline Rendering" },
    -- render-markdown.nvim
    { "<leader>m",   "<cmd>lua require('render-markdown').toggle()<CR>",                     desc = "Toggle Render Markdown" },

    -- Treesitter
    {
      -- Incremental selection
      { "<cr>", "<cmd>lua require'nvim-treesitter.incremental_selection'.init_selection()<CR>",                  desc = "Start Incremental Selection" },
      { "<cr>", "<cmd>lua require'nvim-treesitter.incremental_selection'.node_incremental()<CR>",                desc = "Increment Node" },
      { "<bs>", "<cmd>lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>",                desc = "Decrement Node" },

      --   -- NOTE: Tab and Ctrl-i (Ctrl-i is for moving forward in navigation jumplist) are treated as the same by most terminals, so we need a different key if we want this functionality
      --   -- { "<tab>", "<cmd>lua require'nvim-treesitter.incremental_selection'.scope_incremental()<CR>",               desc = "Increment Scope" },

      -- Moving between function/class text objects
      { "]f",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_start('@function.outer')<CR>",     desc = "Next Function Start" },
      { "]F",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_end('@function.outer')<CR>",       desc = "Next Function End" },
      { "]c",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_start('@class.outer')<CR>",        desc = "Next Class Start" },
      { "]C",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_next_end('@class.outer')<CR>",          desc = "Next Class End" },
      { "[f",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_start('@function.outer')<CR>", desc = "Previous Function Start" },
      { "[F",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_end('@function.outer')<CR>",   desc = "Previous Function End" },
      { "[c",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_start('@class.outer')<CR>",    desc = "Previous Class Start" },
      { "[C",   "<cmd>lua require'nvim-treesitter.textobjects.move'.goto_previous_end('@class.outer')<CR>",      desc = "Previous Class End" },
    },

  },

  -- Visual mode only
  {
    mode = { "v" },
    -- Treesitter text object selection mappings
    { "af", "<cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.outer')<CR>", desc = "Around Function" },
    { "if", "<cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@function.inner')<CR>", desc = "Inside Function" },
    { "ac", "<cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.outer')<CR>",    desc = "Around Class" },
    { "ic", "<cmd>lua require'nvim-treesitter.textobjects.select'.select_textobject('@class.inner')<CR>",    desc = "Inside Class" },
  },

  -- Terminal mode
  {
    mode = { "t" },
    { "<C-\\>", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", desc = "Toggle Terminal" },
    { "<esc>",  [[<C-\><C-n>]],                         desc = "Normal Mode" },
  },
})

-- Key mappings for nvim-cmp
wk.add({
  -- INSERT mode
  {
    mode = { "i" },
    {
      {
        "<C-Space>",
        function()
          cmp.complete()
        end,
        desc = "Trigger Completion"
      },

      {
        "<C-n>",
        function()
          if cmp.visible() then
            cmp.select_next_item()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n", true)
          end
        end,
        desc = "Next Completion Item"
      },

      {
        "<C-p>",
        function()
          if cmp.visible() then
            cmp.select_prev_item()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n", true)
          end
        end,
        desc = "Previous Completion Item"
      },

      {
        "<C-f>",
        function()
          if cmp.visible() then
            cmp.scroll_docs(4)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-f>", true, true, true), "n", true)
          end
        end,
        desc = "Scroll Documentation Down"
      },

      {
        "<C-b>",
        function()
          if cmp.visible() then
            cmp.scroll_docs(-4)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-b>", true, true, true), "n", true)
          end
        end,
        desc = "Scroll Documentation Up"
      },

      {
        "<C-y>",
        function()
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({ select = true })
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-y>", true, true, true), "n", true)
          end
        end,
        desc = "Confirm Completion"
      },

      {
        "<C-e>",
        function()
          if cmp.visible() then
            cmp.abort()
          else
            return vim.api.nvim_replace_termcodes("<C-e>", true, true, true)
          end
        end,
        desc = "Abort Completion"
      },
    },
  },
})
