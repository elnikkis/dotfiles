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
    {
        "catgoose/nvim-colorizer.lua",
        ft = { "css", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        opts = {
            filetypes = {
                "css",
                "html",
                "javascript",
                "typescript",
                "javascriptreact",
                "typescriptreact",
            },
            options = {
                parsers = {
                    css = true,        -- hex, rgb(), hsl() など一括有効化
                    tailwind = {
                        enable = true,   -- bundled済みのTailwindカラー名をハイライト
                        lsp = false,     -- LSP未導入なのでfalse
                    },
                },
                display = {
                    mode = "background", -- カラーコードの背景色でプレビュー
                },
            },
        },
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
