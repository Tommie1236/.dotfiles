
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.opt.number = true

-- vim.opt.foldmethod=expr
-- vim.opt.foldexpr=nvim_treesitter#foldexpr()

vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
    {
        group = "numbertoggle",
	pattern = "*",
	callback = function()
            if vim.wo.number and vim.fn.mode() ~= "i" then
                vim.wo.relativenumber = true
            end
	end,
    }
)

vim.api.nvim_create_autocmd(
	{ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
	{
		group = "numbertoggle",
		pattern = "*",
		callback = function()
			if vim.wo.number then
				vim.wo.relativenumber = false
			end
		end,
	}
)
