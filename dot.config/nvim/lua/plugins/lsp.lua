return {
    -- LSP and completion setup
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonLog",
            "MasonUpdate",
            "MasonUninstall",
            "MasonUninstallAll",
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        ft = { "python", "c", "cpp", "java", "typescript", "javascript" },
        opts = {
            ensure_installed = { "pyright", "clangd", "jdtls", "ts_ls" },
            automatic_enable  = true,
        }
    },

    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        dependencies = { "ddc.vim", "ddc-source-lsp" },
        lazy = true,
        -- ft = { "python", "c", "cpp", "java", "typescript", "javascript" },
        config = function()
            -- vim.lsp.enable({'pyright', 'clangd', 'jdtls', 'ts_ls'})
            vim.lsp.config('clangd', {
                cmd = { "clangd-11" },
            })
            vim.lsp.config('*', {
                capabilities = require("ddc_source_lsp").make_client_capabilities(),
            })


            -- local lspconfig = require("lspconfig")
            --
            -- -- Setup language servers
            -- lspconfig.pyright.setup({})
            -- lspconfig.clangd.setup({
            --     cmd = { "clangd-11" },
            -- })
            -- lspconfig.jdtls.setup({})
            -- lspconfig.tsserver.setup({})
            --
            -- -- Setting for ddc-source-lsp
            -- local capabilities = require("ddc_source_lsp").make_client_capabilities()
            -- lspconfig.denols.setup({
            --     capabilities = capabilities,
            -- })

            -- Global mappings
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

            -- LSP attach autocommand
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<space>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
        end,
    },


}
