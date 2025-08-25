
mason = require("mason")
mason_lsp = require("mason-lspconfig")


mason.setup()
mason_lsp.setup({
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
    },
})
