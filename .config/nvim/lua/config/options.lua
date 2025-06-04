-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_mini_snippets_in_completion = true
vim.g.lazyvim_picker = "telescope"
vim.diagnostic.config({ virtual_lines = true })

local opt = vim.opt
opt.spelllang = { "en", "de" }
opt.scrolloff = 8
vim.g.markdown_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
