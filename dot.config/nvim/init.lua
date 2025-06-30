-- Main Neovim configuration entry point
-- Migrated from init.vim to init.lua

-- Python host configuration
vim.g.python3_host_prog = vim.fn.expand('$HOME') .. '/venv/neovim/bin/python3'


require("config.lazy")

-- Bootstrap lazy.nvim plugin manager
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable",
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

-- Load configuration modules
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- -- Load plugins
-- require("lazy").setup("plugins", {
--   defaults = {
--     lazy = true,
--   },
--   install = {
--     colorscheme = { "hybrid" },
--   },
--   checker = {
--     enabled = true,
--   },
-- })

-- Source existing vim configuration for compatibility
local rc_vim = vim.fn.expand('~/.vim/rc.vim')
if vim.fn.filereadable(rc_vim) == 1 then
  vim.cmd('source ' .. rc_vim)
end
