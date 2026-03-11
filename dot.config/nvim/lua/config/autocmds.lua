-- Autocommands configuration
-- Most autocommands will come from the shared vim config (~/.vim/rc.vim)

vim.filetype.add({
  pattern = {
    [".*%.Snakefile"] = "snakemake",
  },
})
