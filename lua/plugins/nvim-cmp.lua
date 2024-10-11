return {
  'hrsh7th/nvim-cmp',           -- Auto-completion plugin
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',     -- LSP source for nvim-cmp
    'hrsh7th/cmp-buffer',       -- Buffer completions
    'hrsh7th/cmp-path',         -- Path completions
    'hrsh7th/cmp-cmdline',      -- Command-line completions
    'saadparwaiz1/cmp_luasnip', -- Snippet completions
    'L3MON4D3/LuaSnip',         -- Snippets plugin
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users
        end,
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      })
    })

    -- Set configuration for specific filetypes
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the git completion source if available
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (search mode)
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for `:` (command line)
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}