
return {
    "mbbill/undotree",
    keys = {
        { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
    config = function()
        vim.o.undofile = true
        vim.o.undodir = os.getenv("HOME") .. "/.dotfiles/.config/nvim/undo"
        vim.o.undolevels = 1000
        vim.o.undoreload = 10000
        vim.g.undotree_SetFocusWhenToggle = 1
    end, 
}
