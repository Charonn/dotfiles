return {
  "Pocco81/auto-save.nvim",
  lazy = false,
  opts = {
    debounce_delay = 5000,
    execution_message = {
      message = function()
        return ""
      end,
    },
    condition = function(buf)
      local fn = vim.fn
      local utils = require("auto-save.utils.data")

      if
        fn.getbufvar(buf, "&modifiable") == 1
        -- change here is adding harpoon file type to exclusion list 
        and utils.not_in(fn.getbufvar(buf, "&filetype"), { "harpoon" })
      then
        return true
      end
      return false
    end,
  },
  keys = {
    { "<leader>uv", "<cmd>ASToggle<CR>", desc = "Toggle autosave" },
  },
}
