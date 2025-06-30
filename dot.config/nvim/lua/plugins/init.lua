-- Plugin specifications for lazy.nvim
-- Migrated from dein.toml and deinlazy.toml

return {
  -- Colorscheme
  {
    "w0ng/vim-hybrid",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("hybrid")
    end,
  },

  -- Comment plugin
  {
    "tyru/caw.vim",
    keys = { "gc", "gcc" },
  },

  -- Filetype plugins
  {
    "cespare/vim-toml",
    ft = "toml",
  },
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

  -- LSP and completion setup
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    ft = { "python", "c", "cpp", "java", "typescript", "javascript" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "clangd", "jdtls", "tsserver" },
        automatic_installation = true,
      })
    end,
  },

  -- Denops ecosystem
  {
    "vim-denops/denops.vim",
    event = { "BufEnter", "CursorHold" },
  },

  -- DDC completion
  {
    "Shougo/ddc.vim",
    dependencies = { "denops.vim", "Shougo/pum.vim" },
    event = { "InsertEnter", "CursorHold" },
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
  {
    "Shougo/pum.vim",
    dependencies = "ddc.vim",
  },
  {
    "Shougo/ddc-ui-pum",
    dependencies = "ddc.vim",
  },
  {
    "Shougo/ddc-source-around",
    dependencies = "ddc.vim",
  },
  {
    "Shougo/ddc-matcher_head",
    dependencies = "ddc.vim",
  },
  {
    "Shougo/ddc-matcher_length",
    dependencies = "ddc.vim",
  },
  {
    "Shougo/ddc-sorter_rank",
    dependencies = "ddc.vim",
  },
  {
    "Shougo/ddc-source-lsp",
    dependencies = "ddc.vim",
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = { "ddc.vim", "mason.nvim", "mason-lspconfig.nvim", "ddc-source-lsp" },
    ft = { "python", "c", "cpp", "java", "typescript", "javascript" },
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Setup language servers
      lspconfig.pyright.setup({})
      lspconfig.clangd.setup({
        cmd = { "clangd-11" },
      })
      lspconfig.jdtls.setup({})
      lspconfig.tsserver.setup({})

      -- Setting for ddc-source-lsp
      local capabilities = require("ddc_source_lsp").make_client_capabilities()
      lspconfig.denols.setup({
        capabilities = capabilities,
      })

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

  -- Denops preview and signature help
  {
    "matsui54/denops-popup-preview.vim",
    dependencies = { "denops.vim", "ddc.vim", "pum.vim" },
    config = function()
      vim.fn["popup_preview#enable"]()
    end,
  },

  {
    "matsui54/denops-signature_help",
    dependencies = "denops.vim",
    config = function()
      vim.fn["signature_help#enable"]()
      vim.g.lsp_signature_help_enabled = 0
    end,
  },
}