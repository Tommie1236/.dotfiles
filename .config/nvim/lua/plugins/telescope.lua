return {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
    },
    config = function()
        local buildin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff', buildin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', buildin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', buildin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', buildin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fs', buildin.grep_string, { desc = 'Telescope grep string' })
    end
}

