return {
  'akinsho/bufferline.nvim',
  version = "*",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    options = {
      -- modified_icon = "󰆓",
      tab_size = 18,
      show_buffer_icons = false,
    },
  },
}
