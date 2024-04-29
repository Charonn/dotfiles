-- File Explorer / Tree
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },
  opts = {
    actions = {
      open_file = {
        window_picker = {
          enable = false
        },
      }
    },
  },
  config = function (_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded = 1
    vim.g.loaded_netrwPlugin = 1
    vim.g.nvim_tree_quit_on_open = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_respect_buf_cwd = 1
    require("nvim-tree").setup(opts)
  end
}

