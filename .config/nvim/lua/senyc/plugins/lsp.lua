local map = require('senyc.utils').default_map

return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/cmp-nvim-lsp' },
  lazy = false,
  config = function()
    local lspconfig = require 'lspconfig'
    local cmp = require 'cmp_nvim_lsp'

    local no_formatting = {
      'pyright'
    }

    local function on_attach(client, bufnr)
      local opts = { buffer = bufnr, remap = false, silent = true }
      -- Inspect cursor token
      map('n', 'K', vim.lsp.buf.hover, opts)
      -- Get definition
      map('n', 'gd', vim.lsp.buf.definition, opts)
      -- Get declaration
      map('n', 'gD', vim.lsp.buf.declaration, opts)
      -- Get symbol
      map('n', '<leader>gs', vim.lsp.buf.workspace_symbol, opts)
      -- Diagnostic QuickFix
      map('n', '<leader>dq', vim.diagnostic.setqflist, opts)
      -- Diagnostic open
      map('n', '<leader>do', vim.diagnostic.open_float, opts)
      -- Diagnostic previous
      map('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
      -- Diagnostic next
      map('n', '<leader>dn', vim.diagnostic.goto_next, opts)
      -- Code action
      map('n', '<leader>.', vim.lsp.buf.code_action, opts)
      -- Rename
      map('n', '<leader>r', vim.lsp.buf.rename, opts)
      -- Get references
      map('n', 'gr', vim.lsp.buf.references, opts)
      -- Get implementation
      map('n', '<leader>gi', vim.lsp.buf.implementation, opts)

      -- Format
      if (function()
            for _, val in pairs(no_formatting) do
              if val == client.name then
                return false
              end
            end
            return true
          end)()
      then
        map('n', '<leader>=', vim.lsp.buf.format, opts)
        map('v', '<leader>=', function()
            vim.lsp.buf.format()
            -- Escape visual mode
            vim.api.nvim_input('<esc>')
          end,
          opts
        )
      else
        map('n', '<leader>=', vim.cmd.Format)
      end
    end

    local servers = {
      'bashls',
      'tailwindcss',
      'clangd',
      'lua_ls',
      'pyright',
      'taplo',
      'tsserver',
      'jsonls',
      'yamlls',
      'gopls',
      'cssls',
      'sqlls',
      'solargraph'
    }

    for _, server in pairs(servers) do
      local config = {
        on_attach = on_attach,
        capabilities = cmp.default_capabilities(),
      }

      local ok, settings = pcall(require, 'senyc.lspsettings.' .. server)
      if ok then
        config = vim.tbl_deep_extend('force', settings, config)
      end
      lspconfig[server].setup(config)
    end

    local ok, settings = pcall(require, 'senyc.lspsettings.diagnostic_config')
    if ok then
      vim.diagnostic.config(settings)
    else
      -- Sets with the defaults
      vim.diagnostic.config()
    end

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })
    require 'lspconfig.ui.windows'.default_options.border = 'rounded'

    for type, icon in pairs({
      Error = '>>',
      Warn = '->',
      Hint = '>-',
      Info = '--'
    }) do
      local name = 'DiagnosticSign' .. type
      local mapping = { text = icon, texthl = name, numhl = '' }
      vim.fn.sign_define(name, mapping)
    end
  end
}
