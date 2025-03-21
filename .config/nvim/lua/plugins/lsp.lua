return {
  -- LSP Configuration
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    -- LSP Manager Plugins
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    { "WhoIsSethDaniel/mason-tool-installer.nvim" },

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    { "folke/neodev.nvim" },
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- Update this list to the language servers you need installed
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "gradle_ls",
        "gopls",
        -- "groovyls",
        "lua_ls",
        -- "intelephense", # requires npm to be installed
        "jsonls",
        "lemminx",
        "marksman",
        "quick_lint_js",
        "templ",
        "tailwindcss",
        -- "tsserver", # requires npm to be installed
        "yamlls",
        "jdtls",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "ansible-language-server",
        "java-debug-adapter",
        "java-test",
      },
    })

    vim.api.nvim_command("MasonToolsInstall")

    local lspconfig = require("lspconfig")
    -- local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lsp_attach = function(client, bufnr)
      -- Add gopls specific formatting on save
      if client.name == "gopls" then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = true })
          end,
        })
      end
      -- Create your keybindings here...
    end

    -- Configure gopls to handle .tmpl files
    require("lspconfig").gopls.setup({
      settings = {
        filetypes = { "go", "gomod", "tmpl", "gotmpl", "templ" },
        gopls = {
          usePlaceholders = true,
          gofumpt = true, -- If you prefer to use gofumpt for formatting
        },
      },
      on_attach = lsp_attach, -- Ensure your on_attach function is used
    })

    -- Call setup on each LSP server
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        if server_name ~= "jdtls" then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
        end
      end,
    })

    -- Lua LSP settings
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    })

    -- Jinja LSP settings
    lspconfig.jinja_lsp.setup({
      cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jinja-lsp") }, -- Adjust the path if needed
      filetypes = { "jinja", "html", "htmldjango", "j2" }, -- Ensure correct filetypes
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname) or vim.loop.cwd()
      end,
      capabilities = lsp_capabilities,
      on_attach = lsp_attach,
    })
  end,
}
