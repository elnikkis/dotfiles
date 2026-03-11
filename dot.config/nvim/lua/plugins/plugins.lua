-- Main plugins collection
-- This file imports and aggregates all plugin configurations

return {
    -- Filetype plugins
    {
        "rbtnn/vim-vimscript_indentexpr",
        ft = "vim",
    },
    {
        "Vimjas/vim-python-pep8-indent",
        ft = { "python", "python3", "snakemake" },
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
    },
    {
        "chase/vim-ansible-yaml",
        ft = { "ansible", "yaml" },
    },
    {
        "ShaiberAlon/snakemake-vim",
        ft = "snakemake",
    },
    {
        "cespare/vim-toml",
        ft = "toml",
    },

    -- Denops ecosystem
    {
        "vim-denops/denops.vim",
        event = { "VeryLazy", "BufEnter", "CursorHold" },
    },

    -- UI enhancements
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            indent = {
                char = "|",
            },
        },
    },
}
