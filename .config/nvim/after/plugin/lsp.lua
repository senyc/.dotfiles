local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")
lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'eslint',
  'pylsp',
  'clangd',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {}
})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Disable underline, it's very annoying
    underline = false,
    virtual_text = true,
    -- Enable virtual text, override spacing to 4
    -- virtual_text = {spacing = 4},
    update_in_insert = true
  })

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  client.server_capabilities.semanticTokensProvider = nil
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  -- Set sign icons
  lsp.set_sign_icons({
    error = '>>',
    warn = '->',
    hint = '>-',
    info = '--'
  })

end)
lsp.setup_servers_on_start = true
lsp.setup()

------ Server specific configuration ------
-- bash
lspconfig.bashls.setup{}
lspconfig.html.setup{}
--Ruby
lspconfig.solargraph.setup{}
-- Python
lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {'E302'},
                    maxLineLength = 100
                }
            }
        }
    }
}

