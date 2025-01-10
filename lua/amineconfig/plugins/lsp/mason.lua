return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

             -- enable mason and configure icons
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })


            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls", 
                    "ts_ls", 
                    "eslint", 
                    "stimulus_ls",
                    "html",
                    "cssls",
                    "tailwindcss",
                    "lua_ls",
                    "emmet_language_server",
                    "volar",
                    "intelephense"
                },
                automatic_installation = true,
            })

        end;
    }
}