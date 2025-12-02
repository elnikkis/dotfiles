-- Main Neovim configuration entry point
if vim.loader then vim.loader.enable() end

-- Python host configuration
vim.g.python3_host_prog = vim.fn.expand('$HOME') .. '/venv/neovim/bin/python3'


require("config.lazy")

-- Source existing vim configuration for compatibility
local rc_vim = vim.fn.expand('~/.vim/rc.vim')
if vim.fn.filereadable(rc_vim) == 1 then
  vim.cmd('source ' .. rc_vim)
end
