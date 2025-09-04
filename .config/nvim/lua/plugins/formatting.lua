return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.go = { "gofumpt", "goimports" }
      opts.formatters_by_ft.jinja = { "djlint" }
      opts.formatters_by_ft.jinja2 = { "djlint" }
      opts.formatters_by_ft.htmldjango = { "djlint" }
      opts.format_on_save = opts.format_on_save or {}
      if opts.format_on_save.lsp_fallback == nil then
        opts.format_on_save.lsp_fallback = true
      end
      return opts
    end,
  },
}
