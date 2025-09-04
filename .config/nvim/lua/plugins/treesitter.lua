return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      local more = {
        "go",
        "gomod",
        "gowork",
        "gotmpl",
        "templ",
        -- jinja2 has no official Treesitter parser; use Vim syntax plugin instead
      }
      for _, p in ipairs(more) do
        if not vim.tbl_contains(opts.ensure_installed, p) then
          table.insert(opts.ensure_installed, p)
        end
      end
    end,
  },
}
