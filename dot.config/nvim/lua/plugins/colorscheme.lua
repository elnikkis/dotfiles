return {
    {
        "w0ng/vim-hybrid",
        lazy = false,
        priority = 1000,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme hybrid]])
        end,
    },
}
