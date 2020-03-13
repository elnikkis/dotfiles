" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile Snakefile,*.Snakefile setfiletype snakemake
augroup END

