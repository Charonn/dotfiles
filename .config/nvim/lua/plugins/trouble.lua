return {
  "folke/trouble.nvim",
  opts = {
    position = "bottom", -- Ensure it opens at the bottom
    height = 10, -- Adjust height as needed
    mode = "workspace_diagnostics", -- Default mode (adjust if needed)
    auto_open = true, -- Automatically open when there are diagnostics
  },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
  },
}
