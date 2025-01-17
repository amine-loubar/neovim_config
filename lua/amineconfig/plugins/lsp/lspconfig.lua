return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local function on_attach(client, bufnr)
            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
            end

            map("n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
            map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
            map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
            map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations")
            map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
            map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "See available code actions")
            map("n", "<leader>rn", vim.lsp.buf.rename, "Smart rename")
            map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
            map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
            map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
            map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")
            map("n", "K", vim.lsp.buf.hover, "Show documentation for cursor")
            map("n", "<leader>rs", ":LspRestart<CR>", "Restart LSP")
        end

        -- Add diagnostic symbols
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        -- Configure LSP servers
        local servers = {
            "html",
            "cssls",
            "eslint",
            "ts_ls",
            "volar",
            "tailwindcss",
            "emmet_ls",
            "lua_ls",
        }

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        -- Configure Intelephense with type safety removed
        lspconfig.intelephense.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                intelephense = {
                    diagnostics = {
                        undefinedTypes = false,  -- Disable undefined type diagnostics
                        undefinedFunctions = true,  -- Disable undefined function diagnostics
                        undefinedConstants = true,  -- Disable undefined constant diagnostics
                        undefinedClassConstants = false,  -- Disable undefined class constant diagnostics
                        undefinedMethods = false,  -- Disable undefined method diagnostics
                    },
                },
            },
        })
    end,
}
