return {
  -- Extend LSP servers via LazyVim opts
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/neodev.nvim" },
    },
    ---@param opts lspconfig.options
    opts = function(_, opts)
      opts.servers = opts.servers or {}

      -- gopls: proper filetypes + settings
      opts.servers.gopls = vim.tbl_deep_extend("force", opts.servers.gopls or {}, {
        filetypes = { "go", "gomod", "gotmpl", "templ" },
        settings = {
          gopls = {
            usePlaceholders = true,
            gofumpt = true,
          },
        },
      })

      -- Jinja LSP: enable only if executable exists to avoid Mason build (cargo) failures
      local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/jinja-lsp"
      local has_path = vim.fn.executable("jinja-lsp") == 1
      local has_mason_bin = vim.fn.filereadable(mason_bin) == 1
      if has_path or has_mason_bin then
        local jinja_cmd = has_mason_bin and { mason_bin } or nil
        opts.servers.jinja_lsp = vim.tbl_deep_extend("force", opts.servers.jinja_lsp or {}, {
          mason = false, -- don't try to auto-install
          filetypes = { "jinja", "html", "htmldjango", "j2" },
          cmd = jinja_cmd,
        })
      else
        opts.servers.jinja_lsp = nil
      end

      return opts
    end,
  },

  -- Ensure non-LSP tools are installed via mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local tools = {
        -- general
        "stylua",
        "shfmt",
        "shellcheck",
        -- go formatting
        "gofumpt",
        "goimports",
        -- js linter
        "quick-lint-js",
        -- jinja/django template formatter
        "djlint",
        -- java extras
        "java-debug-adapter",
        "java-test",
        -- ansible
        "ansible-language-server",
      }
      for _, t in ipairs(tools) do
        if not vim.tbl_contains(opts.ensure_installed, t) then
          table.insert(opts.ensure_installed, t)
        end
      end
    end,
  },
}
