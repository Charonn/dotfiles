return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local ok, dap = pcall(require, "dap")
      if not ok then
        return
      end
      -- enable verbose dap logging to capture startup errors
      dap.set_log_level("TRACE")
      vim.api.nvim_create_user_command("DapShowLog", function()
        local log = vim.fn.stdpath("state") .. "/dap.log"
        vim.cmd("tabnew " .. vim.fn.fnameescape(log))
      end, { desc = "Open nvim-dap log" })
    end,
    keys = {
      { "<leader>dL", "<cmd>DapShowLog<CR>", desc = "Open DAP log" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- provide a command to inspect the LSP log when needed
      vim.api.nvim_create_user_command("LspShowLog", function()
        local log = vim.fn.stdpath("state") .. "/lsp.log"
        vim.cmd("tabnew " .. vim.fn.fnameescape(log))
      end, { desc = "Open LSP log" })
      return opts
    end,
    keys = {
      { "<leader>lL", "<cmd>LspShowLog<CR>", desc = "Open LSP log" },
    },
  },
  {
    "folke/noice.nvim",
    optional = true,
    keys = {
      { "<leader>un", "<cmd>Noice history<CR>", desc = "Noice history" },
    },
  },
}

