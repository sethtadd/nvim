return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require('telescope.actions').close,  -- Close directly when pressing escape in insert mode
        },
        n = {
          ["<esc>"] = require('telescope.actions').close,  -- Close directly when pressing escape in normal mode
        },
      },
    },
  },
}
