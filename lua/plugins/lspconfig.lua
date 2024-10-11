return {
  'neovim/nvim-lspconfig',
  dependencies = { 'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp' },
  config = function()
    require('mason-lspconfig').setup {
      ensure_installed = { "pyright", "ts_ls", "lua_ls" },
    }

    local lspconfig = require('lspconfig')

    -- Set up nvim-cmp capabilities with LSP
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = function(_, bufnr)
      -- Format on save
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function() vim.lsp.buf.format() end, {})
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
    end

    -- Setup LSP servers with mason integration
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        -- Settings for individual servers
        local settings = {}
        if server_name == "lua_ls" then
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          }
        end

        -- Setup LSP servers
        lspconfig[server_name].setup {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          },
          settings = settings,
        }
      end,
    }
  end,
}
