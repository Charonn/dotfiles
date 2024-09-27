return {
  -- test
  '907th/vim-auto-save',
  config = function()
    vim.g.auto_save = 1 -- Enable auto-save
    vim.g.auto_save_silent = 0 -- Disable save messages
    vim.g.auto_save_write_all_buffers = 1
  end,
}
