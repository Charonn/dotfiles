local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local config = {
  cmd = {"gopls"},
  root_dir = util.root_pattern("go.mod", ".git"),
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
}

-- Attach or start `gopls` using `lspconfig`
lspconfig.gopls.setup(config)
