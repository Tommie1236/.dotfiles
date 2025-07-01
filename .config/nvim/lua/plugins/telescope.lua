return {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        telescope.setup({
            defaults = {
                -- Optional: include hidden files in live_grep
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--hidden", -- this is the important flag
                },
            },
            pickers = {
                find_files = {
                    hidden = true, -- include dotfiles
                },
            },
        })

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep string' })
    end
}

