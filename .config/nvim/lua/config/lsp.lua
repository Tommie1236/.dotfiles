local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "H", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    

end


-- setup all lsp servers
local servers = {
    "lua_ls",
    "clangd",
    "cmake", 
    "bashls",
    "pyright",
    "marksman",
    "jsonls",
    "yamlls",
    "asm_lsp",
    "arduino_language_server",
}

for _, lsp in ipairs(servers) do
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach,
    }

    if lsp == "clangd" then
        opts.cmd = { "clangd", "--compile-commands-dir=Code/build" }
    end
    if lsp == "arduino_language_server" then
        opts.cmd = {"arduino-language-server",
                    "-cli-config", "/home/timoo/.arduino15/arduino-cli.yaml",
                    "-fqbn", "arduino:avr:uno",
                    "-cli", "/home/timoo/bin/arduino-cli",
                    "-clangd", "/usr/bin/clangd",}
    end

    lspconfig[lsp].setup(opts)
end
