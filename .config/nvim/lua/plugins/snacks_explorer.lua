return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      -- show dot-files (like `.env`)
      hidden = true,
      -- show files/directories in .gitignore (like node_modules)
      ignored = true,
      -- (optional) but often useful: still exclude huge dirs from searches
      exclude = { "node_modules", ".git" },
      -- any other explorer-specific settings go here…
    },
    picker = {
      hidden = true,
      ignored = true,
      exclude = { "node_modules", ".git" },
    },
  },
}
