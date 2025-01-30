return {
  'b0o/incline.nvim',
  event = 'VeryLazy', -- Lazy load incline
  opts = {
    window = {
      padding = 2,
      margin = {
        vertical = {
          top = 2,
          bottom = 0,
        },
        horizontal = {
          left = 0,
          right = 2,
        },
      },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
      local icon, color = require('nvim-web-devicons').get_icon_color(filename)

      local modified = vim.bo[props.buf].modified

      local segments = {}

      if icon and #icon then
        table.insert(segments, { icon, guifg = color })
        table.insert(segments, { ' ' })
      end

      table.insert(segments, { filename })

      if modified then
        table.insert(segments, { ' ', guifg = 'red' })
      end

      return segments
    end,
  }
}
