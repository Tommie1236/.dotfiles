
return {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "pyright",
                "lua_ls",
                "cmake",
                "bashls",
                "marksman",
                "jsonls",
                "yamlls",
                "asm_lsp",
                "arduino_language_server",
            },
        })
    end,
}
