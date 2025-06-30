return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local configs = require('nvim-treesitter.configs')
        configs.setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            }, 
            autotag = {
                enable = true,
            },
            ensure_installed = {
                'lua',
                'c',
                'cpp',
                'cmake',
                'bash',
                'fish',
                'python',
                'markdown',
                'markdown_inline',
                'query',

            },
            auto_install = false,
        })
    end
}
