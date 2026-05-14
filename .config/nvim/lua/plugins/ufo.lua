
return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
        vim.o.foldcolumn = '1' -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo, we set a high foldlevel
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        require('ufo').setup()
    end
}
