local lspconfig = require('lspconfig')
local util = require 'lspconfig/util'
local cmp = require("cmp_nvim_lsp")

local servers = {
  'bashls',
  'tailwindcss',
  'clangd',
  'lua_ls',
  'pyright',
  'taplo',
  'tsserver',
  'jsonls',
}

-- Default formatting action
vim.keymap.set("n", "<leader>=", ':Format<cr>', { remap = false, silent = true })

local function on_attach_pyright(_, bufnr)
  local opts = { buffer = bufnr, remap = false, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>gs", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

-- To use the current client replace _ with client
local function on_attach(_, bufnr)
  local opts = { buffer = bufnr, remap = false, silent = true }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- Get symbols
  vim.keymap.set("n", "<leader>gs", vim.lsp.buf.workspace_symbol, opts)
  -- View diagnostics
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  -- set up similar to the default [ and ] actions
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)
  -- Rename
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
  -- Get references
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, opts)
  vim.keymap.set("v", "<leader>=", function()
      vim.lsp.buf.format()
      -- Escape visual mode
      vim.api.nvim_input("<esc>")
    end,
    opts
  )
end

local capabilities = cmp.default_capabilities()
-- Configure auto completion capabilities and keybinds for language server
for _, lsp in pairs(servers) do
  local configurations = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == 'lua_ls' then
    configurations.settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
        format = {
          enable = true,
        },
      },
    }
  elseif lsp == 'html' then
    configurations.settings = {
      css = {
        lint = {
          validProperties = {},
        },
      },
    }
  elseif lsp == 'pyright' then
    -- To get default formatting functionality
    configurations.on_attach = on_attach_pyright
    -- Don't know why I have to do this myself
    configurations.root_dir = function(fname)
      local root_files = {
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        'pyrightconfig.json',
        '.git'
      }
      return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
    end
    configurations.settings = {
      single_file_support = true,
      pyright = {
        autoImportCompletion = true,
        typeCheckingMode = 'off',
      },
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'openFilesOnly',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'off'
        }
      }
    }
  elseif lsp == 'tsserver' then
    -- quoteStyle config doesn't seem to be applying likely issue w/ tsserver
    configurations.settings = {
      preferences = {
        organizeImportsIgnoreCase = true
      },
      javascript = {
        format = {
          semicolons = "insert",
        },
        preferences = {
          quoteStyle = "single"
        },
      },
      typescript = {
        format = {
          semicolons = "insert",
        },
        preferences = {
          quoteStyle = "single"
        },
      },
    }
  end

  -- Actually set up the languages server
  lspconfig[lsp].setup(configurations)
end

local config = {
  virtual_text = {
    spacing = 2,
  },
  signs = true,
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

local signs = {
  Error = '>>',
  Warn = '->',
  Hint = '>-',
  Info = '--'
}

for type, icon in pairs(signs) do
  local name = "DiagnosticSign" .. type
  local mapping = { text = icon, texthl = name, numhl = "" }
  vim.fn.sign_define(name, mapping)
end
