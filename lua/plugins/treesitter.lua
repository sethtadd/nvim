return {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  opts = {
    ensure_installed = { "lua", "python", "javascript" },
    highlight = { enable = true },
  },
}
