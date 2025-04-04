-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_mini_snippets_in_completion = true
vim.g.lazyvim_picker = "telescope"
local o = vim.opt
o.spelllang = { "en", "de" }
vim.diagnostic.config({ virtual_lines = true })
