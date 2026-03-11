-- Autocommands configuration
-- Most autocommands will come from the shared vim config (~/.vim/rc.vim)

vim.filetype.add({
  filename = {
    ["Snakefile"] = "snakemake",
  },
  pattern = {
    ["*.Snakefile"] = "snakemake",
  },
})