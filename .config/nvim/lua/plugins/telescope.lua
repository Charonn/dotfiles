-- Fuzzy finder
return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
      -- Lazy-load actions-preview
      {
        'aznhe21/actions-preview.nvim',
        lazy = true, -- Lazy-load actions-preview
        config = function()
          require("actions-preview").setup {
            diff = {
              algorithm = "patience", -- Configure diff algorithm for code actions
              ignore_whitespace = true, -- Ignore whitespace in diffs
            },
            telescope = require("telescope.themes").get_dropdown {
              winblend = 10, -- Make the dropdown transparent
            },
          }
        end,
      },   },
  },
  opts = {
    defaults = {
      layout_config = {
        vertical = {
          mirror = true,
          width = 0.75,
          height = 0.5
        }
      }
    },
    pickers = {
      -- Configure the picker for LSP code actions
      lsp_code_actions = {
        theme = "dropdown", -- Use the dropdown theme for code actions
        layout_config = {
          width = 0.5,
          height = 0.4,
        },
      },
    },
  }
}
