-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 2   -- Indent commands use 2 spaces
vim.opt.tabstop = 2      -- Display tabs as two spaces

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' -- Use Treesitter for folding
vim.opt.foldlevel = 99                          -- Start with all folds open

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<esc>', '<cmd>nohlsearch<CR>')

-- Use smartcase when / searching
vim.opt.smartcase = true

-- Enable 24 bit RBG colors
vim.opt.termguicolors = true

-- Always show column space for signs are displayed e.g. Git changes or LSP diagnostics
vim.opt.signcolumn = 'yes'

-- Show space characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Highlight cursor line
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Don't show default mode text; shown by status line
vim.opt.showmode = false

-- Delay before showing diagnostics, linting errors, etc. Default is 4000
vim.opt.updatetime = 250

-- Save undo history
vim.opt.undofile = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Use system clipboard as default register, run async to reduce startup time
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    --  See `:help vim.highlight.on_yank()`
    vim.highlight.on_yank()
  end,
})

-- Customize the hover window with borders
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
