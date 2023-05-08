local lsp_zero = require('lsp-zero')
local lspconfig = require('lspconfig')

local servers = {
  'tsserver',
  'eslint',
  'pylsp',
  'clangd',
  'bashls',
  'cssls',
  'html',
  'solargraph',
  'bashls',
  'lua_ls'
}

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

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
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Configure auto completion capabilities and keybinds for language server
for _, lsp in ipairs(servers) do
   local configurations = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- Checks for some specific language servers that require specific settings
  --   TODO pull this out into another file
  if lsp == 'lua_ls' then
    configurations.settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    }

  elseif lsp == 'pylsp' then
    local pystyle_ignore = {'e302'}
    configurations.settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = pystyle_ignore,
            maxlinelength = 100
          }
        }
      }
    }

  elseif lsp == 'html' then
    configurations.settings = {
      css = {
        lint = {
          validProperties = {},
        },
      },
    }
  end

  -- Actually set up the languages server
  lspconfig[lsp].setup(configurations)
end

local signs = {
  error = '>>',
  warn = '->',
  hint = '>-',
  info = '--'
}

lsp_zero.set_sign_icons(signs)

local diagnostic_signs = {
  { name = "DiagnosticSignError", text = signs.error },
  { name = "DiagnosticSignWarn", text = signs.warn },
  { name = "DiagnosticSignHint", text = signs.hint },
  { name = "DiagnosticSignInfo", text = signs.info },
}

local config = {
  virtual_text = {spacing = 2},
  -- show signs
  signs = {
    active = diagnostic_signs,
  },
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    suffix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

