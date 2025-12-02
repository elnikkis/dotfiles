-- Neovim options configuration
-- Migrated from init.vim settings

-- Basic settings
vim.opt.compatible = false
vim.opt.encoding = 'utf-8'

-- Enable filetype detection, plugins, and indentation
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

-- Set background and colorscheme will be handled by plugins