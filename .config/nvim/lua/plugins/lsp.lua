-- LSP Support
return {
  -- LSP Configuration
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Manager Plugins
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    {'folke/neodev.nvim' },
  },
  config = function ()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Update this list to the language servers you need installed
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "gradle_ls",
        -- "groovyls",
        "lua_ls",
        -- "intelephense", # requires npm to be installed
        "jsonls",
        "jinja_lsp",
        "lemminx",
        "marksman",
        "quick_lint_js",
        -- "tsserver", # requires npm to be installed
        "yamlls",
        "jdtls"
      }
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        "ansible-language-server",
        "java-debug-adapter",
        "java-test"
      }
    })

    vim.api.nvim_command('MasonToolsInstall')

    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Create your keybindings here...
    end

    -- Call setup on each LSP server
    require('mason-lspconfig').setup_handlers({
      function(server_name)
        if server_name ~= "jdtls" then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      end
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    }
    -- local workspace_folder = "/home/mhufnagel-local/workspace" -- Define a custom workspace folder
    -- lspconfig.jdtls.setup {
    --   cmd = { 'jdtls', '-data', workspace_folder },
    --   -- additional configuration...
    -- }
    lspconfig.jinja_lsp.setup {
      cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jinja-lsp') },  -- Adjust the path if needed
      filetypes = { 'jinja', 'html', 'htmldjango', 'j2' },  -- Ensure correct filetypes
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.cwd()
      end,
      capabilities = lsp_capabilities,
      on_attach = lsp_attach,
    }
  end
}

