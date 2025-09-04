-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.set("n", "<leader>y", '"+yy')
keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>r", function()
  -- Get the word under the cursor
  local word = vim.fn.expand("<cword>")
  -- Escape it for literal search (very nomagic)
  word = "\\V" .. word
  -- Pre-fill the command line for the whole file
  vim.fn.feedkeys(":%s/" .. word .. "/")
end, { noremap = true, silent = true })

keymap.set("n", "grg", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap.set("n", "grD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
-- keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
-- keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
-- keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>")
-- keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
-- keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
-- keymap.set("n", "<leader>ga", function()
--   require("actions-preview").code_actions()
-- end, { noremap = true, silent = true })
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
-- Toggle diagnostics virtual lines for less noise when desired
vim.keymap.set("n", "<leader>uV", function()
  local cfg = vim.diagnostic.config()
  local enabled = not (cfg.virtual_lines == true)
  vim.diagnostic.config({ virtual_lines = enabled })
  local ok, Snacks = pcall(require, "snacks")
  if ok then
    Snacks.notify((enabled and "Enabled" or "Disabled") .. " diagnostic virtual lines", { title = "Diagnostics" })
  else
    vim.notify((enabled and "Enabled" or "Disabled") .. " diagnostic virtual lines", vim.log.levels.INFO)
  end
end, { desc = "Toggle diagnostic virtual lines" })
-- Use nvim-cmp defaults for completion; avoid conflict with tmux navigation
-- (was: insert-mode <C-Space> mapping)
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qN", ":cprev<CR>") -- jump to prev quickfix list item

vim.keymap.set("n", "<leader>l", function()
  -- Restart all LSPs
  vim.cmd("LspRestart")

  -- Show notification
  vim.notify("LSP restarted", vim.log.levels.INFO, { title = "LSP" })
end, { desc = "Restart LSP and notify" })

vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>", { desc = "Obsidian: Today" })
vim.keymap.set("n", "<leader>oy", "<cmd>ObsidianYesterday<CR>", { desc = "Obsidian: Yesterday" })
vim.keymap.set("n", "<leader>om", "<cmd>ObsidianTomorrow<CR>", { desc = "Obsidian: Tomorrow" })
vim.keymap.set("n", "<leader>on", function()
  -- Create new buffer and ensure it's modifiable
  vim.cmd("enew")
  vim.bo.modifiable = true
  vim.bo.buftype = "" -- Ensure it's a normal buffer
  vim.bo.filetype = "markdown" -- Set filetype to markdown
  vim.cmd("ObsidianNew")
end, { desc = "Obsidian: New Note" })
vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianDailies<CR>", { desc = "Obsidian: This Week" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Obsidian: Search" })
local wk = require("which-key")
wk.add({
  -- File-related keymaps
  { "<leader>o", group = "Obsidian" },
  { "<leader>ot", desc = "Today" },
  { "<leader>oy", desc = "Yesterday" },
  { "<leader>om", desc = "Tomorrow" },
  { "<leader>ow", desc = "This week" },
  { "<leader>os", desc = "Search" },
})
local nvim_tmux_nav = require("nvim-tmux-navigation")

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)

-- keymap.set("n", "<leader>co", function()
--   vim.lsp.buf.code_action()
-- end, { noremap = true, silent = true })
-- keymap.set("v", "<leader>co", function()
--   vim.lsp.buf.code_action()
-- end, { noremap = true, silent = true })
