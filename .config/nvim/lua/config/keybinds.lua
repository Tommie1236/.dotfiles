vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>h", "<cmd>ClangdSwitchSourceHeader<CR>")
vim.keymap.set("n", "<leader>h", function()
    vim.lsp.buf.execute_command({
        command = "clangd.switchSourceHeader",
        arguments = { vim.api.nvim_buf_get_name(0) },
    })
end, { buffer = bufnr })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

for i = 1, 9 do
  vim.keymap.set("n", "<A-" .. i .. ">", i .. "gt")
end
vim.keymap.set("n", "<A-0>", "<cmd>10gt<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")
