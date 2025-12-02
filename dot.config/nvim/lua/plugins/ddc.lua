return {
    -- DDC completion
    {
        "Shougo/ddc.vim",
        dependencies = {
            "vim-denops/denops.vim",
            "Shougo/pum.vim",
            "Shougo/ddc-ui-pum",
            "Shougo/ddc-source-around",
            "Shougo/ddc-filter-matcher_head",
            "Shougo/ddc-filter-matcher_length",
            "Shougo/ddc-filter-sorter_rank",
            "Shougo/ddc-source-lsp",
            "matsui54/denops-popup-preview.vim",
            "matsui54/denops-signature_help",
        },
        event = { "VeryLazy", "InsertEnter", "CursorHold" },
        config = function()
            vim.fn["ddc#custom#patch_global"]("sources", { "around" })
            vim.fn["ddc#custom#patch_global"]("sourceOptions", {
                _ = {
                    matchers = { "matcher_head", "matcher_length" },
                    sorters = { "sorter_rank" },
                },
                around = {
                    mark = "A",
                },
                lsp = {
                    mark = "lsp",
                    forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
                },
            })

            vim.fn["ddc#custom#patch_global"]("sourceParams", {
                lsp = {
                    snippetEngine = vim.fn["denops#callback#register"](function(body)
                        return vim.fn["vsnip#anonymous"](body)
                    end),
                    enableResolveItem = true,
                    enableAdditionalTextEdit = true,
                }
            })

            if vim.fn.has("nvim") == 1 then
                vim.fn["ddc#custom#patch_filetype"]({ "python", "c", "cpp", "java" }, "sources", { "lsp", "around" })

                vim.fn["ddc#custom#patch_global"]("autoCompleteEvents", {
                    "InsertEnter", "TextChangedI", "TextChangedP",
                    "CmdlineEnter", "CmdlineChanged", "TextChangedT",
                })
                vim.fn["ddc#custom#patch_global"]("ui", "pum")

                -- Keymaps
                vim.keymap.set("i", "<C-n>", function() vim.fn["pum#map#insert_relative"](1) end)
                vim.keymap.set("i", "<C-p>", function() vim.fn["pum#map#insert_relative"](-1) end)
                vim.keymap.set("i", "<C-y>", function() vim.fn["pum#map#confirm"]() end)
                vim.keymap.set("i", "<C-e>", function() vim.fn["pum#map#cancel"]() end)
                vim.keymap.set("i", "<PageDown>", function() vim.fn["pum#map#insert_relative_page"](1) end)
                vim.keymap.set("i", "<PageUp>", function() vim.fn["pum#map#insert_relative_page"](-1) end)

                vim.fn["ddc#enable"]()
            end
        end,
    },

    -- DDC dependencies
    -- {
    --     "Shougo/pum.vim",
    --     dependencies = "ddc.vim",
    --     lazy = true,
    -- },
    -- {
    --     "Shougo/ddc-ui-pum",
    --     dependencies = "ddc.vim",
    --     lazy = true,
    -- },
    -- {
    --     "Shougo/ddc-source-around",
    --     dependencies = "ddc.vim",
    --     lazy = true,
    -- },
    -- {
    --     "Shougo/ddc-matcher_head",
    --     dependencies = "ddc.vim",
    --     lazy = true,
    -- },
    -- {
    --     "Shougo/ddc-matcher_length",
    --     dependencies = "ddc.vim",
    --     lazy = true,
    -- },
    -- {
    --     "Shougo/ddc-sorter_rank",
    --     dependencies = "ddc.vim",
    --     lazy = true,
    -- },
    -- {
    --     "Shougo/ddc-source-lsp",
    --     dependencies = "ddc.vim",
    --     lazy = true,
    -- },
    -- Denops preview and signature help
    {
        "matsui54/denops-popup-preview.vim",
        dependencies = { "denops.vim" },
        lazy = true,
        config = function()
            vim.fn["popup_preview#enable"]()
        end,
    },

    {
        "matsui54/denops-signature_help",
        dependencies = "denops.vim",
        lazy = true,
        config = function()
            vim.fn["signature_help#enable"]()
            vim.g.lsp_signature_help_enabled = 0
        end,
    },

}
