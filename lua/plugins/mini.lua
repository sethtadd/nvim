return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.statusline').setup({ use_icons = vim.g.have_nerd_font })
  end,
}
