-- Status line
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Fancy icons
    'linrongbin16/lsp-progress.nvim', -- LSP loading progress
  },
  opts = {
    options = {
      theme = 'codedark', -- Lualine theme
      section_separators = { left = '', right = '' }, -- Optional: fancier separators
      component_separators = { left = '', right = '' }, -- Optional: fancier separators
    },
    sections = {
      lualine_a = { 'mode' }, -- Shows the current mode (e.g., INSERT, NORMAL, etc.)
      lualine_b = { 'branch', 'diff', 'diagnostics' }, -- Shows git branch, diffs, and diagnostics info
      lualine_c = {
        {
          -- Customize the filename part of lualine to be parent/filename
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = false,  -- Display new file status (new file means no write after created)
          path = 4,                -- 4: Filename and parent dir, with tilde as the home directory
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          }
        },
        {
          -- Macro recording indicator
          function()
            local rec_reg = vim.fn.reg_recording()
            if rec_reg ~= '' then
              return 'Recording @' .. rec_reg
            else
              return ''
            end
          end,
          cond = function()
            return vim.fn.reg_recording() ~= ''
          end,
        },
      },
      lualine_x = { 'encoding', 'fileformat', 'filetype' }, -- Shows encoding, file format, and file type
      lualine_y = { 'progress' }, -- Shows progress in the file
      lualine_z = { 'location' }, -- Shows line and column location
    },
    inactive_sections = {
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
    },
  }
}
