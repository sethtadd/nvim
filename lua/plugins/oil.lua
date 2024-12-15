return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    delete_to_trash = true,   -- Don't permanently delete files from oil
    watch_for_changes = true, -- Watch filesystem for changes and auto-reload oil
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
